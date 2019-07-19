require 'faker'

FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password { Faker::Address.full_address }
    end
end