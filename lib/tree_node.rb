class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val.to_f
    @left, @right = nil, nil
  end
end