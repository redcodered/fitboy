/// <reference path="../typings/nutrition_label.d.ts"/>
import * as React from "react";
import * as ReactDOM from "react-dom"
import * as NutritionData from "../models/nutrition_data";

export interface NutritionLabelProps {
    labelName: string;
    options: any; // Cheap hack -- this has far too many options to declare in full form.
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
        this.updateOptions(this.props.options);
    }

    updateOptions(newOpts) {
        let options = {};
        Object.assign(options, {
            'showServingUnitQuantity' : true,

            'decimalPlacesForQuantityTextbox' : 2,

            'allowFDARounding' : true,
            'decimalPlacesForNutrition' : 2,

            'showPolyFat' : false,
            'showMonoFat' : false,

            'showLegacyVersion' : false
        });
        Object.assign(options, newOpts);
        this.label = this.$node.nutritionLabel(options);
    }

    public componentWillUnmount() {
        ReactDOM.unmountComponentAtNode(this.node);
    }

    public componentWillReceiveProps(newProps) {
        this.forceUpdate();
        this.updateOptions(newProps.options);

    }

    public render() {
        return <div ref={el => this.el = el} id={this.props.labelName}/>;
    }
}