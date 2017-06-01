json.extract! post, :id, :sale_price, :date_listed, :product_id, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
