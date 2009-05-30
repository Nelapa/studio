class AddPositionToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :position, :integer
    
    User.reset_column_information
    
    users = User.find(:all)
    i=1
    users.each do |user|
      user.position = i
      i=i+1
      user.save!
    end
  end

  def self.down
    remove_column :users, :position
  end
end
