class RenameEventsTypeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :record_type, :event_type
  end
end
