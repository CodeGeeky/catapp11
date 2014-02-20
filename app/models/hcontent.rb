class Hcontent < ActiveRecord::Base
  # attr_accessor :title, :subtitle, :content
  attr_accessible :title, :subtitle, :content
  validates :title, :presence => true
  validates :subtitle, :presence => true
  validates :content, :presence => true
end
