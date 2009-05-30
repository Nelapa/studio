class DeleteBirthDateFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :birth_date
  end

  def self.down
    add_column :users, :birth_date
  end
end
