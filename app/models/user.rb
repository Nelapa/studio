class User < ActiveRecord::Base
  acts_as_list
  acts_as_authentic 
  validates_presence_of :login, :crypted_password, :name, :surname, :description
  
  validates_length_of :login, :maximum => 10
  validates_length_of :name, :maximum => 20
  validates_length_of :surname, :maximum => 20
  validates_length_of :description, :maximum => 200
  
  
  has_many :projects
  
  has_attached_file :thumb,
  :styles => {:thumb=> "59x59>"},
  :url => "/images/users/thumb_:style_:id.:extension",
  :path => ":rails_root/public/images/users/thumb_:style_:id.:extension"
    
  has_attached_file :photo,
  :styles => {:cut=> "207x302>"},
  :url => "/images/users/photo_:style_:id.:extension",
  :path => ":rails_root/public/images/users/photo_:style_:id.:extension"

  def first
    User.find(:first, :order => "position ASC")
  end
  
  def last
    User.find(:first, :order => "position DESC")
  end
  
  #def last?
   # position == User.find(:first, :order => "position DESC").position
  #end
  
   def next
    if self.last?
      first
    else lower_item
    end
  end
  
  def prev
    if self.first?
      last
    else higher_item
    end
  end  

end
