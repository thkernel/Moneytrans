# == Schema Information
#
# Table name: transferts
#
#  id                                 :bigint           not null, primary key
#  uid                                :string
#  mtcn                               :bigint
#  currency_id                        :bigint
#  reason                             :string
#  amount_incl_tax                    :float            default(0.0)
#  sender_name                        :string
#  sender_first_name                  :string
#  sender_gender                      :string
#  sender_phone                       :string
#  sender_identity_document_type_id   :bigint
#  sender_identity_document_type_code :string
#  sender_country                     :string
#  sender_city                        :string
#  beneficiary_name                   :string
#  beneficiary_first_name             :string
#  beneficiary_gender                 :string
#  beneficiary_phone                  :string
#  beneficiary_country                :string
#  beneficiary_city                   :string
#  withdrawal_date                    :datetime
#  status                             :string
#  account_id                         :bigint           not null
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#

class Transfert < ApplicationRecord

  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :generate_random_mtcn, :set_status

  belongs_to :currency
  belongs_to :account
  has_one :withdrawal

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
  def self.search(mtcn)  
    query = Transfert.order(:created_at)
    #query = query.where("DATE(created_at) BETWEEN ? AND ? ", start_date, end_date) if start_date.present? and  end_date.present?
    #query = query.where("account_id =  ?", account) if account.present?
    #query = query.where("order_type =  ?", order_type) if order_type.present?
    query = query.where("mtcn =  ?", mtcn) if mtcn.present?
     
    query
        
       
  end


  # Search by customer
  def self.search_by_customer(order_type, start_date, end_date,  customer, payment_status)  
    query = Order.order(:created_at)
    query = query.where("DATE(created_at) BETWEEN ? AND ? ", start_date, end_date) if start_date.present? and  end_date.present?
    query = query.where("customer_id =  ?", customer) if customer.present?
    query = query.where("order_type =  ?", order_type) if order_type.present?
    query = query.where("paid =  ?", payment_status) if payment_status.present?
     
    query
        
       
  end
  
end
