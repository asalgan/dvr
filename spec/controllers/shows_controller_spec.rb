require 'rails_helper'

describe ShowsController do

	let(:user) { FactoryGirl.create(:user) }
	
  before do 
  	@show = Show.new(title: "Show Title", :channel => 30, :start_time => Time.now, :end_time => Time.now+30.minutes, :recording => false )
  end

  before { sign_in user }

  describe "recording a show" do
		before { visit shows_path }

  	it "should record a show" do
  		select("1", :from => "show[box_id]")
  		expect { click_link('record-button') }.to change(@show, :recording).to(true)
  	end

  end


end
