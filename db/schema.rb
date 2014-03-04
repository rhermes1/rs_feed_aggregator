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

ActiveRecord::Schema.define(version: 20140305080146) do

  create_table "rsses", force: true do |t|
    t.string   "link"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "tags_topics", id: false, force: true do |t|
    t.integer  "tag_id",     null: false
    t.integer  "topic_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags_topics", ["tag_id"], name: "index_tags_topics_on_tag_id"
  add_index "tags_topics", ["topic_id"], name: "index_tags_topics_on_topic_id"

  create_table "topics", force: true do |t|
    t.string   "topic"
    t.text     "all_rss"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics_tags", id: false, force: true do |t|
    t.integer "topic_id"
    t.integer "tag_id"
  end

  add_index "topics_tags", ["tag_id"], name: "index_topics_tags_on_tag_id"
  add_index "topics_tags", ["topic_id"], name: "index_topics_tags_on_topic_id"

  create_table "topictag", id: false, force: true do |t|
    t.integer  "topic_id",   null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topictag", ["tag_id"], name: "index_topictag_on_tag_id"
  add_index "topictag", ["topic_id"], name: "index_topictag_on_topic_id"

end
