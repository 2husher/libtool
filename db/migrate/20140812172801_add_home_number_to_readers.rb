class AddHomeNumberToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :home_number, :integer
  end
end
