class RemoveBirthdateFromReaders < ActiveRecord::Migration
  def change
    remove_column :readers, :Birthdate, :date
  end
end
