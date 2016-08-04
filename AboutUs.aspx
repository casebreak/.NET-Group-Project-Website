<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>
<%@ Register TagPrefix="uc" TagName="Navigation" Src="navigation.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>About Us</title>
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
            <h2 class="contentHeader">"Anything worth doing, is worth doing well"</h2>
            <div class="image" runat="server">
                <img class="ben" src="images/benGoggles_200x200.png" title="NOT Stallman!" alt="This may or may not be Ben" />
            </div>
            <p><span class="BNSwords">Ben Holmgren.</span> Developer. Blacksmith. Renaissance man. Ben wears more hats than a sombrero model,
             and he wouldn't have it any other way. With a stalwart base of knowledge, life experience, and creative prowess, Ben attacks
             development projects like a kung-fu master. His nickname, "WebFoo", is no surprise. If Ben lived in a box, he would do all of his 
             thinking outside of it. A self-starter with a keen eye for detail, He is the truly built rudder for your project. 
             As the winds of life blow, let Ben be your sail. So sit back, relax, and prepare for a horizon littered with possibility.</p>
            
            <div class="image" runat="server"> 
                <img class="scott" src="images/scott_goofball_small.png" title="NOT Ben!" alt="This probably is Scott" />
            </div>
            <p><span class="BNSwords">Scott Duncan.</span> Coming from a manufacturing background, 
            Scott has the ability to fine tune your project with a precision rivled only by a Swiss timepiece. With a healthy dose of obsessive 
            compulsion, laser focus, and creative musings, you can be sure that no detail will be left unnoticed. Scott has often been acused 
            of thinking more like a computer than a human, and as such, he's mentally indestructable. All of his windows are covered, his clocks 
            are broken, and he only eats once a week. This lifestyle provides ample time to tackle any development project, big or small. Why risk 
            human influence when you can have a bio-robot flawlessly solve all of your development riddles? Easy answer: you wouldn't.</p>
        </div>
        <div id="footer">
            <p>All rights reserved. The use of Ben's face and all related content blah blah blah legal stuff.</p>
        </div>
    </div>
</body>
</html>
