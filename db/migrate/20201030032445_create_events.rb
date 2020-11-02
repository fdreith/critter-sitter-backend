class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.belongs_to :pet, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :event_type
      t.string :details
      t.timestamps
    end
  end
end
