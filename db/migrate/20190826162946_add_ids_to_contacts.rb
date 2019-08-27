class AddIdsToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :user_id, :integer
    add_column :contacts, :address_book_id, :integer
  end
end
