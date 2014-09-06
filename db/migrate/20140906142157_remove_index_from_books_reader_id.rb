class RemoveIndexFromBooksReaderId < ActiveRecord::Migration
  def change
      remove_index :books, :reader_id
  end
end
