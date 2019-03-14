class Api::V1::CalculationRecordController < ApplicationController


  def index
    @records = CalculationRecord.all
  end

  def create
    @record = CalculationRecord.new(calculation_params)
    respond_to do |format|
      if @record.save
        format.json { render :show, status: :created}
      else
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calculation_params
      params.require(:record).permit(:input)
    end
end
