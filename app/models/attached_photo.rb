class AttachedPhoto < ActiveRecord::Base
  
  belongs_to :project
  
  has_attached_file :photo,
  #:styles => {
   # :thumb=> "100x100#",
   # :small  => "150x150>",
   # :medium => "300x300!",
   # :large =>   "400x400<" },
    #:missing_url => "/images/rails.png",
    #:default_url => "/images/rails.png",
    :url => "/images/attached/img_:id_:style.:extension",
    :path => ":rails_root/public/images/attached/img_:id_:style.:extension"
  
end
  
   
