<!--
    11-12-19 - Faith started working on the design view.
    11-12-19 - Amanda edited button text, password visibility, and design.
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Welcome, </h3>
        <p>Please log in with your Username and Password:</p>

        <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
            <br />
        <asp:TextBox ID="txtUsername" runat="server" Font-Size="Medium" Height="83px" Width="657px"></asp:TextBox>
            <br />
            <br />
        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
            <br />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Font-Size="Medium" Height="73px" Width="654px"></asp:TextBox>
            <br />
            <br />
        <asp:Button ID="btnLogin" runat="server" Text="Log In" Font-Size="Small" />
    </form>
</body>
</html>
