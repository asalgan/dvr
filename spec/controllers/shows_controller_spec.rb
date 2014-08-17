require 'rails_helper'

describe ShowsController do

	let(:show) { FactoryGirl.create(:show) } 
  let(:box)  { FactoryGirl.create(:box)  } 

	describe "recording a show" do

    before { record_show(show) }

    it "should run the record method" do
      expect { show.to respond_to(:record) } 
    end

    it "should have a box associated with it" do
      expect { show.to have(:box_id).to_not be_nil }
    end

    it "should have the correct box associated with it" do
      expect { show.to have(:box_id).to = box.id } 
    end

    it "should have recording be set to true" do
      expect { show.to have(:recording).to be_true } 
    end

	end

	describe "deleting a show recording" do

		before do
    	record_show(show)
    	visit show_delete_record_path(show)
    end

    it "should run the record method" do
      expect { show.to respond_to(:record) } 
    end

    it "should run the delete_record method" do
      expect { show.to respond_to(:delete_record) } 
    end

    it "should not have a box associated with it" do
      expect { show.to have(:box_id).to be_nil }
    end

    it "should have recording be set to false" do
      expect { show.to have(:recording).to be_false } 
    end

	end

	describe "avoiding overlapping shows" do
		let(:other_show) { FactoryGirl.create(:show) }

		before do
    	record_show(show)
    	record_show(other_show)
    end

    it "should record the first show to the box" do
    	expect { show.to have(:recording).to be_true } 
    end

    it "shouldn't record another show at the same time on same box" do
    	expect { other_show.to have(:recording).to be_false } 
    end

  end

end
