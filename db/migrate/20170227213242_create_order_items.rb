class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.reference :order
      t.reference :menu_item

      t.timestamps null: false
    end
  end
end
