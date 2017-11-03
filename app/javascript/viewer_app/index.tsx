/**
 * Created by shanekamar on 11/2/17.
 */
import * as React from "react";
import * as ReactDOM from "react-dom";

import { Hello } from "./components/Hello";

ReactDOM.render(
    <Hello compiler="TypeScript" framework="React" />,
    document.body.appendChild(document.createElement('div'))
);