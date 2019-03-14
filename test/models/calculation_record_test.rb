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

require 'test_helper'

class CalculationRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
