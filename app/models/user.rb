# add "Add User" instead of sign up

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  
  has_many :orders
  has_many :cart_items
  has_secure_password

end