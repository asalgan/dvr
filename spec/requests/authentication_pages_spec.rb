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

      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
      
      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end

    end

    # describe "authorization" do

    #   describe "for non-signed-in users" do
    #     let(:user) { FactoryGirl.create(:user) }
        
    #     describe "when attempting to visit a protected page" do
    #       before do
    #         visit dvr_systems_path(user)
    #         fill_in "Email",    with: user.email
    #         fill_in "Password", with: user.password
    #         click_button "Sign in"
    #       end
    #     end

    #     describe "after signing in" do
    #       it "should render dvr page" do
    #         page.should have_selector("h1", :text => "My Current Recordings")
    #       end
    #     end

      # end 
    # end

  end
