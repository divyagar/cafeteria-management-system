class Changeordercolumnname < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :delievered, :delivered
    rename_column :orders, :delievered_on, :delivered_on
  end
end
