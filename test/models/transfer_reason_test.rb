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

require "test_helper"

class TransferReasonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
