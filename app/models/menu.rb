class Menu < ActiveRecord::Base
  has_attached_file :photo, :styles => {:small => "250x150"},
                    :url => "/assets/slide/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/slide/:id/:style/:basename.:extension",
                    :default_url => "/images/no-picture.png"
  
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  validates :item_name, :presence=>true
  validates :price, :presence => true, 
                    numericality: true
  validates :description, :presence => true
end
