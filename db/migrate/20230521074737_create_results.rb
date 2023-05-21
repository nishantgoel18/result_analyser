class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string :subject
      t.decimal :marks, min: 0.0, max: 100.0, default: 0.0

      t.timestamps
    end
  end
end
