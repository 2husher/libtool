class AddBirthdayToLibrarians < ActiveRecord::Migration
  def change
    add_column :librarians, :birthday, :date
  end
end
