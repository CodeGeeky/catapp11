class Citem < ActiveRecord::Base
  attr_accessible :menu_id, :cart_id, :quantity
  belongs_to :menu
  belongs_to :cart

  validates :quantity, :presence => true
end
