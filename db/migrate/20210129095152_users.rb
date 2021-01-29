class Users < ActiveRecord::Migration[6.1]
  def change
    create_table "users", force: :cascade do |t|
      t.string "name"
      t.string "role"
    end
  end
end
