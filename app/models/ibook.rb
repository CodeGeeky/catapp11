class Ibook < ActiveRecord::Base
  attr_accessible :user_id, :cart_id
  belongs_to :user
  belongs_to :cart
end
