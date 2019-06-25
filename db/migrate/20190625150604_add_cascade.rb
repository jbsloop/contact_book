class AddCascade < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :contacts, :address_books
    remove_foreign_key :address_books, :users

    add_foreign_key :contacts, :address_books, on_delete: :cascade
    add_foreign_key :address_books, :users, on_delete: :cascade
  end
end
