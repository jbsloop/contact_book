class AddIsFavoriteToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :is_favorite, :boolean, null: false, default: false
  end
end
