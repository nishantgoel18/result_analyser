class CreateDailyResultStats < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_result_stats do |t|
      t.string :subject, default: 'N/A'
      t.decimal :daily_low, min: 0.0, max: 100.0, default: 0.0
      t.decimal :daily_high, min: 0.0, max: 100.0, default: 0.0
      t.integer :result_count, min: 0, default: 0
      t.date :date

      t.timestamps
    end
  end
end
