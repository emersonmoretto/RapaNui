class OperationalSystem < ActiveRecord::Base
  
  has_attached_file :avatar, :styles => { :icon => "22x22>", :mini => "16x16>"}
   
  scope :all, order(:name) 
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
end
