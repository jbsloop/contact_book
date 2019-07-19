require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get contact list" do
    user = create(:user)
    address_book = create(:address_book, user: user)

    sign_in user

    get address_book_contacts_url(address_book)
    assert_response :success

    sign_out user
  end

  test "should create contact" do
    user = create(:user)
    address_book = create(:address_book, user: user)

    sign_in user

    get new_address_book_contact_url(address_book, format: :js), xhr: true
    assert_response :success

    assert_difference "Contact.count", 1 do
      contact = build(:contact, address_book: address_book)
      post address_book_contacts_url(contact.address_book), params: { contact: contact.attributes }

      follow_redirect!
      assert_equal address_book_path(address_book), path
    end

    sign_out user
  end

  test "should update contact" do
    user = create(:user)
    address_book = create(:address_book, user: user)
    contact = create(:contact, address_book: address_book)
    
    sign_in user

    get edit_address_book_contact_url(contact.address_book, contact, format: :js), xhr: true
    assert_response :success

    put address_book_contact_url(contact.address_book, contact), params: { contact: contact.attributes }

    follow_redirect!
    assert_equal address_book_path(address_book), path

    sign_out user
  end

  test "should delete contact" do
    user = create(:user)
    address_book = create(:address_book, user: user)
    contact = create(:contact, address_book: address_book)

    sign_in user

    assert_difference "Contact.count", -1 do
      delete address_book_contact_url(contact.address_book, contact)

      follow_redirect!
      assert_equal address_book_path(address_book), path
    end

    sign_out user
  end
end
