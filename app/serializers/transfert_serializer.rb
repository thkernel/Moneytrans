# == Schema Information
#
# Table name: transferts
#
#  id                                 :bigint           not null, primary key
#  uid                                :string
#  mtcn                               :bigint
#  currency_id                        :bigint
#  reason                             :string
#  amount_incl_tax                    :float            default(0.0)
#  sender_name                        :string
#  sender_first_name                  :string
#  sender_gender                      :string
#  sender_phone                       :string
#  sender_identity_document_type_id   :bigint
#  sender_identity_document_type_code :string
#  sender_country                     :string
#  sender_city                        :string
#  beneficiary_name                   :string
#  beneficiary_first_name             :string
#  beneficiary_gender                 :string
#  beneficiary_phone                  :string
#  beneficiary_country                :string
#  beneficiary_city                   :string
#  withdrawal_date                    :datetime
#  status                             :string
#  account_id                         :bigint           not null
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#

class TransfertSerializer < ActiveModel::Serializer
  attributes :id, :uid, :mtcn, :reason, :amount_incl_tax, :sender_name, :sender_first_name, :sender_gender, :sender_phone, :sender_id_type, :sender_country, :sender_city, :beneficiary_name, :beneficiary_first_name, :beneficiary_gender, :beneficiary_phone, :beneficiary_country, :beneficiary_city, :status
  has_one :currency
  has_one :account
end
