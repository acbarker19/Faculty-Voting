<!--
    11-13-19 - Alec updated links.
    11-14-19 - Amanda edited design to match other pages.
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLanding.aspx.cs" Inherits="UserLanding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Actions</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="btnLogOut" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Log Out" OnClick="btnLogOut_Click"/>
        <h2>User Actions</h2>
        <hr />
        <ul>
            <li><a href="VoteOnElection.aspx">Vote in an Election</a></li>
            <li><a href="LatestElectionResults.aspx">View the Latest Election Results</a></li>
            <li><a href="CurrentCommittees.aspx">View Current Committees</a></li>
        </ul>
    </form>
</body>
</html>
