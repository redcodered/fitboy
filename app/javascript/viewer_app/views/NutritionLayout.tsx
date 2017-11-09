import * as React from "react";
import { Layout, Menu, Breadcrumb, Icon, Affix, Row, Col, Input } from 'antd';
const { Header, Content, Sider } = Layout;
const { SubMenu } = Menu;
import { Switch, Route } from 'react-router-dom';

export class NutritionLayout extends React.Component<{},{}> {

    public render() {
        return (
        <Layout>
            <Sider width={200} style={{background: '#fff'}}>
                <Menu
                    mode="inline"
                    defaultSelectedKeys={['1']}
                    defaultOpenKeys={['sub1']}
                    style={{height: '100%', borderRight: 0}}
                >
                    <SubMenu key="sub1" title={<span><Icon type="user"/>Nutrition Information</span>}>
                        <Menu.Item key="1">Food Item Data</Menu.Item>
                        <Menu.Item key="2">Recipies</Menu.Item>
                        <Menu.Item key="3">Lists</Menu.Item>
                        <Menu.Item key="4">Custom Items</Menu.Item>
                    </SubMenu>
                    <SubMenu key="sub2" title={<span><Icon type="laptop"/>Tracking</span>}>
                        <Menu.Item key="5">option5</Menu.Item>
                        <Menu.Item key="6">option6</Menu.Item>
                        <Menu.Item key="7">option7</Menu.Item>
                        <Menu.Item key="8">option8</Menu.Item>
                    </SubMenu>
                    <SubMenu key="sub3" title={<span><Icon type="notification"/>Metrics</span>}>
                        <Menu.Item key="9">option9</Menu.Item>
                        <Menu.Item key="10">option10</Menu.Item>
                        <Menu.Item key="11">option11</Menu.Item>
                        <Menu.Item key="12">option12</Menu.Item>
                    </SubMenu>
                </Menu>
            </Sider>
            <Layout style={{padding: '0 24px 24px'}}>
                <Breadcrumb style={{margin: '16px 0'}}>
                    <Breadcrumb.Item>Home</Breadcrumb.Item>
                    <Breadcrumb.Item>List</Breadcrumb.Item>
                    <Breadcrumb.Item>App</Breadcrumb.Item>
                </Breadcrumb>
                <Content style={{background: '#fff', padding: 24, margin: 0, minHeight: 280}}>
                    Content
                </Content>
            </Layout>
        </Layout> )
    }
}