class ChangeCareTypeToRecordType < ActiveRecord::Migration[6.0]
  def change
    rename_column :records, :care_type, :record_type
  end
end
