class RemoveIndexFromReadersReaderCardId < ActiveRecord::Migration
  def change
      remove_index :readers, :reader_card_id
  end
end
