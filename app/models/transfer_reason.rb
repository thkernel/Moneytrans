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

class TransferReason < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :account

  validates :name, presence: true, uniqueness: true

  # Change default params ID to uid
  def to_param
    uid
  end
end
