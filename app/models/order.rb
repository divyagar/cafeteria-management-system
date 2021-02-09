class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def getUserName(user_id)
    user = User.find(user_id)
    user.name
  end
end