import * as React from "react";
import { Layout, Menu, Breadcrumb, Icon, Affix, Row, Col, Input, AutoComplete } from 'antd';
const { Header, Content, Sider } = Layout;
import * as NutritionData from '../models/nutrition_data';
import { SR28DataClient } from '../models/nutrition_data_srvc';
interface FoodItemViewState {
    nutrition_info : NutritionData.IFoodNutritionInfo;
    food_info: NutritionData.IShortFoodItem;
    ndb_no : number;
}

interface FoodItemViewProps {
    match: any
}

export class FoodItemView extends React.Component<FoodItemViewProps, FoodItemViewState> {
    public constructor(props) {
        super(props);
    }

    componentDidMount() {
        this.getData(this.props.match.params.ndb_no);
    }

    componentDidUpdate(prevState, nextState) {
        console.log('hi');
    }

    componentWillReceiveProps(newProps) {
        this.getData(newProps.match.params.ndb_no);
    }

    getData(ndb_no: number) : void {
        SR28DataClient.getFlatNutritionInfo(ndb_no)
            .then((data) => {
                console.log(data);
                this.setState({
                    nutrition_info: data.nutrition_info,
                    food_info: data.food_info,
                    ndb_no: ndb_no
                })
            });
    }
    public render() {
        if(!this.state) { return (<h3>Loading...</h3>); }
        const nbd_no = this.props.match.params.nbd_no;
        const nutrition = this.state.nutrition_info;
        const food = this.state.food_info;
        return (
            <Layout style={{padding: '0 24px 24px'}}>
                <Breadcrumb style={{margin: '16px 0'}}>
                    <Breadcrumb.Item>Nutrition</Breadcrumb.Item>
                    <Breadcrumb.Item>Item Information</Breadcrumb.Item>
                    <Breadcrumb.Item>{food.long_description}</Breadcrumb.Item>
                </Breadcrumb>
                <Content style={{background: '#fff', padding: 24, margin: 0, minHeight: 280}}>
                    Content: {nbd_no}
                </Content>
            </Layout>
        )
    }
}