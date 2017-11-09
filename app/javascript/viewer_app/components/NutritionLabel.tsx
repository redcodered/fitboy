/// <reference path="../typings/nutrition_label.d.ts"/>
import * as React from "react";
import * as ReactDOM from "react-dom"
import * as NutritionData from "../models/nutrition_data";

export interface NutritionLabelProps {
    labelName: string;
}

export interface NutritionLabelState {

}

export class NutritionLabel extends React.Component<NutritionLabelProps, {}> {

    $node : any;
    node: any;
    label: any;
    el: any;

    public shouldComponentUpdate() { return false; }

    public componentDidMount() {
        this.node  = this.el;
        this.$node = $(this.node);
        debugger;
        this.label = this.$node.nutritionLabel({
            'showServingUnitQuantity' : false,
            'itemName' : 'Bleu Cheese Dressing',
            'ingredientList' : 'Bleu Cheese Dressing',

            'decimalPlacesForQuantityTextbox' : 2,
            'valueServingUnitQuantity' : 1,

            'allowFDARounding' : true,
            'decimalPlacesForNutrition' : 2,

            'showPolyFat' : false,
            'showMonoFat' : false,

            'valueCalories' : 450,
            'valueFatCalories' : 430,
            'valueTotalFat' : 48,
            'valueSatFat' : 6,
            'valueTransFat' : 0,
            'valueCholesterol' : 30,
            'valueSodium' : 780,
            'valueTotalCarb' : 3,
            'valueFibers' : 0,
            'valueSugars' : 3,
            'valueProteins' : 3,
            'valueVitaminD' : 1.22,
            'valuePotassium_2018' : 4.22,
            'valueCalcium' : 7.22,
            'valueIron' : 11.22,
            'valueAddedSugars' : 17,
            'showLegacyVersion' : false
        });
    }

    public componentWillUnmount() {
        ReactDOM.unmountComponentAtNode(this.node);
    }

    public render() {
        return <div ref={el => this.el = el} id={this.props.labelName}/>;
    }
}