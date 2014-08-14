class RemoveReaderCardIdFromReaders < ActiveRecord::Migration
  def change
    remove_column :readers, :reader_card_id, :integer
  end
end
