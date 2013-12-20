class Order < ActiveRecord::Base
  has_many :menus
  belongs_to :user
end
