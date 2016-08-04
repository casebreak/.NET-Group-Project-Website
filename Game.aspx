<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Game.aspx.cs" Inherits="Game" %>
<%@ Register TagPrefix="uc" TagName="Navigation" Src="navigation.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>BNS</title>
    <link rel="Stylesheet" href="default.css" type="text/css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<body>

    <script type="text/javascript">
        // First to load
        $(document).ready(function() {
            $(".load_one").hide(0).delay(500).fadeIn(1000);
        });
        // Second to load
        $(document).ready(function() {
            $(".load_two").hide(0).delay(3000).fadeIn(2000);
        });
    </script>

    <div id="wrapper">
        <div id="header">
            <div class="logo">
                <img class="banner" src="images/headerLogo.png" alt="Welcome to Ben's Not Stallman! Sorry our awesome logo didn't load for you." />
            </div>
        </div>
            <uc:navigation ID="Navigation" runat="server" />
        <div id="content">
            <form id="gameBoard" runat="server" >
            <h2 class="contentHeader" style="margin-bottom: 0">Feelin' Lucky?</h2>
                <p>Here's your chance to win a prize from us at <span class="BNSwords">Ben's Not Stallman.</span> 
                Here's how the game works: You pick 3 numbers from the dropdown menus below. After entering your numbers, 
                click the button, and Richard Stallman will pick 3 numbers. The more numbers you match, the greater the prize!
                Attempts are limited to once per customer. <span class="BNSwords">Good luck!</span>
                </p>
                <div style="margin-left: auto; margin-right: auto; text-align: center;">
                    <asp:Label ID="noValues" runat="server" Visible="false" class="errorMessage"></asp:Label>
                </div>
                <div id="DropDowns">
                    <asp:DropDownList ID="UserFirstNum" runat="server" class="userNumbers">
                        <asp:ListItem Text="Your first number" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="UserSecondNum" runat="server" class="userNumbers">
                        <asp:ListItem Text="Your second number" Value="0"></asp:ListItem> 
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="UserThirdNum" runat="server" class="userNumbers">
                        <asp:ListItem Text="Your third number" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Button ID="ShowWinNums" runat="server" Text="Show me Stallman's numbers!" class="gameButton" OnClick="ShowWinNums_Click" />
                <div id="CompsNums" runat="server" visible="false" class="load_one">
                    <asp:Label ID="CompFirstNum" runat="server" Visible="false"></asp:Label>
                    <br />
                    <asp:Label ID="CompSecondNum" runat="server" Visible="false"></asp:Label>
                    <br />
                    <asp:Label ID="CompThirdNum" runat="server" Visible="false"></asp:Label>
                </div>
                <div id="winningsLabels" runat="server" visible="false" class="load_two">
                    <asp:Label ID="matches" runat="server"></asp:Label>
                    <br /><br />
                    <asp:Label ID="winnings" runat="server"></asp:Label>
                </div>
            </form>
        </div>
        <div id="footer">
            <p>All rights reserved. The use of Ben's face and all related content blah blah blah legal stuff.</p>
        </div>
    </div>
</body>

</html>

