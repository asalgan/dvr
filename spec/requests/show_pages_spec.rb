require 'rails_helper'

describe "Show pages" do

  subject { page }

  let(:user)  { FactoryGirl.create(:user) }
  before { sign_in user }
  before { visit shows_url }

  before do
    @show = Show.first
    @box = Box.first
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
          @show.box_id.should be_nil
        end

        it "should not be able to click record" do
          first('.record-button')[:disabled].should eq "disabled"
        end

        it "should be nil if dropdown selected but no option selected" do
          within first(".show-radio-button") do
            first("option").click
            @show.box_id.should be_nil
          end
        end

        it "should run the record method successfully" do
          expect do
            xhr :put, :record, (@show.box_id).should == @box.id
            expect(response).to be_success
          end
        end
      end

      describe "after selecting a box" do

        before do 
          first(".show-radio-button") do
            select "1", from: 'show_box_id'
            find('.record-button').click
            @show.record!
            @show.save
          end
        end

        it "should run the record method" do
          expect { @show.to respond_to(:record) } 
        end

        it "should have a box associated with it" do
          @show.box.should_not be_nil
        end

        it "should have the correct box associated with it" do
          @show.box_id.should = @box.id 
        end


      end

    end

  end
  
end


