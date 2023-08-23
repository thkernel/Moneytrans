class DashboardController < ApplicationController
	before_action :authenticate_account!
	layout("dashboard")
	
	def index
		puts "DASHBOARD INDEX"
		@total_deposits = 0
		@total_withdrawals = 0
		
		

	end
	
	def show
	end
end