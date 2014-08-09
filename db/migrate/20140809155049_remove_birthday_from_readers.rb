class RemoveBirthdayFromReaders < ActiveRecord::Migration
  def change
    remove_column :readers, :birthday, :datetime
  end
end
