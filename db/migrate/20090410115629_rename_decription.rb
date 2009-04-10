class RenameDecription < ActiveRecord::Migration
  def self.up
    rename_column :users, :decription, :description
  end

  def self.down
    rename_column :users, :description, :decription
  end
end
