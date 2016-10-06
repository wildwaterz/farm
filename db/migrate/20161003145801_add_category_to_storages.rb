class AddCategoryToStorages < ActiveRecord::Migration
  def change
    add_column :storages, :category, :string
  end
end
