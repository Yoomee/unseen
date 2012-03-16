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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120307110247) do

  create_table "mercury_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "title"
    t.text     "text"
    t.boolean  "published",  :default => false
    t.integer  "position"
    t.string   "view_name",  :default => "basic"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "pages", ["parent_id"], :name => "index_pages_on_parent_id"

  create_table "slides", :force => true do |t|
    t.integer  "slideshow_id"
    t.text     "caption"
    t.string   "image_uid"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slides", ["slideshow_id"], :name => "index_slides_on_slideshow_id"

  create_table "slideshows", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slideshows", ["attachable_type", "attachable_id"], :name => "index_slideshows_on_attachable_type_and_attachable_id"

  create_table "snippets", :force => true do |t|
    t.string   "item_type"
    t.integer  "item_id"
    t.string   "name"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "snippets", ["item_type", "item_id"], :name => "index_snippets_on_item_type_and_item_id"

end
