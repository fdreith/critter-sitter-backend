class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :care_reminders, :user_id, :integer
  end
end
