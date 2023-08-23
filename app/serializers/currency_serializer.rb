# == Schema Information
#
# Table name: currencies
#
#  id                 :bigint           not null, primary key
#  uid                :string
#  name               :string
#  iso_code           :string
#  symbol             :string
#  decimal_symbol     :string
#  symbol_position    :string
#  thousand_separator :string
#  status             :string
#  account_id         :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class CurrencySerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :iso_code, :symbol, :decimal_symbol, :symbol_position, :thousand_separator, :status
  has_one :account
end
