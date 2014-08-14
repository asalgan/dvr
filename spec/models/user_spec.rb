require 'rails_helper'

describe User do

  @user = User.new(name: "Example User", email: "user@example.com", password: "foobar123", 
 		password_confirmation: "foobar123")
end
