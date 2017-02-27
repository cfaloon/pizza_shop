class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order
      t.references :menu_item

      t.timestamps null: false
    end
  end
end
