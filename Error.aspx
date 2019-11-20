<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Error Page</h2>
            <hr />
            <br />
            You do not have permission to view this page.
            <br />
            <br />
            <asp:Button ID="btnHome" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Home" OnClick="btnHome_Click"/>
        </div>
    </form>
</body>
</html>
