class AddFirstNameToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :first_name, :string
  end
end
