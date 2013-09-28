class AddPhonenumberToClients < ActiveRecord::Migration
  def change
    add_column :clients, :phonenumber, :string
    add_index :clients, :phonenumber, :unique => true
  end
end
