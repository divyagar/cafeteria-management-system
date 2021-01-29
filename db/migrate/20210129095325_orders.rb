class Orders < ActiveRecord::Migration[6.1]
  def change
    create_table "orders", force: :cascade do |t|
      t.date "date"
      t.bigint "user_id"
    end
  end
end
