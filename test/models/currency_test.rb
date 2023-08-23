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

require "test_helper"

class CurrencyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
