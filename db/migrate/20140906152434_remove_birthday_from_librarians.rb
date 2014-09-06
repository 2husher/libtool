class RemoveBirthdayFromLibrarians < ActiveRecord::Migration
  def change
      remove_column :librarians, :birthday
  end
end
