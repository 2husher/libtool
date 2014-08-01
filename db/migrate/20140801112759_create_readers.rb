class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.integer :reader_card_id
      t.string :name
      t.datetime :birthday
      t.string :address
      t.text :notes
      t.boolean :is_banned

      t.timestamps
    end
  end
end
