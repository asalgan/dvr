require 'rails_helper'

describe "Show pages" do

  subject { page }

  let(:user)  { FactoryGirl.create(:user) }
  before { sign_in user }
  before { visit shows_url }

  before do
    @show = Show.create(title: "Show Title", :recording => false, :start_time => Time.now, :end_time => Time.now+30.minutes, :box_id => nil )
  end

  describe "show page" do

    it { should have_link('Sign out', href: destroy_user_session_path            ) }
    it { should have_link("← Back to current recordings", href: dvr_systems_path ) }
    it { should_not have_link('Sign in', href: new_user_session_path             ) }
    it { should have_selector(:css, "li.show"                                    ) } 

    describe "show box when show not recording" do
      it { should have_selector(:css, "span.show-title"            ) } 
      it { should have_selector(:css, "span.show-channel"          ) } 
      it { should have_selector(:css, "span.show-time"             ) } 
      it { should have_selector(:css, "span.minutes-long"          ) } 
      it { should have_selector(:css, "select.show-radio-button"   ) } 
      it { should have_selector(:css, "input.record-button"        ) } 
    end

    describe "show recording" do

      describe "before selecting a box" do

        it "should not have a box associated with it yet" do
          expect(@show.box_id).to eq (nil)
        end

        it "should not be able to click record" do
          first('.record-button')[:disabled].should eq "disabled"
        end

        it "should be nil if dropdown selected but no option selected" do
          within first(".show-radio-button") do
            first("option").click
            expect(@show.box_id).to eq (nil)
          end
        end
      end

      describe "after selecting a box" do

        before do 
          first(".show-radio-button") do
            select "1", from: 'show_box_id'
            find('.record-button').click
          end
        end

        it "should have a box associated with it" do
          expect(@show.box.quantity).to eq (1)
            # expect(@show.box_id).to_not eq (nil)
        end
      end

    end

  end
  
end


