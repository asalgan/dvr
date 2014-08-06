class HomeController < ApplicationController

	def index
		if user_signed_in?
			redirect_to dvr_systems_url
		else
			redirect_to root_url
		end
	end

end
