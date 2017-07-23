class AddNoteToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :note, :string
  end
end
