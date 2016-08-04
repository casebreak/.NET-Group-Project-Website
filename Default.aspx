<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
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
            <p>Welcome to <span class="BNSwords">Ben's Not Stallman!</span> If Ben isn't Stallman, then who is? We'll let you figure
            it out! We're not here to split hairs, we're here to sell you the BEST <span class="BNSwords">Ben's Not Stallman</span> gear
            at the BEST prices! We are so confident that we have the lowest prices on all your BNS gear that we will price match our 
            compeditors! How can we be so confident, you ask? The answer is simple: We literally have no competition! Bring. It. On.</p> 
            
            <p>In all seriousness, Ben is not Stallman, but he sorta looks like him. This site is a celebration of that phenomenon.
            Sticking with the ever clever <a href="http://www.gnu.org/gnu/gnu-history.en.html" >naming scheme</a> 
            of the great <a href="https://stallman.org" >Richard M. Stallman</a>, we made our own pun, and are running wild with it!
            So who is Ben? He's the face you want on your coffee mug. He's an enigma wrapped in a mystery. He is the echo of your
            heart strings. But best of all, he's not Stallman; something we can all be grateful for.</p>
            
            <p>Still not sure what this is all about? That's fine. Start your journey to understanding by purchasing our fine wares.
            You may be confused, but you'll surely not be disappointed!</p>
        </div>
        <div id="footer">
            <p>All rights reserved. The use of Ben's face and all related content blah blah blah legal stuff.</p>
        </div>
    </div>
</body>
</html>
