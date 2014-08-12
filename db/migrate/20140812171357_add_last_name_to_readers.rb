class AddLastNameToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :last_name, :string
  end
end
