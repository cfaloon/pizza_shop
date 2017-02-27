class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :delivery
      t.integer :status
      t.references :customer

      t.timestamps null: false
    end
  end
end
