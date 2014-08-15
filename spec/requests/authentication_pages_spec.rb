require 'rails_helper'

  describe "Authentication" do

    subject { page }

    describe "signin page" do

      before { visit new_user_session_path }

      it { should have_selector('h3', text: 'Sign in') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_link('Sign out', href: destroy_user_session_path) }
      it { should_not have_link('Sign in', href: new_user_session_path) }
      
      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end

    end

    describe "authorization" do

      describe "for non-signed-in users" do
        let(:user) { FactoryGirl.create(:user) }

        describe "after signing in" do
          before do
            visit new_user_session_path
            sign_in user
          end

          it "should render dvr page" do
            page.should have_selector("h1", text: "My Current Recordings")
          end

          it "should have shows link" do
            page.should have_link("All shows", :href => shows_url)
          end
        end

      end 
    end

  end
