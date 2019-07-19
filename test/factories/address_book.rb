require 'faker'

FactoryBot.define do
    factory :address_book do
        name { Faker::Games::Zelda.location }
        description { Faker::Games::Zelda.item }
        user
    end
end