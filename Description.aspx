<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Description.aspx.cs" Inherits="Description" %>
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
                <img class="banner" src="images/headerLogo.png" alt="Welcome to Ben's Not Stallman! Sorry our awesome logo didn't load for you." />
            </div>
        </div>
            <uc:navigation ID="Navigation" runat="server" />
        <form id="description" runat="server">
        <div id="content">
            <asp:Label ID="statusL" runat="server" Text="" />
            <h2 class="contentHeader">Product</h2>
            <div style="margin-left: auto; margin-right: auto; text-align: center;" runat="server" >
                <asp:GridView ID="Image" runat="server" DataSourceID="BensNotStallman" EnableModelValidation="True" 
                    AutoGenerateColums="false">
                    <Columns>
                        <asp:BoundField DataField="productPhotoFileName" HeaderText="Photo" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="BensNotStallman" runat="server"></asp:SqlDataSource>
                <asp:Label ID="productName" CssClass="descriptionLabel" runat="server" Text="" />
                
            </div>
            <h2 class="contentHeader">Description</h2>
            <div style="margin-left: auto; margin-right: auto; text-align: center;" runat="server" >
                <asp:Label ID="productDescription" CssClass="descriptionLabel" runat="server" Text="" />
            </div>
            <h2 class="contentHeader">Price</h2>
            <div style="margin-left: auto; margin-right: auto; text-align: center; margin-bottom: 20px;" runat="server">
                <asp:Label ID="productPrice" CssClass="descriptionLabel" runat="server" Text="" />
            </div>
        </div>
        </form>
        <div id="footer">
            <p>All rights reserved. The use of Ben's face and all related content blah blah blah legal stuff.</p>
        </div>
    </div>
</body>
</html>
