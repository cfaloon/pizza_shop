class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :delivery
      t.string :customer_name
      t.string :phone_number
      t.json :address
      t.integer :status
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
