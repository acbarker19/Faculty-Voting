<!--
    11-12-19 - Faith started working on the design view.
    11-12-19 - Amanda edited button text, password visibility, and design.
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Welcome, </h2>
        <p>Please log in with your Username and Password:</p>
        <hr />
        <table>
            <tr>
                <td><asp:Label ID="lblUsername" runat="server" Text="Username: " ></asp:Label></td>
                <td><asp:TextBox ID="txtUsername" runat="server" ></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblPassword" runat="server" Text="Password: " ></asp:Label></td>
                <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="btnLogin" runat="server" Text="Log In" ForeColor="White" Font-Bold="True" BackColor="#990099" BorderStyle="Solid" OnClick="btnLogin_Click"/></td>
            </tr>
        </table>
    </form>
</body>
</html>

