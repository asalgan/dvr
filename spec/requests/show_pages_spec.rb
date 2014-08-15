require 'rails_helper'

describe "Show pages" do

  subject { page }

  let(:user)  { FactoryGirl.create(:user) }
  before { sign_in user }
  before { visit shows_url }

  before do
    @show = Show.create(title: "Show Title", :recording => false, :start_time => Time.now, :end_time => Time.now+30.minutes )
  end

  describe "show page" do

    it { should have_link('Sign out', href: destroy_user_session_path) }
    it { should have_link("← Back to current recordings", href: dvr_systems_path) }
    it { should_not have_link('Sign in', href: new_user_session_path) }
    it { should have_selector(:css, "li.show") } 

    describe "show box when show not recording" do
      it { should have_selector(:css, "span.show-title", text: @show.title) } 
      it { should have_selector(:css, "span.show-channel") } 
      it { should have_selector(:css, "span.show-time") } 
      it { should have_selector(:css, "span.minutes-long") } 
      it { should have_selector(:css, "input.record-button") } 
    end

    describe "show recording" do

      it "should not record show" do
        click_button 'commit'
        expect { click_on 'Record' }.not_to change(@show, :recording)
      end
    end

  end
  
end


