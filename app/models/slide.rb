class Slide < ActiveRecord::Base
   has_attached_file :photo, :styles => {:medium => "490x334>"},
                    :url => "/assets/slide/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/slide/:id/:style/:basename.:extension"
  
  
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
