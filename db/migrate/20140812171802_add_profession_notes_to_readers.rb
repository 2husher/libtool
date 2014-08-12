class AddProfessionNotesToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :profession_notes, :text
  end
end
