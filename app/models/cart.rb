class Cart < ActiveRecord::Base
  has_many :citem
  belongs_to :user
end
