# == Schema Information
#
# Table name: transfer_reasons
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :string
#  status      :string
#  account_id  :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TransferReasonSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :description, :status
  has_one :account
end
