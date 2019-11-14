<!--
    11-13-19 - Alec updated page to aspx instead of html to account for the session variable. Updated links.
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLanding.aspx.cs" Inherits="AdminLanding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrator Actions</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Administrator Actions</h2>
        <hr />
        <ul>
            <li><a href="VoteOnElection.aspx">Vote in an Election</a></li>
            <br />
            <li><a href="LatestElectionResults.aspx">View the Latest Election Results</a></li>
            <li><a href="CurrentCommittees.aspx">View Current Committees</a></li>
            <br />
            <li><a href="EditUser.aspx">Add/Edit Users</a></li>
            <li><a href="EditCommittee.aspx">Add/Edit Committees</a></li>
            <li><a href="EditElection.aspx">Add/Edit Election</a></li>
        </ul>
    </form>
</body>
</html>
