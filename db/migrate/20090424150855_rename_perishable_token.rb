class RenamePerishableToken < ActiveRecord::Migration
  def self.up
    rename_column :users, :perishable_tken, :perishable_token
  end

  def self.down
    rename_column :users, :perishable_token, :perishable_tken
  end
end
