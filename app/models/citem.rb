class Citem < ActiveRecord::Base
  belongs_to :menu
  belongs_to :cart
end
