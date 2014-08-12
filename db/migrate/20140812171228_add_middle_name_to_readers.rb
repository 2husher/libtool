class AddMiddleNameToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :middle_name, :string
  end
end
