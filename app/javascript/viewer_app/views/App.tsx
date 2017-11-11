import * as React from "react";
import * as ReactDOM from "react-dom";

import { Layout, Menu, Breadcrumb, Icon, Affix, Row, Col, Input, AutoComplete } from 'antd';
const { SubMenu } = Menu;
const Search = Input.Search;
const { Header, Content, Sider } = Layout;

import { NutritionLayout } from './NutritionLayout';
import { FoodSearch } from '../components/FoodSearch';

import { SR28DataClient, SR28LocalDBClient, ISR28Client } from '../models/nutrition_data_srvc';
import * as NutritionData from '../models/nutrition_data';
import {IShortFoodItem} from "../models/nutrition_data";
import { Switch, Route, Link } from 'react-router-dom';


interface AppProps {
    sr28_datasrc? : ISR28Client;
}

export class App extends React.Component<AppProps,{}> {
    constructor(props) {
        super(props);
    }
    public render() {
        return (
        <Layout>
            <Affix>
                <Header className="header">
                    <Row type="flex">
                        <Col span={8} order={1}>
                            <Menu
                                theme="dark"
                                mode="horizontal"
                                defaultSelectedKeys={['main-nutrition']}
                                style={{ lineHeight: '64px' }}
                            >
                                <Menu.Item key="main-learn">Hub</Menu.Item>
                                <Menu.Item key="main-nutrition"><Link to="/nutrition">Nutrition</Link></Menu.Item>
                                <Menu.Item key="main-activity">Activity</Menu.Item>
                                <Menu.Item key="main-analysis">Analysis</Menu.Item>
                            </Menu>
                        </Col>
                        <Col span={8} offset={8} order={2}>
                            <FoodSearch />
                        </Col>
                    </Row>
                </Header>
            </Affix>
            <Switch>
                <Route path="/nutrition" exact component={NutritionLayout} />
            </Switch>
        </Layout> );
    }
}
