class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
    end
  end
end
