class CreateCalculationRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :calculation_records do |t|
      t.string :input
      t.integer :result

      t.timestamps
    end
  end
end
