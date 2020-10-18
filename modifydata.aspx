<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="modifydata.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="w3.css" />
    <meta charset="UTF-8" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
        
        }
        .x {
        margin-right:25ch;
        width:100%;
        height:70%;
        overflow:auto;
        box-sizing:border-box;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <p id="para" class="w3-center">Your posted properties</p>
    <div id="x">
        <asp:Panel ID="panel1" runat="server" Height="90%" Width="100%" ScrollBars="Horizontal">
    <asp:GridView ID="gvshow" runat="server" AutoGenerateColumns="False" DataKeyNames="property_id" DataSourceID="SqlDataSource1" PageSize="20" HorizontalAlign="Justify">
        <Columns>
            <asp:TemplateField HeaderText="property_id" InsertVisible="False" SortExpression="property_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("property_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("property_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="property_for" HeaderText="property_for" SortExpression="property_for" />
            <asp:BoundField DataField="property_type" HeaderText="property_type" SortExpression="property_type" />
            <asp:BoundField DataField="user_type" HeaderText="user_type" SortExpression="user_type" />
            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="locality" HeaderText="locality" SortExpression="locality" />
            <asp:BoundField DataField="bedrooms" HeaderText="bedrooms" SortExpression="bedrooms" />
            <asp:BoundField DataField="balconies" HeaderText="balconies" SortExpression="balconies" />
            <asp:BoundField DataField="floor_no" HeaderText="floor_no" SortExpression="floor_no" />
            <asp:BoundField DataField="furnished_status" HeaderText="furnished_status" SortExpression="furnished_status" />
            <asp:BoundField DataField="Bathroom" HeaderText="Bathroom" SortExpression="Bathroom" />
            <asp:BoundField DataField="covered_area" HeaderText="covered_area" SortExpression="covered_area" />
            <asp:BoundField DataField="cover_area_unit" HeaderText="cover_area_unit" SortExpression="cover_area_unit" />
            <asp:BoundField DataField="plot_area" HeaderText="plot_area" SortExpression="plot_area" />
            <asp:BoundField DataField="plot_area_unit" HeaderText="plot_area_unit" SortExpression="plot_area_unit" />
            <asp:BoundField DataField="transaction_type" HeaderText="transaction_type" SortExpression="transaction_type" />
            <asp:BoundField DataField="possession_status" HeaderText="possession_status" SortExpression="possession_status" />
            <asp:BoundField DataField="construct_complete" HeaderText="construct_complete" SortExpression="construct_complete" />
            <asp:BoundField DataField="Age_of_construction" HeaderText="Age_of_construction" SortExpression="Age_of_construction" />
            <asp:BoundField DataField="expected_price" HeaderText="expected_price" SortExpression="expected_price" />
            <asp:BoundField DataField="price_sqft" HeaderText="price_sqft" SortExpression="price_sqft" />
            <asp:BoundField DataField="price_includes" HeaderText="price_includes" SortExpression="price_includes" />
            <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
        </Columns>
     </asp:GridView>
            </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:simplestring %>" SelectCommand="SELECT * FROM [propertydata]"></asp:SqlDataSource>
        </div>
</asp:Content>

