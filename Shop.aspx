<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Shop.aspx.cs" Inherits="Shop" %>
<%@ Register TagPrefix="uc" TagName="Navigation" Src="navigation.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>BNS</title>
    <link rel="Stylesheet" href="default.css" type="text/css" />
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <div class="logo">
                <img class="banner" src="images/headerLogo.png" alt="Banner Logo" />
            </div>
        </div>
            <uc:navigation ID="Navigation" runat="server" />
        <div id="content">
            <h2 class="contentHeader" style="margin-bottom: 0;">Welcome to the BNS store! Click 'Buy' to purchase, or click the product
                number to get more information.</h2>
            <form id="dataForm" runat="server" class="dataForm">
                <p style="margin-bottom: 0; padding-bottom: 0;">
                    <asp:TextBox ID="searchTerm" runat="server" ></asp:TextBox>
                    <asp:Button ID="searchButton" runat="server" text="Search" OnClick="searchButton_OnClick" />
                    &nbsp;&nbsp;&nbsp;(By default, this will match all results based on your terms.)
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Shopping_Cart.aspx">View cart</a>
                    <br />
                    <asp:Label ID="statusLabel" runat="server" />
                    <br />
                </p>
                <asp:SqlDataSource ID="BenNotStallman" runat="server" />
                <div id="dataGrid" runat="server">
                    <asp:Literal ID="ProductPage" runat="server"></asp:Literal>
                    <asp:GridView class="productsGrid" ID="ProductsGrid" runat="server" EnableModelValidation="True" Autogeneratecolumns="False" 
                        AllowSorting="True" OnSorting="ProductsGrid_Sorting" OnSelectedIndexChanged="ProductGrid_SelectedIndexChanged" DataKeyNames="productNum">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="Buy" />
                            <asp:TemplateField SortExpression="productNum" headertext="Product Number" >
                                <ItemTemplate>
                                    <asp:HyperLink ID="nameLink" NavigateUrl='<%# "~/Description.aspx?pid=" + Eval("productNum")%>' Text='<%# Eval("productNum") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" />
                            <asp:BoundField DataField="productDesc" HeaderText="Description" SortExpression="productDesc" />
                            <asp:boundfield DataField="Color" HeaderText="Color" SortExpression="color" />
                            <asp:boundfield DataField="price" HeaderText="Price" SortExpression="price" DataFormatString="${0:#,###.00}" />
                        </Columns>
                    </asp:GridView>                    
                </div>
            </form>
        </div>
        <div id="footer">
            <p>All rights reserved. The use of Ben's face and all related content blah blah blah legal stuff.</p>
        </div>
    </div>
</body>
</html>
