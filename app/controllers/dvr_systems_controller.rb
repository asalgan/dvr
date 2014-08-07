class DvrSystemsController < ApplicationController

  def index
  	@boxes = Box.all
  end
  
end
