import * as React from "react";

import * as NutritionData from './nutrition_data'
const API_BASE : String = "/api/nutrition";

export namespace SR28DataClient {
    export function search(query: String,
                           cb: (d : Array<NutritionData.IFoodItemSearchContainer>) => any) : String {
        fetch(`${API_BASE}/food/search/${query}`)
            .then((response) => {
                if(response.ok) { return response.json() } else {return [];}
        }).then((data) => cb(data.results));
        return "";
    }

    export function getFlatNutritionInfo(ndb_no: number) :
            Promise<NutritionData.IFoodShortResponseItem> {
        return fetch(`${API_BASE}/food/condensed/${ndb_no}`)
            .then((response) => {
                if(response.ok) { return response.json() } else { return null; }
        })
    }

    export function constructLabels(data: NutritionData.IFoodShortResponseItem, opts : Object = {}) : any {
        const servingSizes = data.food_info.serving_sizes;
        const nutrition = data.nutrition_info;
        const foodInfo = data.food_info;
        let labels = servingSizes.map(
                (servingSize: NutritionData.IPortionWeightInfo) => {
            let g : any = servingSize.gram_weight;
            let options = Object.assign({}, opts);
            let values = {
                valueCalories: nutrition.energ_kcal,
                valueTotalFat: nutrition.lipid_tot_g,
                valueSatFat: nutrition.fa_sat_g,
                valueCholesterol: nutrition.cholestrl_mg,
                valueSodium: nutrition.sodium_mg,
                valueTotalCarb: nutrition.carbohydrt_g,
                valueFibers: nutrition.fiber_td_g,
                valueSugars: nutrition.sugar_tot_g,
                valueProteins: nutrition.protein_g,
                valueVitaminD: nutrition.vit_d_mu_g,
                valuePotassium_2018: nutrition.potassium_mg,
                valueCalcium: nutrition.calcium_mg,
                valueIron: nutrition.iron_mg,
            };

            Object.keys(values).map((k) => values[k] = parseFloat(values[k]) * (parseFloat(g) / parseFloat("100")));
            Object.assign(options, values);
            Object.assign(options, {
                itemName: foodInfo.long_description,
                valueServingSizeUnit: servingSize.description,
                valueServingSizeQuantity: servingSize.amount,
                allowCustomWidth: true,
                allowNoBorder: true,
            });
            return options;
        });

        return labels;
    }
}

export interface ISR28Client {
    push_me: () => void;
}

export class SR28LocalDBClient
        extends React.Component<{},{}>
        implements ISR28Client {

    public push_me = () => console.log('hi');
}
