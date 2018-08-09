import * as React from "react";
import { Layout, Menu, Breadcrumb, Icon, Affix, Row, Col, Input, AutoComplete } from 'antd';
const Search = Input.Search;
const Option = AutoComplete.Option;
const OptGroup = AutoComplete.OptGroup;
import { SR28DataClient, SR28LocalDBClient, ISR28Client } from '../models/nutrition_data_srvc';
import * as NutritionData from '../models/nutrition_data';
import {IFoodItemSearchContainer, IShortFoodItem} from "../models/nutrition_data";

interface FoodSearchProps {
    history: any;
    match: any;
    location: any
}
//
interface FoodSearchState {
    text?: string;
    result : Array<NutritionData.IFoodItemSearchContainer>;
}


export class FoodSearch extends React.Component<FoodSearchProps | any, {}> {
    public constructor(props) {
        super(props);
        // this.handleSearch = this.handleSearch.bind(this);
        // this.handleSelect = this.handleSelect.bind(this);

    }
    public handleSearch(value: string) : void {
        if(value == '') {
            this.setState({result: []});
        } else {
            SR28DataClient.search(value,
                (d: Array<NutritionData.IFoodItemSearchContainer>) =>
                    this.setState({result: d, text: value}));
        }
    }

    state = {
        result: [],
        text: '',
    };

    public renderGroup(group_name : string, items: Array<IShortFoodItem>)  {
        return (
            <OptGroup key={group_name} label={this.renderTitle(group_name)}>
                {items.map(item => (
                    <Option key={item.nbd_no}>{item.long_description}</Option>
                ))}
            </OptGroup>
        )
    }

    public renderTitle(title : string) {
        return (
            <h4>{title}</h4>
        );
    }

    public handleSelect(d: string) : void {
        this.props.history.push(`/nutrition/food/${d}`);
        // this.setState({text: this.state.text});
    }

    public render() {
        const { result } = this.state;
        const children = result.map(
            (item) => { return this.renderGroup(item.group_name, item.items); });
        return (
            <AutoComplete
                onChange={this.handleSearch}
                dataSource={children}
                onSelect={this.handleSelect}
                style={{ width: '100%' }}
            >
                <Search
                    style={{ width: '100%' }}
                    placeholder="Search Foods"
                    ref="search"
                    value={this.props.text}
                    onSearch={value => console.log(value)}
                >
                </Search>
            </AutoComplete>
        );
    }
}

