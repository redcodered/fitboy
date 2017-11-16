import * as React from "react";
import { Layout, Menu, Breadcrumb, Collapse, Icon, Card , Affix, Row, Col, Input, AutoComplete } from 'antd';
const { Header, Content, Sider } = Layout;
const Panel = Collapse.Panel;
import * as NutritionData from '../models/nutrition_data';
import { SR28DataClient } from '../models/nutrition_data_srvc';

import { NutritionLabel }from '../components/NutritionLabel';

interface FoodItemViewState {
    nutrition_info : NutritionData.IFoodNutritionInfo;
    food_info: NutritionData.IFoodItem;
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

    componentWillReceiveProps(newProps) {
        this.getData(newProps.match.params.ndb_no);
    }

    getData(ndb_no: number) : void {
        SR28DataClient.getFlatNutritionInfo(ndb_no)
            .then((data) => {
                this.setState({
                    nutrition_info: data.nutrition_info,
                    food_info: data.food_info,
                    ndb_no: ndb_no
                })
            });
    }

    public render() {
        const nbd_no = this.props.match.params.nbd_no;
        let breadcrumb = nbd_no;
        if(!this.state) { return (<h3>Loading...</h3>); }
        const nutrition = this.state.nutrition_info;
        const food = this.state.food_info;
        return (
            <Layout style={{padding: '0 24px 24px'}}>
                <Breadcrumb style={{margin: '16px 0'}}>
                    <Breadcrumb.Item>Nutrition</Breadcrumb.Item>
                    <Breadcrumb.Item>Item Information</Breadcrumb.Item>
                    <Breadcrumb.Item>{food.short_description}</Breadcrumb.Item>
                </Breadcrumb>
                <Content style={{background: '#fff', padding: 0, margin: 0, minHeight: 280}}>
                    <div style={{ padding: 12 }}><h2>{food.long_description}</h2></div>
                    <Collapse bordered={false} defaultActiveKey={['basic-info', 'nut-labels']}>
                        <Panel header="Basic Information" key="basic-info">
                            <BasicInformationPanel foodInfo={food} />
                        </Panel>
                        <Panel header="Nutrition Labels" className="nutrition-labels-panel" key="nut-labels">
                            <NutritionLabelsPanel nutritionInfo={nutrition} foodInfo={food}/>
                        </Panel>
                    </Collapse>
                </Content>
            </Layout>
        )
    }
}

class BasicInformationPanel extends React.Component<{foodInfo: NutritionData.IFoodItem}, {}> {
    render() {
        const food_info = this.props.foodInfo;
        return (
            <div>
                <p><b>Long Description:</b> {food_info.long_description}</p>
                <p><b>Food Group:</b> {food_info.food_group.description}</p>
                <p><b>Manufacturer Name:</b> {food_info.manufacturer_name}</p>
                <p><b>Scientific Name:</b> {food_info.scientific_name}</p>
                <p><b>Common Name:</b> {food_info.common_name}</p>
                <p><b>NDB No:</b> {food_info.nbd_no}</p>
            </div>
        );
    }
}

class NutritionLabelsPanel extends React.Component<{
        nutritionInfo : NutritionData.IFoodNutritionInfo,
        foodInfo: NutritionData.IFoodItem}, {}> {

    componentWillMount() {

    }

    render() {
        let food_info = this.props.foodInfo;
        let nutrition_info = this.props.nutritionInfo;
        let labels = SR28DataClient.constructLabels({
            nutrition_info: nutrition_info,
            food_info: food_info});
        let nbd_no = food_info.nbd_no;
        var arrays = [], size = 3;
        while (labels.length > 0)
            arrays.push(labels.splice(0, size));

        // It is important here to use a unique key for each react element
        // and its children to make sure each nutrition panel can be uniquely
        // referenced by the component code to make the interactive
        // features work and make sure a new panel is drawn
        // when a new food is selected.
        return (
            <div style={{ padding: '0px', background: '#D0D0D0' }}>
                {arrays.map((row, rowIndex) => {
                    return (
                        <Row
                            gutter={16}
                            style={{ padding: '12px' }}
                            key={`row-nutrition-${nbd_no}-${rowIndex}`}
                        >
                            {row.map((col, colIndex) => {return (
                                <Col
                                    span={8}
                                     key={`col-nutrtition-${nbd_no}-${rowIndex}-${colIndex}`}
                                >
                                    <Card bordered={false}
                                          title={col.valueServingSizeUnit}
                                          key={`card-nutrition-${nbd_no}-${rowIndex}-${colIndex}`}
                                    >
                                        <NutritionLabel
                                            labelName={`nutrition-label-label-${nbd_no}-${rowIndex}-${colIndex}`}
                                            key={`nutrition-label-key-${nbd_no}-${rowIndex}-${colIndex}`}
                                            options={col}
                                        />

                                    </Card>
                                </Col>
                            )})}
                        </Row>
                    )
                })}
            </div>
        );
    }
}