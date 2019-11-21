<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Log Out" OnClick="btnLogOut_Click"/>
            <h2>Error Page</h2>
            <hr />
            <br />
            You do not have permission to view this page.
            We recommend using the back button on your browser to return to the last page you were on.
            Click the button below to return to the page you encounter upon logging in.
            <br />
            <br />
            <asp:Button ID="btnHome" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Home" OnClick="btnHome_Click"/>
        </div>
    </form>
</body>
</html>
