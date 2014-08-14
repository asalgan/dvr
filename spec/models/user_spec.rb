require 'rails_helper'

describe User do

	before do
  	@user = User.new(name: "Example User", email: "user@example.com", password: "foobar123", 
 			password_confirmation: "foobar123")
	end

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

  describe "email address with mixed case" do
  	let(:mixed_case_email) {"Foo@ExAmPle.CoM"}

  	it "should be saved as all lower-case" do
  		@user.email = mixed_case_email
  		@user.save
  		expect(@user.reload.email).to eq mixed_case_email.downcase
  	end
  end

  describe "when email address is already taken" do
  	before do
  		user_with_same_email = @user.dup
  		user_with_same_email.email = @user.email.upcase
  		user_with_same_email.save
  	end
  		it {should_not be_valid}
  	end

  	describe "when password is not present" do
  		before do
  			@user = User.new(name: "Example User", email: "user@example.com",
  								password: " ", password_confirmation: " ")
		end
		it {should_not be_valid}
	end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "password_mismatch" }
		it {should_not be_valid}
	end

	describe "with a password that's too short" do
		before {@user.password = @user.password_confirmation = "z" * 6 }
		it {should be_invalid}
	end


end
