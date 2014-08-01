class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.belongs_to :reader, index: true

      t.string :identity
      t.string :title
      t.string :author
      t.text :annotation
      t.integer :publishing_year
      t.date :returning_date

      t.timestamps
    end
  end
end
