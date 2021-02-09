class Addordercolumns < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :total_amount, :integer
    change_column :orders, :date, :datetime
  end
end
