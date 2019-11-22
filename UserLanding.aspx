<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLanding.aspx.cs" Inherits="UserLanding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Actions</title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%">
            <tr style="width:100%">
                <td style="width:100%"><h2 style="text-align:left">User Actions</h2></td>
                <td style="width:100%">
                    <asp:Button ID="btnLogOut" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Log Out" OnClick="btnLogOut_Click"/>
                </td>
            </tr>
        </table>
        <hr />
        <ul>
            <li><a href="VoteOnElection.aspx">Vote in an Election</a></li>
            <li><a href="LatestElectionResults.aspx">View the Latest Election Results</a></li>
            <li><a href="CurrentCommittees.aspx">View Current Committees</a></li>
        </ul>
    </form>
</body>
</html>