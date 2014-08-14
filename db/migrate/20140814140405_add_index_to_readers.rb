class AddIndexToReaders < ActiveRecord::Migration
  def change
    add_index :readers, :reader_card_id
  end
end
