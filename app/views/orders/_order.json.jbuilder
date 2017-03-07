json.extract! order, :id, :delivery, :status, :user, :created_at, :updated_at
json.url order_url(order, format: :json)
