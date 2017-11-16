module Nutrition
  class FlatFoodItem < ApplicationRecord
    self.table_name = 'sr28_condensed'
    self.primary_key = 'ndb_no'

    def readonly?
      true
    end

    def entity
      Entity.new(self)
    end

    class Entity < Grape::Entity
      expose :ndb_no
      expose :shrt_desc
      expose :water_g
      expose :energ_kcal
      expose :protein_g
      expose :lipid_tot_g
      expose :ash_g
      expose :carbohydrt_g
      expose :fiber_td_g
      expose :sugar_tot_g
      expose :calcium_mg
      expose :iron_mg
      expose :magnesium_mg
      expose :phosphorus_mg
      expose :potassium_mg
      expose :sodium_mg
      expose :zinc_mg
      expose :copper_mg
      expose :manganese_mg
      expose :selenium_mu_g
      expose :vit_c_mg
      expose :thiamin_mg
      expose :riboflavin_mg
      expose :niacin_mg
      expose :panto_acid_mg
      expose :vit_b6_mg
      expose :folate_tot_mu_g
      expose :folic_acid_mu_g
      expose :food_folate_mu_g
      expose :folate_dfe_mu_g
      expose :choline_tot_mg
      expose :vit_b12_mu_g
      expose :vit_a_iu
      expose :vit_a_rae
      expose :retinol_mu_g
      expose :alpha_carot_mu_g
      expose :beta_carot_mu_g
      expose :beta_crypt_mu_g
      expose :lycopene_mu_g
      expose :lut_zea_mu_g
      expose :vit_e_mg
      expose :vit_d_mu_g
      expose :vit_d_iu
      expose :vit_k_mu_g
      expose :fa_sat_g
      expose :fa_mono_g
      expose :fa_poly_g
      expose :cholestrl_mg
      expose :gmwt_1
      expose :gmwt_desc1
      expose :gmwt_2
      expose :gmwt_desc2
      expose :refuse_pct
    end
  end
end