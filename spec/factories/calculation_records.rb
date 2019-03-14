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

FactoryGirl.define do
  factory :calculation_record do
    input "MyString"
    result 1
  end
end
