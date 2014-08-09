class AddPublishingYearToBooks < ActiveRecord::Migration
  def change
    add_column :books, :publishing_year, :date
  end
end
