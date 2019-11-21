<!--
    11-13-19 - Alec created the page and added labels.
    11-17-19 - Amanda edited design to match other pages.
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LatestElectionResults.aspx.cs" Inherits="LatestElectionResults" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Log Out" OnClick="btnLogOut_Click"/>
        <h2>Latest Election</h2>
        <hr />
        <br />
        <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="#990099" Font-Bold="True"></asp:Label>
    </form>
</body>
</html>
