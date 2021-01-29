class MenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table "menuitems", force: :cascade do |t|
      t.bigint "menu_id"
      t.string "name"
      t.text "description"
      t.integer "price"
    end
  end
end
