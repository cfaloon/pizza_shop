class AddAddressesToUser < ActiveRecord::Migration
  def change
    add_column :users, :addresses, :json
  end
end
