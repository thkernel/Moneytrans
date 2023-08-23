json.extract! currency, :id, :uid, :name, :iso_code, :symbol, :decimal_symbol, :symbol_position, :thousand_separator, :status, :account_id, :created_at, :updated_at
json.url currency_url(currency, format: :json)
