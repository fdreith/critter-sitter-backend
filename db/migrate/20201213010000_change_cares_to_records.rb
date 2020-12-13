class ChangeCaresToRecords < ActiveRecord::Migration[6.0]
  def change
    rename_table :cares, :records
  end
end
