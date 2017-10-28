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

ActiveRecord::Schema.define(version: 20171020160435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_src", primary_key: "datasrc_id", id: :string, limit: 6, force: :cascade, comment: "Sources Of Data DATA_SRC" do |t|
    t.string "authors", limit: 255
    t.string "title", limit: 255
    t.integer "year"
    t.string "journal", limit: 150
    t.string "volume_city", limit: 20
    t.string "issue_state", limit: 5
    t.string "start_page", limit: 5
    t.string "end_page", limit: 5
    t.index ["datasrc_id"], name: "data_sources_DataSrc_Id_uindex", unique: true
  end

  create_table "datsrcln", primary_key: ["nbd_no", "nutr_no", "datasrc_id"], force: :cascade, comment: "DATSCRLN" do |t|
    t.integer "nbd_no", null: false
    t.integer "nutr_no", null: false
    t.string "datasrc_id", limit: 6, null: false
  end

  create_table "deriv_cd", primary_key: "deriv_cd", id: :string, limit: 4, force: :cascade, comment: "Data Derivation Code Description File DERIV_CD" do |t|
    t.string "description", limit: 120
  end

  create_table "fd_group", primary_key: "fdgrp_cd", id: :integer, limit: 2, default: nil, force: :cascade, comment: "Food Group Description File FD_GROUP" do |t|
    t.string "description", limit: 100
    t.index ["fdgrp_cd"], name: "food_groups_FdGrp_Cd_uindex", unique: true
  end

  create_table "food_des", primary_key: "nbd_no", id: :integer, default: nil, force: :cascade do |t|
    t.integer "fdgrp_cd", limit: 2
    t.string "long_description", limit: 255
    t.string "short_description", limit: 100
    t.string "common_name", limit: 255
    t.string "manufacturer_name", limit: 255
    t.string "survey", limit: 1
    t.string "fefuse_description", limit: 255
    t.integer "refuse_percent", limit: 2
    t.string "scientific_name", limit: 255
    t.decimal "nitrogen_factor"
    t.decimal "protein_factor"
    t.decimal "fat_factor", precision: 2
    t.decimal "cho_factor", precision: 2
  end

  create_table "footnote", primary_key: ["footnote_no", "nbd_no", "nutr_no"], force: :cascade, comment: "Footnotes FOOTNOTE" do |t|
    t.integer "nbd_no", null: false
    t.integer "footnote_no", null: false
    t.string "footnote_type", limit: 1
    t.string "nutr_no", limit: 3, null: false
    t.string "footnote_text", limit: 255
  end

  create_table "langdesc", primary_key: "factor_code", id: :string, limit: 5, force: :cascade, comment: "LanguaL Factors Description File" do |t|
    t.string "description", limit: 140
  end

  create_table "langual", primary_key: ["nbd_no", "factor_code"], force: :cascade, comment: "LanguaL Factor File LANGUAL" do |t|
    t.integer "nbd_no", null: false
    t.string "factor_code", limit: 5, null: false
    t.index ["nbd_no"], name: "sr28_LanguaL_factor_NBD_No_index"
  end

  create_table "nut_dat", id: false, force: :cascade, comment: "Nutrient Data File NUT_DAT (hah.)" do |t|
    t.integer "nbd_no", null: false
    t.integer "nutr_no", null: false
    t.decimal "nutrient_value"
    t.decimal "data_pts_qty"
    t.decimal "std_error"
    t.string "src_code", limit: 2
    t.string "derivation_code", limit: 4
    t.integer "ref_nbd_no"
    t.string "added_nutrient", limit: 1
    t.integer "number_of_studies"
    t.decimal "min_value"
    t.decimal "max_value"
    t.integer "degrees_freedom"
    t.decimal "low_eb"
    t.decimal "up_eb"
    t.string "statistical_comments", limit: 10
    t.string "add_modify_date", limit: 10
    t.index ["nutr_no", "nbd_no"], name: "sr28_nutrient_data_pkey", unique: true
  end

  create_table "nutr_def", primary_key: "nutr_no", id: :integer, default: nil, force: :cascade, comment: "Nutrient Defnition File NUTR_DEF" do |t|
    t.string "units", limit: 100
    t.string "tagnames", limit: 20
    t.string "nutrient_description", limit: 120
    t.integer "num_dec"
    t.integer "sr_order"
    t.index ["nutr_no"], name: "sr28_nutrient_definition_Nutr_No_uindex", unique: true
  end

  create_table "src_cd", primary_key: "src_cd", id: :integer, default: nil, force: :cascade, comment: "Source Code File Format" do |t|
    t.string "description", limit: 60
  end

  create_table "weight", primary_key: ["nbd_no", "seq"], force: :cascade, comment: "Weight File WEIGHT" do |t|
    t.integer "nbd_no", null: false
    t.integer "seq", null: false
    t.decimal "amount"
    t.string "description", limit: 200
    t.decimal "gram_weight"
    t.integer "data_pts"
    t.decimal "standard_deviation"
  end

  add_foreign_key "food_des", "fd_group", column: "fdgrp_cd", primary_key: "fdgrp_cd", name: "food_des_fd_group_fdgrp_cd_fk"
  add_foreign_key "nut_dat", "food_des", column: "nbd_no", primary_key: "nbd_no", name: "nut_data_food_des_nbd_no_fk"
  add_foreign_key "nut_dat", "nutr_def", column: "nutr_no", primary_key: "nutr_no", name: "nut_data_nutr_def_nutr_no_fk"
end
