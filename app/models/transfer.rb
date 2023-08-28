# == Schema Information
#
# Table name: transfers
#
#  id                               :bigint           not null, primary key
#  uid                              :string
#  mtcn                             :bigint
#  transfer_reason_id               :bigint
#  amount_incl_tax                  :float            default(0.0)
#  transfer_currency_id             :bigint
#  standard_rate                    :float            default(0.0)
#  standard_rate_amount             :float            default(0.0)
#  withdrawal_currency_id           :bigint
#  sell_rate                        :float            default(0.0)
#  sell_rate_amount                 :float            default(0.0)
#  gross_profit                     :float            default(0.0)
#  expense                          :float            default(0.0)
#  net_profit                       :float            default(0.0)
#  sender_first_name                :string
#  sender_last_name                 :string
#  sender_gender                    :string
#  sender_phone                     :string
#  sender_identity_document_type_id :bigint
#  sender_identity_document_code    :string
#  sender_country_id                :bigint
#  sender_city                      :string
#  beneficiary_first_name           :string
#  beneficiary_last_name            :string
#  beneficiary_gender               :string
#  beneficiary_phone                :string
#  beneficiary_country_id           :bigint
#  beneficiary_city                 :string
#  withdrawal_date                  :datetime
#  status                           :string
#  account_id                       :bigint           not null
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#

class Transfer < ApplicationRecord

  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :generate_random_mtcn, :set_status, :set_net_profit

  #belongs_to :currency
  belongs_to :account
  belongs_to :transfer_reason
  has_one :withdrawal

  belongs_to :sender_identity_document_type, :foreign_key => "sender_identity_document_type_id", :class_name => "IdentityDocumentType"
  belongs_to :transfer_currency, :foreign_key => "transfer_currency_id", :class_name => "Currency"
  belongs_to :withdrawal_currency, :foreign_key => "withdrawal_currency_id", :class_name => "Currency"

  belongs_to :beneficiary_country, :foreign_key => "beneficiary_country_id", :class_name => "Country"
  belongs_to :sender_country, :foreign_key => "sender_country_id", :class_name => "Country"


  # Change default params ID to uid
  def to_param
    uid
  end

  def set_status
    unless self.status.present?
      self.status = "Actif"
    end  
  end

  def sender_full_name
   
      "#{sender_last_name} #{sender_first_name}"
   
  end

  def beneficiary_full_name
   
      "#{beneficiary_last_name} #{beneficiary_first_name}"
   
  end

  def total
   
      amount_incl_tax + expense
   
  end


  # Search by account
  def self.search(mtcn)  
    query = Transfer.order(:created_at)
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

  private
    def set_standard_rate_amount
      standard_rate_amount = self.standard_rate * self.amount_incl_tax
    end

    def set_sell_rate_amount
      sell_rate_amount = self.sell_rate * self.amount_incl_tax
    end

    def set_gross_profit
      gross_profit = set_sell_rate_amount - set_standard_rate_amount
    end

    def set_net_profit
      self.standard_rate_amount = set_standard_rate_amount
      self.sell_rate_amount = set_sell_rate_amount
      self.gross_profit = set_gross_profit
      self.net_profit = set_gross_profit - self.expense
    end
  
end
