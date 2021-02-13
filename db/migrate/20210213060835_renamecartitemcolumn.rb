class Renamecartitemcolumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :menu_id, :menu_item_id
  end
end
