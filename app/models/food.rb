class Food < ActiveRecord::Base
	belongs_to :restaurant
	
  has_attached_file :avatar, :styles => { :large => "250x250", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
