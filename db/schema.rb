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

ActiveRecord::Schema.define(:version => 20130928131924) do

  create_table "applics", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "student"
    t.boolean  "student_magistrant"
    t.boolean  "aspirant"
    t.boolean  "specialist"
    t.boolean  "bachelor"
    t.boolean  "magister"
    t.boolean  "participate_grant"
    t.boolean  "participate_ygf"
    t.boolean  "spec_astronomy"
    t.boolean  "spec_agriculture"
    t.boolean  "spec_aeronaft"
    t.boolean  "spec_biotech_midicine"
    t.boolean  "spec_geology"
    t.boolean  "spec_it"
    t.boolean  "spec_shipbuilding"
    t.boolean  "spec_cryptography"
    t.boolean  "spec_maths"
    t.boolean  "spec_material"
    t.boolean  "spec_carbuilding"
    t.boolean  "spec_medicine"
    t.boolean  "spec_mechanics"
    t.boolean  "spec_nanotech"
    t.boolean  "spec_tutoring"
    t.boolean  "spec_phsyhology"
    t.boolean  "spec_pedology"
    t.boolean  "spec_robototechnics"
    t.boolean  "spec_sociology"
    t.boolean  "spec_building_arcitecture_design"
    t.boolean  "spec_physics"
    t.boolean  "spec_chemistry"
    t.boolean  "spec_energetics_electrotechnics"
    t.string   "spec_other"
    t.string   "fio_rus"
    t.string   "fio_eng"
    t.string   "fio_kor"
    t.string   "post_address"
    t.string   "phone_home"
    t.string   "phone_work"
    t.string   "aksts_events_participation"
    t.boolean  "sex_m"
    t.boolean  "sex_w"
    t.string   "university"
    t.integer  "study_year"
    t.string   "email"
    t.date     "birth"
    t.integer  "aksts_enter_year"
    t.string   "q_your_values"
    t.string   "q_your_contribution"
    t.string   "q_your_problem_solving"
    t.string   "q_antok_interaction"
    t.string   "q_antok_suggestions"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.decimal  "bal_2013_spring"
    t.decimal  "bal_2012_fall"
    t.decimal  "bal_total"
    t.boolean  "social_work_yes"
    t.boolean  "social_work_no"
    t.boolean  "recomendation_antok"
    t.boolean  "recomendation_not_antok"
    t.boolean  "recomendation_no"
    t.boolean  "sent",                             :default => false
  end

  add_index "applics", ["user_id"], :name => "index_applics_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                  :default => false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
