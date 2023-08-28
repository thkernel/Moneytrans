# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  uid        :string
#  name       :string
#  account_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CountrySerializer < ActiveModel::Serializer
  attributes :id, :uid, :name
end
