# == Schema Information
#
# Table name: identity_document_types
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :text
#  status      :string
#  account_id  :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

class IdentityDocumentTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
