class CreateLibrarians < ActiveRecord::Migration
  def change
    create_table :librarians do |t|
      t.string :name
      t.datetime :birthday

      t.timestamps
    end
  end
end
