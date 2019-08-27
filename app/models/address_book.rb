class AddressBook < ApplicationRecord
    belongs_to :user
    has_many :contacts, dependent: :delete_all
end
