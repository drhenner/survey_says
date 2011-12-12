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

ActiveRecord::Schema.define(:version => 20111211175518) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.text     "details"
    t.boolean  "active"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.text     "details"
    t.boolean  "active"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", :force => true do |t|
    t.integer  "answer_id"
    t.integer  "survey_property_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_properties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_answers", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "answer_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_answers", ["answer_id"], :name => "index_user_answers_on_answer_id"
  add_index "user_answers", ["user_id"], :name => "index_user_answers_on_user_id"

  create_table "users", :force => true do |t|
    t.string "name"
  end

end
