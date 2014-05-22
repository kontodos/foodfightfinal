class Restaurant < ActiveRecord::Base
	has_many :foods
	
	has_attached_file :avatar, :styles => { :tile => "280x200", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
