class AddStreetToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :street, :string
  end
end
