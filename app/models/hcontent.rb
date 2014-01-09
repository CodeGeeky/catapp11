class Hcontent < ActiveRecord::Base
  validates :title, :presence => true
  validates :subtitle, :presence => true
  validates :content, :presence => true
end
