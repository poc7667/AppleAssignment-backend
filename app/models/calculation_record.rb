# == Schema Information
#
# Table name: calculation_records
#
#  id         :bigint(8)        not null, primary key
#  input      :string
#  result     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  path       :string
#

class CalculationRecord < ApplicationRecord
  attr_accessor :results

  validate :validate_input


  # before_create do
  #   self.calculate
  # end

  def validate_input
    begin
      self.calculate
    rescue Exception => e # Never do this!
      errors.add(:input, "Not valid input.")
    end
  end

  def calculate
    root = self.class.deserialize(self.input)
    result, path = self.class.get_results(root)
    self.result = result
    self.path = path
  end

  def self.deserialize(input = ",1,2,3,#,#,4,5,#,#,#,#")
    toks = input.split(",")
    if toks.length == 0
      raise "error"
    end
    _, val = toks.shift, toks.shift
    if val == '#'
      root = nil
    else
      root = TreeNode.new(val)
    end
    q = [root]
    while q.size > 0
      curr = q.shift
      if curr != nil
        left_child, right_child = toks.shift, toks.shift

        if left_child != '#'
          curr.left = TreeNode.new(left_child)
        else
          curr.left = nil
        end

        if right_child != '#'
          curr.right = TreeNode.new(right_child)
        else
          curr.right = nil
        end
        q.push curr.left
        q.push curr.right
      end
    end
    return root
  end

  def self.DFS(nod, paths = [])
    if nod.left.nil? and nod.right.nil?
      @results.push(paths + [nod.val])
    else
      if not nod.left.nil?
        self.DFS(nod.left, paths.dup.push(nod.val))
      end
      if not nod.right.nil?
        self.DFS(nod.right, paths.dup.push(nod.val))
      end
    end
  end

  def self.get_results(root)
    max_len = 0
    @results = []
    max_sum_of_the_longest_path = 0
    self.DFS(root, [])
    if @results.length == 0
      return max_sum_of_the_longest_path
    else
      @results.each do |a|
        max_len = [max_len, a.length].max
      end

      max_sum_of_the_longest_path = @results.select {|a| a.length == max_len}.map {|x| x.sum}.max
    end
    return max_sum_of_the_longest_path, @results
  end
end
