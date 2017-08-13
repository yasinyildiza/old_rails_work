class HomePageController < ApplicationController
	#before_filter :require_login
	
	def index
	  @towns = []
	end
end
