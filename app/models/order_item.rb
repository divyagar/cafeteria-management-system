class OrderItem < ActiveRecord::Base
  belongs_to :order
  validates :quantity, presence: true

end