class RemovePublishingYearFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :publishing_year, :integer
  end
end
