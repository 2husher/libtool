class AddDateOfBirthToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :date_of_birth, :date
  end
end
