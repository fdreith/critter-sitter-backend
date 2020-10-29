class CreateHouseholds < ActiveRecord::Migration[6.0]
  def change
    create_table :households do |t|
      t.string :name
      t.string :address
      t.integer :owner_id, null: false, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end
