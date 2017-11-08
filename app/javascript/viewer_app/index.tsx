/**
 * Created by shanekamar on 11/2/17.
 */
import * as React from "react";
import * as ReactDOM from "react-dom";

import { PrimaryInitialLayout } from "./layouts/PrimaryInitialLayout";

ReactDOM.render(
    <div>
        <PrimaryInitialLayout />
    </div>,
    document.body.appendChild(document.createElement('div'))
);