class HomeController < ApplicationController
	skip_before_filter :authenticate_user!

	def index
		if user_signed_in?
			redirect_to dvr_systems_url
		else
			render 'home/index'
		end
	end

end
