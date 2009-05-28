class AddPlaceToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :place, :string
  end

  def self.down
    remove_column :projects, :place
  end
end
