class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :mall
      t.string :logo
      t.string :background
      t.integer :onlines
      t.references :store_manager

      t.timestamps
    end
    add_index :stores, :store_manager_id
  end
end
