ActiveRecord::Schema.define(version: 20170717160213) do
  enable_extension "plpgsql"

  create_table "links", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.boolean  "read",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_links_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
