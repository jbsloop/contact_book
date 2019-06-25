class AddressBook < ApplicationRecord
    has_many :contacts, dependent: :delete_all
    belongs_to :user
end
