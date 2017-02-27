json.extract! order_item, :id, :order, :menu_item, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)