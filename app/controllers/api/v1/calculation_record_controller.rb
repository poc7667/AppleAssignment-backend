class Api::V1::CalculationRecordController < ApplicationController


  def index
    @records = CalculationRecord.all
  end
end
