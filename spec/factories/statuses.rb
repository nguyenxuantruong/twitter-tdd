# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :status do
    content Faker::Lorem.sentence
  end
end
