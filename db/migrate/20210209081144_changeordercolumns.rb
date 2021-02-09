class Changeordercolumns < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delievered, :boolean
    add_column :orders, :delievered_on, :datetime
  end
end
