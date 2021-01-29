class OrderItem < ActiveRecord::Base
  self.table_name = 'orderItems'
  belongs_to :order
  belongs_to :menu_item

end