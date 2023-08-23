# == Schema Information
#
# Table name: withdrawals
#
#  id                                    :bigint           not null, primary key
#  uid                                   :string
#  transfert_id                          :bigint           not null
#  beneficiary_identity_document_type_id :bigint
#  beneficiary_identity_document_code    :string
#  amount_incl_tax                       :float            default(0.0)
#  status                                :string
#  account_id                            :bigint           not null
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#

class WithdrawalSerializer < ActiveModel::Serializer
  attributes :id, :uid, :beneficiary_identity_document_code, :amount_incl_tax, :status
  has_one :transfert
  has_one :beneficiary_identity_document_type
  has_one :account
end
