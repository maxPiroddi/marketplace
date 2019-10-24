json.extract! product, :id, :name, :price, :location, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
