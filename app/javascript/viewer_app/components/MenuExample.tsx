import * as React from "react";
import { Menu, MenuItem, MenuDivider } from "@blueprintjs/core";

export class MenuExample extends React.Component<{}, {}> {
    public render() {
        return (
            <Menu>
                <MenuItem
                    iconName="new-text-box"
                    onClick={this.handleClick}
                    text="New text box"
                />
                <MenuItem
                    iconName="new-object"
                    onClick={this.handleClick}
                    text="New object"
                />
                <MenuItem
                    iconName="new-link"
                    onClick={this.handleClick}
                    text="New link"
                />
                <MenuDivider />
                <MenuItem text="Settings..." iconName="cog" />
            </Menu>
        );
    }

    private handleClick(e: React.MouseEvent<any>) {
        console.log("clicked", (e.target as HTMLElement).textContent);
    }
}