class Citem < ActiveRecord::Base
  attr_accessible :menu_id, :cart_id
  belongs_to :menu
  belongs_to :cart
end
