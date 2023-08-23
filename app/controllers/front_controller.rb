class FrontController < ApplicationController
	layout "front"
	
	def home
		@cities = City.all
	end
end