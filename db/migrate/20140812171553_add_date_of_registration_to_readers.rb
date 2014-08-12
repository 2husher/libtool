class AddDateOfRegistrationToReaders < ActiveRecord::Migration
  def change
    add_column :readers, :date_of_registration, :date
  end
end
