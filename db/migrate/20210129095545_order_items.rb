class OrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table "orderItems", force: :cascade do |t|
      t.bigint "order_id"
      t.bigint "menu_item_id"
      t.string "menu_item_name"
      t.integer "menu_item_price"
    end
  end
end
