class RenameStorageId < ActiveRecord::Migration
  def change
    rename_column :storables, :storages_id, :storage_id
  end
end
