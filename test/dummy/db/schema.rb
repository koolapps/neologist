# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140204012143) do

  create_table "neologist_documents", id: false, force: true do |t|
    t.string   "name",       null: false
    t.string   "gist_id",    null: false
    t.string   "language"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "neologist_documents", ["gist_id"], name: "index_neologist_documents_on_gist_id"
  add_index "neologist_documents", ["name", "gist_id"], name: "index_neologist_documents_on_name_and_gist_id", unique: true
  add_index "neologist_documents", ["name"], name: "index_neologist_documents_on_name"

  create_table "neologist_gists", id: false, force: true do |t|
    t.string   "id",                         null: false
    t.string   "author_id",                  null: false
    t.boolean  "public",      default: true, null: false
    t.text     "description"
    t.boolean  "stale",       default: true, null: false
    t.datetime "fetched_at"
    t.text     "content"
    t.datetime "compiled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "neologist_gists", ["author_id"], name: "index_neologist_gists_on_author_id", unique: true
  add_index "neologist_gists", ["id"], name: "index_neologist_gists_on_id", unique: true

end
