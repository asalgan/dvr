class DvrSystemsController < ApplicationController

  def index
  	@box_1 = Box.find_by(:box_number => 1)
  	@box_1_shows = @box_1.shows
  	@box_2 = Box.find_by(:box_number => 2)
  	@box_2_shows = @box_2.shows
  end
  
end
