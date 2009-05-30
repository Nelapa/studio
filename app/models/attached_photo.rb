class AttachedPhoto < ActiveRecord::Base
  
  belongs_to :project
  
  acts_as_list :scope => :project
  
  has_attached_file :photo,
  :styles => {
    :cut=> "498x351>"
   },
    :url => "/images/projects/attached/img_:id_:style.:extension",
    :path => ":rails_root/public/images/projects/attached/img_:id_:style.:extension"
  
end
  
   
