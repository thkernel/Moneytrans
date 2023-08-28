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

class Company < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid


  validates :name, presence: true, uniqueness: true

  belongs_to :account

  # Change default params ID to uid
  def to_param
    uid
  end
  
end
