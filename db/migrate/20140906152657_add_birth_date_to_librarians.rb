class AddBirthDateToLibrarians < ActiveRecord::Migration
  def change
    add_column :librarians, :birth_date, :date
  end
end
