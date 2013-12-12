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

ActiveRecord::Schema.define(:version => 20131212175311) do

  create_table "create_files", :force => true do |t|
    t.string   "file_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "file_imports", :force => true do |t|
    t.string   "name"
    t.string   "fields"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "last_name"
    t.string   "first_name"
    t.string   "student_id"
    t.string   "course_id"
    t.string   "section_num"
    t.string   "grade"
    t.string   "effort"
    t.string   "conduct"
    t.string   "comment"
    t.string   "grade_2"
    t.string   "grade_3"
    t.string   "grade_4"
    t.string   "grade_5"
    t.string   "comment_2"
    t.string   "comment_3"
    t.string   "comment_4"
    t.string   "comment_5"
    t.text     "comment_text"
  end

  create_table "senior_systems", :force => true do |t|
    t.string   "senior_system_id"
    t.string   "email"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
