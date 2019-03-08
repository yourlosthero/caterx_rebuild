json.extract! customer, :id, :provider, :uid, :name, :email, :avatar, :oauth_token, :mobile, :bio, :oauth_expires_at, :created_at, :updated_at
json.url customer_url(customer, format: :json)
