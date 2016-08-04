<%@ Control Language="C#" AutoEventWireup="true" CodeFile="navigation.ascx.cs" Inherits="WebUserControl" %>

<link rel="Stylesheet" href="default.css" type="text/css" />

<div id="nav" runat="server">
    <ul class="navList">
        <li><asp:HyperLink ID="Home" runat="server" href="default.aspx">Home</asp:HyperLink></li>
        <li><asp:HyperLink ID="Shop" runat="server" href="Shop.aspx">Shop</asp:HyperLink></li>
        <li><asp:HyperLink ID="About" runat="server" href="AboutUs.aspx">About</asp:HyperLink></li>
        <li><asp:HyperLink ID="Contact" runat="server" href="Contact.aspx">Contact</asp:HyperLink></li>
        <li><asp:HyperLink ID="Lotto" runat="server" href="Game.aspx">Lotto</asp:HyperLink></li>
    </ul>
</div>

