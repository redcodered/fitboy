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

export {
    IFoodGroup,
    IFoodItem,
    IPortionNutrientData,
    INutrientDataPoint,
    IPortionWeightInfo
 };

