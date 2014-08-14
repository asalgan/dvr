FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Bob" }
    sequence(:email) { |n| "bob@example.com"}
    password "foobar123"
    password_confirmation "foobar123"
  end
end