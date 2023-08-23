json.extract! withdrawal, :id, :uid, :transfert_id, :beneficiary_identity_document_type_id, :beneficiary_identity_document_code, :amount_incl_tax, :status, :account_id, :created_at, :updated_at
json.url withdrawal_url(withdrawal, format: :json)
