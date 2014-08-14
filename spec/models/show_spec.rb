require 'rails_helper'

describe Show do

  let(:user) { FactoryGirl.create(:user) }
  before { @show = user.shows.build(title: "Show Title", :channel => 30, ) }



end
