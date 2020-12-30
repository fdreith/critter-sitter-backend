class RemoveAttachmentColumnFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :attachment
  end
end
