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

ActiveRecord::Schema.define(:version => 20110217175333) do

  create_table "allocation", :force => true do |t|
    t.integer  "user_id",                      :null => false
    t.integer  "class_id",                     :null => false
    t.integer  "profile_id",                   :null => false
    t.boolean  "status",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "allocation", ["class_id"], :name => "index_allocation_on_class"
  add_index "allocation", ["profile_id"], :name => "index_allocation_on_profile"
  add_index "allocation", ["user_id"], :name => "index_allocation_on_user"

  create_table "class", :force => true do |t|
    t.integer  "offer_id",                     :null => false
    t.string   "code"
    t.boolean  "status",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class", ["offer_id"], :name => "index_class_on_offer"

  create_table "curriculum_unit", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "code",          :null => false
    t.text     "description"
    t.text     "syllabus"
    t.float    "passing_grade"
    t.integer  "category",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "curriculum_unit", ["category"], :name => "index_curriculum_unit_on_category"
  add_index "curriculum_unit", ["code"], :name => "index_curriculum_unit_on_code", :unique => true

  create_table "enrollment_period", :force => true do |t|
    t.integer  "offer_id",   :null => false
    t.date     "start",      :null => false
    t.date     "end",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", :force => true do |t|
    t.integer  "log_type"
    t.string   "message"
    t.integer  "userId"
    t.integer  "profileId"
    t.integer  "courseId"
    t.integer  "classId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offer", :force => true do |t|
    t.integer  "curriculum_unit_id", :null => false
    t.integer  "course_id"
    t.string   "period"
    t.date     "start",              :null => false
    t.date     "end",                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "offer", ["course_id"], :name => "index_offer_on_course"
  add_index "offer", ["curriculum_unit_id"], :name => "index_offer_on_curriculum_unit"

  create_table "profile", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                              :null => false
    t.string   "email",                                              :null => false
    t.string   "crypted_password",                                   :null => false
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count",                         :default => 0, :null => false
    t.integer  "failed_login_count",                  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                 :limit => 100
    t.string   "nick",                 :limit => 35
    t.date     "birthdate"
    t.string   "enrollment_code",      :limit => 20
    t.string   "status",               :limit => 1
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "special_needs",        :limit => 50
    t.string   "address",              :limit => 100
    t.integer  "address_number"
    t.string   "address_complement",   :limit => 50
    t.string   "address_neighborhood", :limit => 50
    t.string   "zipcode",              :limit => 11
    t.string   "country",              :limit => 100
    t.string   "state",                :limit => 100
    t.string   "city",                 :limit => 100
    t.string   "telephone",            :limit => 20
    t.string   "cell_phone",           :limit => 20
    t.string   "institution",          :limit => 120
    t.boolean  "sex"
    t.string   "cpf",                  :limit => 14
    t.string   "alternate_email"
    t.text     "bio"
    t.text     "interests"
    t.text     "music"
    t.text     "movies"
    t.text     "books"
    t.text     "phrase"
    t.text     "site"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

end
