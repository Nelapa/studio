class AddPositionToAttachedPhotos < ActiveRecord::Migration
  def self.up
    add_column :attached_photos, :position, :integer
  end

  def self.down
    remove_column :attached_photos, :position
  end
end
