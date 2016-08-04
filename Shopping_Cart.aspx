<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shopping_Cart.aspx.cs" Inherits="Shopping_Cart" %>
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
        <div id="content" style="padding: 15px;">
            <h2 class="contentHeader" style="margin-top: 0;">Your Cart</h2>
            <form id="shoppingCartForm" runat="server" class="dataForm">
                <asp:Literal ID="CartBody" runat="server"></asp:Literal>
            </form>
        </div>
        <div id="footer">
            <p>All rights reserved. The use of Ben's face and all related content blah blah blah legal stuff.</p>
        </div>
    </div>
</body>
</html>
