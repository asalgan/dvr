require 'rails_helper'

describe "Show pages" do

  subject { page }

  let(:user)  { FactoryGirl.create(:user) }
  before { sign_in user }

  # before do
  #   @dvr_system = DvrSystem.new(:user_id => user.id)
  #   @box = Box.new(:box_number => 1, :dvr_system_id => @dvr_system.id)
  #   @show = Show.new(title: "Show Title", :channel => 30, :box_id => @box.id )
  # end


  describe "show recording" do
    before { visit shows_path }

    it "should not record show" do
      expect { click_button "Record" }.not_to change(Show, :recording)
    end

  end
  
end