# == Schema Information
#
# Table name: department_services
#
#  id            :bigint           not null, primary key
#  uid           :string
#  department_id :bigint           not null
#  service_id    :bigint           not null
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class DepartmentService < ApplicationRecord
  belongs_to :department
  belongs_to :service
  #belongs_to :account
end
