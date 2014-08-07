require 'spec_helper'

describe User do

	before do
 		@user = User.new(name: "Example User", email: "user@example.com", password: "examplepass", 
 						password_confirmation: "examplepass")
 	end

 	subject { @user }

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}

  describe "when name is not present" do
  	before {@user.name = " "}
  	it {should_not be_valid}
  end

  describe "when email is not present" do
  	before {@user.email = " " }
  	it {should_not be_valid}
  end

  describe "when email format is invalid" do
  	it "should be invalid" do
  		addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
  		addresses.each do |invalid_address|
  			@user.email = invalid_address
  			expect(@user).not_to be_valid
  		end
  	end
  end

  describe "when email format is valid" do
  	it "should be valid" do
  		addresses = %w[user@foo.COM A_US-ER@f.org frst.lst@foo.jp]
  		addresses.each do |valid_address|
  			@user.email = valid_address
  			expect(@user).to be_valid
  		end
  	end
  end

end