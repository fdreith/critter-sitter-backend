class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.belongs_to :pet, null: false, foreign_key: true
      t.string :record_type
      t.string :details
      t.timestamps
    end
  end
end
