/**
 * Created by shanekamar on 11/2/17.
 */
import * as React from "react";
import * as ReactDOM from "react-dom";

import { NutritionLabel } from "./components/NutritionLabel";

ReactDOM.render(
    <div>
        <NutritionLabel labelName="hi" />
    </div>,
    document.body.appendChild(document.createElement('div'))
);