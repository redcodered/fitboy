/**
 * Created by shanekamar on 11/3/17.
 */

interface IFoodGroup {
    fdgrp_cd: string;
    description: string;
}

interface INutrientDataPoint {
    nutrient: string;
    tagname: string;
    units: string;
    nutrient_value: number;
    added_nutrient: string;
}

interface IPortionNutrientData {
    serving_size: string;
    nutrients: Array<INutrientDataPoint>;
}

interface IPortionWeightInfo {
    nbd_no: string;
    seq: string;
    amount: number;
    description: string;
    gram_weight: number;
    data_pts: number;
    standard_deviation: number;
}

interface IShortFoodItem {
    nbd_no: string;
    long_description: string;
    common_name: string;
    manufacturer_name: string;
    scientific_name: string;
    calories: number;
}

interface IFoodItemSearchContainer {
    group_name: string;
    items: Array<IShortFoodItem>;
}

interface IFoodItem {
    nbd_no: string;
    long_description: string;
    common_name: string;
    manufacturer_name: string;
    survey: string;
    refuse_percent: string;
    food_group: IFoodGroup;
    serving_sizes: Array<IPortionWeightInfo>;
    nutrition: Array<IPortionNutrientData>;
}

interface IFoodShortResponseItem {
    food_info: IShortFoodItem;
    nutrition_info: IFoodNutritionInfo;
}

interface IFoodNutritionInfo {
    ndb_no : number,
    shrt_desc : string,
    water_g : number,
    energ_kcal : number,
    protein_g : number,
    lipid_tot_g : number,
    ash_g : number,
    carbohydrt_g : number,
    fiber_td_g : number,
    sugar_tot_g : number,
    calcium_mg : number,
    iron_mg : number,
    magnesium_mg : number,
    phosphorus_mg : number,
    potassium_mg : number,
    sodium_mg : number,
    zinc_mg : number,
    copper_mg : number,
    manganese_mg : number,
    selenium_mu_g : number,
    vit_c_mg : number,
    thiamin_mg : number,
    riboflavin_mg : number,
    niacin_mg : number,
    panto_acid_mg : number,
    vit_b6_mg : number,
    folate_tot_mu_g : number,
    folic_acid_mu_g : number,
    food_folate_mu_g : number,
    folate_dfe_mu_g : number,
    choline_tot_mg : number,
    vit_b12_mu_g : number,
    vit_a_iu : number,
    vit_a_rae : number,
    retinol_mu_g : number,
    alpha_carot_mu_g : number,
    beta_carot_mu_g : number,
    beta_crypt_mu_g : number,
    lycopene_mu_g : number,
    lut_zea_mu_g : number,
    vit_e_mg : number,
    vit_d_mu_g : number,
    vit_d_iu : number,
    vit_k_mu_g : number,
    fa_sat_g : number,
    fa_mono_g : number,
    fa_poly_g : number,
    cholestrl_mg : number,
    gmwt_1 : number,
    gmwt_desc1 : string,
    gmwt_2 : number,
    gmwt_desc2 : string,
    refuse_pct : number,
}

export {
    IFoodGroup,
    IFoodItem,
    IPortionNutrientData,
    INutrientDataPoint,
    IFoodNutritionInfo,
    IPortionWeightInfo,
    IShortFoodItem,
    IFoodShortResponseItem,
    IFoodItemSearchContainer
 };

