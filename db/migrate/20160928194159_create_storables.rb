class CreateStorables < ActiveRecord::Migration
  def change
    create_table :storables do |t|
      t.integer :size
      t.integer :storage_id
      t.date :birthdate
      t.integer :weight
      t.timestamps null: false
    end
  end
end
