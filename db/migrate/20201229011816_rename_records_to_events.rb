class RenameRecordsToEvents < ActiveRecord::Migration[6.0]
  def change
    rename_table :records, :events
  end
end
