require "application_system_test_case"

class AddressBooksTest < ApplicationSystemTestCase
  setup do
    @address_book = address_books(:one)
  end

  test "visiting the index" do
    visit address_books_url
    assert_selector "h1", text: "Address Books"
  end

  test "creating a Address book" do
    visit address_books_url
    click_on "New Address Book"

    fill_in "Description", with: @address_book.description
    fill_in "Name", with: @address_book.name
    fill_in "User", with: @address_book.user_id
    click_on "Create Address book"

    assert_text "Address book was successfully created"
    click_on "Back"
  end

  test "updating a Address book" do
    visit address_books_url
    click_on "Edit", match: :first

    fill_in "Description", with: @address_book.description
    fill_in "Name", with: @address_book.name
    fill_in "User", with: @address_book.user_id
    click_on "Update Address book"

    assert_text "Address book was successfully updated"
    click_on "Back"
  end

  test "destroying a Address book" do
    visit address_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address book was successfully destroyed"
  end
end
