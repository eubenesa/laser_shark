FactoryGirl.define do
  factory :student do
  	first_name Faker::Name.first_name
  	last_name Faker::Name.last_name
  	email Faker::Internet.safe_email
  	sequence(:phone_number) { |n| "#{n%10}"*10 }
  	twitter Faker::Internet.user_name
  	skype Faker::Internet.user_name
  	sequence(:uid) { |n| "#{n}" }
  	sequence(:token) { |n| "#{n}" }
  end
end