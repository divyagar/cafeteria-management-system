class Menus < ActiveRecord::Migration[6.1]
  def change
    create_table "menus", force: :cascade do |t|
      t.string "name"
    end
  end
end
