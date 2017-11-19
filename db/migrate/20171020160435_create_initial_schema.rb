class CreateInitialSchema < ActiveRecord::Migration[5.1]
  def self.up
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
      t.string "refuse_description", limit: 255
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

    create_table "sr28_condensed", primary_key: "ndb_no", id: :integer, force: :cascade do |t|
      t.string "shrt_desc", limit: 60
      t.float "water_g"
      t.integer "energ_kcal"
      t.float "protein_g"
      t.float "lipid_tot_g"
      t.float "ash_g"
      t.float "carbohydrt_g"
      t.float "fiber_td_g"
      t.float "sugar_tot_g", default: 0.0
      t.integer "calcium_mg"
      t.float "iron_mg"
      t.float "magnesium_mg", default: 0.0
      t.integer "phosphorus_mg"
      t.integer "potassium_mg"
      t.integer "sodium_mg"
      t.float "zinc_mg", default: 0.0
      t.float "copper_mg", default: 0.0
      t.float "manganese_mg", default: 0.0
      t.float "selenium_mu_g", default: 0.0
      t.float "vit_c_mg"
      t.float "thiamin_mg", default: 0.0
      t.float "riboflavin_mg", default: 0.0
      t.float "niacin_mg", default: 0.0
      t.float "panto_acid_mg", default: 0.0
      t.float "vit_b6_mg", default: 0.0
      t.float "folate_tot_mu_g", default: 0.0
      t.float "folic_acid_mu_g", default: 0.0
      t.float "food_folate_mu_g", default: 0.0
      t.float "folate_dfe_mu_g", default: 0.0
      t.float "choline_tot_mg", default: 0.0
      t.float "vit_b12_mu_g", default: 0.0
      t.integer "vit_a_iu"
      t.float "vit_a_rae", default: 0.0
      t.float "retinol_mu_g", default: 0.0
      t.float "alpha_carot_mu_g", default: 0.0
      t.float "beta_carot_mu_g", default: 0.0
      t.float "beta_crypt_mu_g", default: 0.0
      t.float "lycopene_mu_g", default: 0.0
      t.float "lut_zea_mu_g", default: 0.0
      t.float "vit_e_mg", default: 0.0
      t.float "vit_d_mu_g", default: 0.0
      t.float "vit_d_iu", default: 0.0
      t.float "vit_k_mu_g", default: 0.0
      t.float "fa_sat_g"
      t.float "fa_mono_g", default: 0.0
      t.float "fa_poly_g", default: 0.0
      t.integer "cholestrl_mg"
      t.float "gmwt_1"
      t.string "gmwt_desc1", limit: 120
      t.float "gmwt_2", default: 0.0
      t.string "gmwt_desc2", limit: 120
      t.integer "refuse_pct"
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

  def self.down
    # no-op
  end
end
