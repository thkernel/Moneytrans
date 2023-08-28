# == Schema Information
#
# Table name: companies
#
#  id            :bigint           not null, primary key
#  uid           :string
#  name          :string
#  social_reason :string
#  address       :string
#  city          :string
#  phone         :string
#  po_box        :string
#  postal_code   :string
#  email         :string
#  account_id    :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CompanySerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :social_reason, :address, :city, :phone, :po_box, :postal_code, :email
  has_one :account
end
