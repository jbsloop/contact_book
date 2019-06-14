class CreateAddressBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :address_books do |t|
      t.string :name
      t.text :description
      t.integer :user_id

      t.timestamps
    end

    remove_column :contacts, :user_id
    add_column :contacts, :address_book_id, :integer
    
    add_foreign_key :contacts, :address_books
    add_foreign_key :address_books, :users
  end
end