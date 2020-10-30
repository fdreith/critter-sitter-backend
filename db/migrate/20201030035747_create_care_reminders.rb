class CreateCareReminders < ActiveRecord::Migration[6.0]
  def change
    create_table :care_reminders do |t|
      t.belongs_to :pet, null: false, foreign_key: true
      t.string :type
      t.string :details
      t.datetime :date

      t.timestamps
    end
  end
end
