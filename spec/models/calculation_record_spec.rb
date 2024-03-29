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

require 'rails_helper'

RSpec.describe CalculationRecord, type: :model do

  it 'can handle empty input' do
    record = CalculationRecord.create(:input=> "")
    expect(CalculationRecord.count).to eq(0)
    expect(record.path).to eq(nil)
    expect(record.errors["input"][0]).to eq("Not valid input.")
  end

  it 'invalid input' do
    record = CalculationRecord.create(:input=> "1,2,3,#,#,224,11,3,#,23,#")
    expect(CalculationRecord.count).to eq(0)
    expect(record.path).to eq(nil)
    expect(record.errors["input"][0]).to eq("Not valid input.")
  end

  it 'can handle normal results' do
    record = CalculationRecord.create(:input=> ",1,2,3,#,#,4,5,#,#,#,#")
    expect(CalculationRecord.count).to eq(1)
    expect(record.path).to eq("[[1.0, 2.0], [1.0, 3.0, 4.0], [1.0, 3.0, 5.0]]")
    expect(record.result).to eq(9)

    record = CalculationRecord.create(:input=> "1,2,3,#,#,4,5,#,#,#,#")
    expect(CalculationRecord.count).to eq(2)
    expect(record.path).to eq("[[1.0, 2.0], [1.0, 3.0, 4.0], [1.0, 3.0, 5.0]]")
    expect(record.result).to eq(9)
  end
end
