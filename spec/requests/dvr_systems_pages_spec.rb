require 'rails_helper'

describe "DVR Systems pages" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	let(:show) { FactoryGirl.create(:show) } 
  let(:box)  { FactoryGirl.create(:box) }

  describe "index" do

    before { sign_in user }

  	it { should have_selector('h3', text: "DVR Box 1" ) }
  	it { should have_selector('h3', text: "DVR Box 2" ) }
  	it { should have_link('All shows', href: shows_url  ) }
    it { should have_link('Sign out', href: destroy_user_session_path            ) }
    it { should_not have_link('Sign in', href: new_user_session_path             ) }

  	describe "before any shows are being recorded" do
  		it { should have_selector('li', text: "There aren't any shows being recorded on this box. You can start recording shows by clicking 'ALL SHOWS'" ) }
  		it { should_not have_selector(:css, "li.shows-list-item" ) }
  	end

  	describe "after shows are being recorded" do 

  		before do
  			record_show(show)
  		end

  		it "should now have shows listed" do
  			box.shows.each do |show|
  				expect(page).to have_selector("li", text: show.title)
  				expect(page).to have_selector("li", text: "#{show.start_time.strftime('%I:%M%P')} - #{show.end_time.strftime('%I:%M%P')}")
  				expect(page).to have_selector("li", text: show.channel)
  				expect(page).to have_link("Cancel", href: show_delete_record_path(show))
  			end
  		end
  	end

  end

end