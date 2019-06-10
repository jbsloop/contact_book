class AddPhoneNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :phone_number, :string
    add_column :contacts, :address, :string
  end
end
