/**
 * Created by shanekamar on 11/2/17.
 */
import * as React from "react";
import * as ReactDOM from "react-dom";
import { BrowserRouter } from 'react-router-dom';

import { App } from "./views/App";
import { SR28LocalDBClient } from "./models/nutrition_data_srvc"

ReactDOM.render(
    <div>
        <BrowserRouter basename="/nutrition/app">
            <SR28LocalDBClient ref="local_db_client"/>
            <App sr28_datasrc={this.refs.local_db_client}/>
        </BrowserRouter>
    </div>,
    document.body.appendChild(document.createElement('div'))
);