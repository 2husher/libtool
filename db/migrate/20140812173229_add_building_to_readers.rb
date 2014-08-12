class AddBuildingToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :building, :integer
  end
end
