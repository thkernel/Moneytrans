class DashboardController < ApplicationController
	before_action :authenticate_account!
	layout("dashboard")
	
	def index
		puts "DASHBOARD INDEX"
		@total_deposits = 0
		@total_withdrawals = Withdrawal.count
		@total_transfers = Transfer.count
		@total_customers = Customer.count
		
		@transfers = Transfer.take(10)
		@withdrawals = Withdrawal.take(10)

	end
	
	def show
	end
end