class User < ActiveRecord::Base
  
  acts_as_authentic 
  validates_presence_of :login, :crypted_password, :name, :surname
  
  has_many :projects
end
