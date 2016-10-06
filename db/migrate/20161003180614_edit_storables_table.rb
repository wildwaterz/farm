class EditStorablesTable < ActiveRecord::Migration
  def change
    add_column :storables, :category, :string
    remove_column :storables, :birthdate
  end
end
