import * as React from "react";

import * as NutritionData from './nutrition_data'
const API_BASE : String = "/nutrition/api";

export namespace SR28DataClient {
    export function search(query: String,
                           cb: (d : Array<NutritionData.IShortFoodItem>) => any) : String {
        fetch(API_BASE + "/food/search/" + query)
            .then((response) => {
                if(response.ok) { return response.json() }
        }).then(cb);
        return "";
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
