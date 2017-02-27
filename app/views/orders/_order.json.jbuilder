json.extract! order, :id, :delivery, :status, :customer, :created_at, :updated_at
json.url order_url(order, format: :json)