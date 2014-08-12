class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :homepage_background

	def keep_controllers
    ["home", "sessions", "registrations", "passwords"]
  end

  def homepage_background
  	if keep_controllers.include?(controller_name)
  		@page_class = "homepage"
  	end
  end

end


