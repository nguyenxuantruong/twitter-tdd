# Read about factories at https://github.com/thoughtbot/factory_girl
require'faker'

FactoryGirl.define do
	my_pass = Faker::Internet.password
  factory :user do
    email Faker::Internet.email
    password my_pass
    password_confirmation my_pass

    factory :user_mismatch do
	  	email Faker::Internet.email
	  	password my_pass
	  	password_confirmation my_pass + "abc"
	  end
  end
end
