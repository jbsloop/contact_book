require 'test_helper'

class IntegrationTestTest < ActionDispatch::IntegrationTest
  fixtures :users, :address_books

  test "should create address book" do
    user = create(:user)
    sign_in user

    get new_address_book_url(format: :js), xhr: true
    assert_response :success

    assert_difference 'AddressBook.count', 1 do
      address_book = build(:address_book, user: user)
      post address_books_url, params: { address_book: address_book.attributes }

      follow_redirect!
      assert_equal address_books_path, path
      assert_response :success
    end

    sign_out user
  end

  test "should update address book" do
    user = create(:user)
    address_book = create(:address_book, user: user)
    
    sign_in user
    
    get edit_address_book_url(address_book, format: :js), xhr: true
    assert_response :success
    
    put address_book_url(address_book), params: { address_book: address_book.attributes }

    follow_redirect!
    assert_equal address_books_path, path
    assert_response :success
    
    sign_out user
  end
  
  test "should delete address book" do
    user = create(:user)
    address_book = create(:address_book, user: user)

    sign_in user
    
    assert_difference "AddressBook.count", -1 do
      delete address_book_url(address_book)

      follow_redirect!
      assert_equal address_books_path, path
      assert_response :success
    end

    sign_out user
  end

end