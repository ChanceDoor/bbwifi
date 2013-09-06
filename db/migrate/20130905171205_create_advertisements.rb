class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :name
      t.integer :position
      t.string :image_path
      t.string :link_path
      t.references :store_manager

      t.timestamps
    end
    add_index :advertisements, :store_manager_id
  end
end
