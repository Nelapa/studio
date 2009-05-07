class Project < ActiveRecord::Base
  
  validates_presence_of :title, :description, :author_id
  
  belongs_to :user
  has_many :attached_photos
  
  has_attached_file :thumb,
  :url => "/images/projects/thumb_:id.:extension",
    :path => ":rails_root/public/images/projects/thumb_:id.:extension"
      
end
