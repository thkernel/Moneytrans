# == Schema Information
#
# Table name: withdrawals
#
#  id                                    :bigint           not null, primary key
#  uid                                   :string
#  transfer_id                           :bigint           not null
#  beneficiary_identity_document_type_id :bigint
#  beneficiary_identity_document_code    :string
#  amount_incl_tax                       :float            default(0.0)
#  status                                :string
#  account_id                            :bigint           not null
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#

class Withdrawal < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate
  
  before_save :generate_random_number_uid, :set_status

  belongs_to :transfer
  #belongs_to :beneficiary_identity_document_type
  belongs_to :account

  has_one_attached :beneficiary_identity_document

  # Change default params ID to uid
  def to_param
    uid
  end

  

  def set_status
    unless self.status.present?
      self.status = "Actif"
    end  
  end


   # Search by account
  def self.search(start_date, end_date)  
    query = Withdrawal.order(:created_at)
    query = query.where("DATE(created_at) BETWEEN ? AND ? ", start_date, end_date) if start_date.present? and  end_date.present?
    #query = query.where("account_id =  ?", account) if account.present?
    #query = query.where("order_type =  ?", order_type) if order_type.present?
    #query = query.where("mtcn =  ?", mtcn) if mtcn.present?
     
    query
        
       
  end

end
