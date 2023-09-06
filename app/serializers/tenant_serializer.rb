class TenantSerializer < ActiveModel::Serializer
  attributes :id, :uid, :status
  has_one :account
end
