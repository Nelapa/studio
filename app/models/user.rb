class User < ActiveRecord::Base
  
  acts_as_authentic 
  validates_presence_of :login, :crypted_password, :name, :surname, :description
  
  has_many :projects
  
  has_attached_file :thumb,
  :url => "/images/users/thumb_:id.:extension",
    :path => ":rails_root/public/images/users/thumb_:id.:extension"
    
  has_attached_file :photo,
  :url => "/images/users/photo_:id.:extension",
    :path => ":rails_root/public/images/users/photo_:id.:extension"
end
