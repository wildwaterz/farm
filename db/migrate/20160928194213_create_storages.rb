class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|

      t.integer :capacity
      t.integer :farm_id
      t.timestamps null: false
    end
  end
end
