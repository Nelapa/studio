class User < ActiveRecord::Base
  
  acts_as_authentic 
  validates_presence_of :login, :crypted_password, :name, :surname, :description
  
  has_many :projects
  
  has_attached_file :thumb,
  :styles => {:thumb=> "59x59"},
  :url => "/images/users/thumb_:style_:id.:extension",
  :path => ":rails_root/public/images/users/thumb_:style_:id.:extension"
    
  has_attached_file :photo,
  :styles => {:cut=> "207x302"},
  :url => "/images/users/photo_:style_:id.:extension",
  :path => ":rails_root/public/images/users/photo_:style_:id.:extension"
end
