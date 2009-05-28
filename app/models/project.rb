class Project < ActiveRecord::Base
  
  validates_presence_of :title, :description, :author_id
  validates_inclusion_of :section, :in => 1..4


  belongs_to :user
  has_many :attached_photos
  
  has_attached_file :thumb,
  :url => "/images/projects/thumb_:id.:extension",
    :path => ":rails_root/public/images/projects/thumb_:id.:extension"
      
end
