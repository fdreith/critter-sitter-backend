class CreateCares < ActiveRecord::Migration[6.0]
  def change
    create_table :cares do |t|
      t.integer :care_type
      t.string :name
      t.string :details
      t.integer :pet_id
      t.integer :user_id
      t.datetime :date
      t.string :attachment

      t.timestamps
    end
  end
end
