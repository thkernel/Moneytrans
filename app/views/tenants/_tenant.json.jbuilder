json.extract! tenant, :id, :social_reason, :name, :address, :phone, :country_id, :city, :phone, :email, :website, :subdomain, :status, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
