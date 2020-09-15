class Dropcomment < ActiveRecord::Migration[5.2]
  def up
    drop_table :comment
  end

  def down
    create_table "comment", force: :cascade do |t|
      t.bigint "pictures_id"
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["pictures_id"], name: "index_comment_on_pictures_id"
    end   
  end
end
