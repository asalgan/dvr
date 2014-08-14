class DvrSystemsController < ApplicationController

  def index
  	@page_class = "show_page"

  	@box_1 = Box.find_by(:box_number => 1)
  	if @box_1.shows.present?
  		@box_1_shows = @box_1.shows.where(:recording => true)
  	end
  	
  	@box_2 = Box.find_by(:box_number => 2)
  	if @box_2.shows.present?
  		@box_2_shows = @box_2.shows.where(:recording => true)
  	end
  end
  
end
