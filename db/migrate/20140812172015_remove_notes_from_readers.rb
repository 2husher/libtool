class RemoveNotesFromReaders < ActiveRecord::Migration
  def change
    remove_column :readers, :notes, :text
  end
end
