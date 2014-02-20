class Slide < ActiveRecord::Base
	attr_accessible :title, :description, :photo

	has_attached_file :photo, :styles => {:medium => "960x655>"},
	            :url => "/assets/slide/:id/:style/:basename.:extension",
	            :path => ":rails_root/public/assets/slide/:id/:style/:basename.:extension"


	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

	validates :title, :presence => true
	validates :description, :presence => true
	validates :photo, :presence => true
end
