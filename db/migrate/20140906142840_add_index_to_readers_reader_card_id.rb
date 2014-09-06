class AddIndexToReadersReaderCardId < ActiveRecord::Migration
  def change
      add_index :readers, :reader_card_id, unique: true
  end
end
