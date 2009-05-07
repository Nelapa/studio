class AddProjectIdToAttachedPhotos < ActiveRecord::Migration
  def self.up
    add_column :attached_photos, :project_id, :integer
  end

  def self.down
    remove_column :attached_photos, :project_id
  end
end
