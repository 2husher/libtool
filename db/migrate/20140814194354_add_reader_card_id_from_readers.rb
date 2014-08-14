class AddReaderCardIdFromReaders < ActiveRecord::Migration
  def change
    add_column :readers, :reader_card_id, :string
    add_index :readers, :reader_card_id
  end
end
