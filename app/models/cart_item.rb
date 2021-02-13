class CartItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu_item
  validates :quantity, presence: true

  def cartitem_info(menu_item_id)
    @menuitem = MenuItem.find(menu_item_id)
    @menuitem
  end
end