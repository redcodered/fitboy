import * as React from "react";
import * as NutritionData from "../models/nutrition_data";

export interface HelloProps { compiler: string; framework: string; }

// 'HelloProps' describes the shape of props.
// State is never set so we use the '{}' type.
export class Hello extends React.Component<HelloProps, {}> {
    buttonClicked() {
        console.log('Button was clicked!');
        fetch('/nutrition/api/food_group')
            .then(data => {
                return data.json()
            }).then((data : NutritionData.IFoodGroup[])  => {
                this.doSomething(data);
            }
        );
        debugger;
    }
    doSomething(data: NutritionData.IFoodGroup[]) {
        for(let fg of data) {
            console.log(fg.description)
        }
    }
    render() {
        return <div>
            <h1>Hello from {this.props.compiler} and {this.props.framework}!</h1>
            <button onClick={this.buttonClicked.bind(this)}>Do something</button>
        </div>;
    }
}

// console.log(this.props.sr28_datasrc.push_me());
// console.log(SR28DataClient.search('butter%20lowfat', (d: Array<NutritionData.IShortFoodItem>) => {
//     d.forEach((d: IShortFoodItem) => { console.log(d.long_description); } )
// }));