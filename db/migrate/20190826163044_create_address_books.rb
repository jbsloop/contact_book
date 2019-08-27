class CreateAddressBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :address_books do |t|
      t.string :name
      t.text :description
      t.integer :user_id
    end
  end
end
