class RemoveAddressFromReaders < ActiveRecord::Migration
  def change
    remove_column :readers, :address, :string
  end
end
