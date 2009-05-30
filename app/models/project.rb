class Project < ActiveRecord::Base
  
  validates_presence_of :title, :description, :author_id, :section_id
  validates_inclusion_of :section_id, :in => 1..4
  
  validates_length_of :title, :maximum=>50
  validates_length_of :place, :maximum=>70
  validates_length_of :description, :maximum=>200

  belongs_to :user
  has_many :attached_photos, :order => :position
  
  acts_as_list :scope => :section_id
  
  has_attached_file :thumb,
  :styles => {:thumb=> "59x59>"},
  :url => "/images/projects/:style_:id.:extension",
    :path => ":rails_root/public/images/projects/:style_:id.:extension"
  
   def first_in_section
    Project.find(:first, :conditions => "section_id = " + self.section_id.to_s, :order => "position ASC")
  end
  
  def last_in_section
    Project.find(:first, :conditions => "section_id = " + self.section_id.to_s,  :order => "position DESC")
  end

  
  #def last?
   # position == User.find(:first, :order => "position DESC").position
  #end
  
   def next
    if self.last?
      first_in_section
    else lower_item
    end
  end
  
  def prev
    if self.first?
      last_in_section
    else higher_item
    end
  end 

end
