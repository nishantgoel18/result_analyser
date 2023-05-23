class CreateMonthlyResultAverages < ActiveRecord::Migration[7.0]
  def change
    create_table :monthly_result_averages do |t|
      t.date :date
      t.string :month, default: 'N/A'
      t.string :subject, default: 'N/A'
      t.decimal :monthly_avg_low, min: 0.0, max: 100.0, default: 0.0
      t.decimal :monthly_avg_high, min: 0.0, max: 100.0, default: 0.0
      t.integer :monthly_result_count_used, min: 0, default: 0

      t.timestamps
    end
  end
end
