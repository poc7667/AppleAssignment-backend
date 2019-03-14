class AddPathToCalculationRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :calculation_records, :path, :string
  end
end
