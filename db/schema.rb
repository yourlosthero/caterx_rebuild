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

ActiveRecord::Schema.define(version: 20190308132303) do

  create_table "caterers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "mobile_1"
    t.string "mobile_2"
    t.string "mobile_3"
    t.string "tel_1"
    t.string "tel_2"
    t.string "tel_3"
    t.string "code"
    t.string "logo"
    t.string "uid"
    t.string "verified"
    t.string "location"
    t.string "resend"
    t.text "tagline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.string "oauth_token"
    t.string "mobile"
    t.text "bio"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.integer "guests"
    t.integer "price"
    t.string "location"
    t.text "design_amenities"
    t.text "other_amenities"
    t.text "policy"
    t.text "terms"
    t.integer "downpayment"
    t.string "mode_of_payment"
    t.text "food"
    t.integer "caterer_id"
    t.integer "views"
    t.integer "appearances"
    t.string "remember_policy"
    t.string "remember_terms"
    t.string "remember_payment"
    t.string "i1"
    t.string "i2"
    t.string "i3"
    t.string "i4"
    t.string "i5"
    t.string "i6"
    t.string "i7"
    t.string "i8"
    t.string "i9"
    t.string "i10"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
