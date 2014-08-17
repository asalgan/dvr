require 'rails_helper'

describe "DVR Systems pages" do

	subject { page }

	let(:show) { FactoryGirl.create(:show) } 
  let(:box)  { FactoryGirl.create(:box)  }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }

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
  			show.save!
  			click_link '← Back to current recordings'
  		end

  		it "should now have shows listed" do
  			page.should have_selector(:css, "li.shows-list-item" )
  		end
  		# it { should_not have_selector('li', text: "There aren't any shows being recorded on this box. You can start recording shows by clicking 'ALL SHOWS'" ) }
  	end

  end

end