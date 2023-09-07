# == Schema Information
#
# Table name: roles
#
#  id          :bigint           not null, primary key
#  uid         :string
#  name        :string
#  description :text
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ApplicationRecord
    #include PgSearch::Model
  # Include shared utils.
  include SharedUtils::Generate



  before_save :generate_random_number_uid

  has_many :permissions, dependent: :destroy
  has_many :accounts, dependent: :destroy 
 

    validates :name, presence: true, uniqueness: true

end
