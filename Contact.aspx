<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>
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
        <div id="content">
            <h2 class="contentHeader" style="margin-bottom: 0">Contact Us</h2>
            <form ID="contactUsForm" runat="server">
                <asp:Panel ID="contactUs" runat="server">
                <asp:Literal ID="sentEmail" runat="server" Visible="False"></asp:Literal>
                <asp:Literal ID="errorMsg" runat="server" Visible="False"></asp:Literal>
                <div id="hideMe" runat="server">
                    <p style="padding-top: 0">
                        Have a question, comment, or concern? We would love to hear from you. Please enter your information in the 
                        form and we will get back to you in a timely fashion. We appreciate your interest in <span class="BNSwords">
                        Ben's Not Stallman</span> products and hope you have a wonderful day!
                    </p>
                </div>
                    <p style="padding-top: 0">
                        First Name:
                        <br />
                        <asp:TextBox ID="firstName" runat="server" Width="255px" />
                        <asp:RequiredFieldValidator ID="firstNameValidator" runat="server" ErrorMessage="Required" 
                            ControlToValidate="firstName" />
                        <br /><br />

                        Last Name:
                        <br /> 
                        <asp:TextBox ID="lastName" runat="server" Width="255px" />
                        <asp:RequiredFieldValidator ID="lastNameValidator" runat="server" ErrorMessage="Required" 
                            ControlToValidate="lastName" />
                        <br /><br />

                        Your Email:<br />
                        <asp:TextBox ID="senderEmail" runat="server" Width="255px" />
                        <asp:RequiredFieldValidator ID="senderEmailValidator" runat="server" ErrorMessage="Required" 
                            ControlToValidate="senderEmail" />
                        <br />
                        <asp:RegularExpressionValidator ID="fromValidator" runat="server" ErrorMessage="Richard Stallman doesn't like your email" 
                            ControlToValidate="senderEmail" ValidationExpression="^([\w_\d]{1,35})((\.?[+]?[\w_\d]{1,10})?){3}?\@[\d\w-_]{1,20}\..{2,5}$" />
                        <br />                       

                        Message to the Boys:
                        <br />
                        <asp:TextBox ID="message" runat="server" Width="300px" TextMode="MultiLine" Height="100" />
                        <br />
                        <asp:RequiredFieldValidator ID="messageValidator" runat="server" 
                            ErrorMessage="Please leave us a message. We really want to hear from you" ControlToValidate="message" />
                    </p>
                    <div id="submitBar">
                        <asp:ImageButton ID="submitImage" runat="server" ImageUrl="~/images/b1.gif" OnClick="submitImage_Click" />
                    </div>
                </asp:Panel>
            </form>
        </div>
    </div>
</body>
</html>
