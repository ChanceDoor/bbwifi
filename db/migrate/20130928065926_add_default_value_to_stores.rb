class AddDefaultValueToStores < ActiveRecord::Migration
  def up
    change_column :stores,:onlines,:integer,:default => 0
  end

  def down
    change_column :stores,:onlines,:integer,:default => nil
  end
end
