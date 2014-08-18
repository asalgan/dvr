FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Bob" }
    sequence(:email) { |n| "bob@example.com"}
    password "foobar123"
    password_confirmation "foobar123"
  end

  factory :show do
  	title "Show Title"
  	start_time Time.now
  	end_time Time.now+30.minutes
  	recording false
  	box_id nil
  end

  factory :box do
  	box_number 1
    dvr_system
  end

  factory :dvr_system do
    user
  end

end