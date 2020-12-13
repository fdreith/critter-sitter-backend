class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :pets, :care, :care_instructions
  end
end
