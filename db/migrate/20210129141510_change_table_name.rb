class ChangeTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table :menuItems, :menuitems
    rename_table :orderItems, :orderitems
  end
end
