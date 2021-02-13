class CartItems < ActiveRecord::Migration[6.1]
  def change
    create_table "cart_items", force: :cascade do |t|
      t.bigint "user_id"
      t.bigint "menu_id"
    end
  end
end
