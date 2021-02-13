class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def getUserName(user_id)
    user = User.find(user_id)
    user.name
  end

  def self.pending_orders
    where(delivered: false)
  end

  def self.delivered_orders
    where(delivered: true)
  end

  def self.pending_orders_for(user)
    pending_orders.where(user: user)
  end

  def self.delivered_orders_for(user)
    delivered_orders.where(user: user)
  end
end