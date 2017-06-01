json.extract! user, :id, :user_name, :date_of_birth, :password_digest, :email, :is_admin, :created_at, :updated_at
json.url user_url(user, format: :json)
