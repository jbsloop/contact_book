class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_address_books
    before_action :set_contacts


    def set_address_books
        if current_user
            @address_books = current_user.address_books
        end
    end

    def set_contacts
        if current_user
            @address_books_favorites = {}
            @address_books.each do |address_book|
                @address_books_favorites[address_book.name] = [address_book.contacts.where(is_favorite: true).pluck(:id, :first_name, :last_name)]
            end
        end
    end
end
