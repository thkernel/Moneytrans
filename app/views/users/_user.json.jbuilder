json.extract! user, :id, :uid, :first_name, :last_name, :gender, :phone, :main_service, :description, :status, :account_id, :created_at, :updated_at
json.url user_url(user, format: :json)
