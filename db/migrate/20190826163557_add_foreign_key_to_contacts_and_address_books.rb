class AddForeignKeyToContactsAndAddressBooks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :contacts, :address_books, on_delete: :cascade
    add_foreign_key :contacts, :users, on_delete: :cascade
    add_foreign_key :address_books, :users, on_delete: :cascade
  end
end
