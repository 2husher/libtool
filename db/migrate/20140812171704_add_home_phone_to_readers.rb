class AddHomePhoneToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :home_phone, :string
  end
end
