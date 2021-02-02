class Changetablename < ActiveRecord::Migration[6.1]
  def change
    rename_table :menuitems, :menu_items
    rename_table :orderitems, :order_items
  end
end
