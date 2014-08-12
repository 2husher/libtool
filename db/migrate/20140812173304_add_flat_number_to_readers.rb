class AddFlatNumberToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :flat_number, :integer
  end
end
