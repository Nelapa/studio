class AttachedPhoto < ActiveRecord::Base
  
  belongs_to :project
  
  has_attached_file :photo,
  :styles => {
    :cut=> "498x320>"
   },
    :url => "/images/attached/img_:id_:style.:extension",
    :path => ":rails_root/public/images/attached/img_:id_:style.:extension"
  
end
  
   
