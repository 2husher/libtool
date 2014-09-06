class AddIndexToBooksIndentity < ActiveRecord::Migration
  def change
      add_index :books, :identity, unique: true
  end
end
