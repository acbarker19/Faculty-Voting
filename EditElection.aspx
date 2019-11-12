<!--
    11-12-19 - Faith started working on the design view.
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditElection.aspx.cs" Inherits="EditElection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add/Edit Elections</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Add/Edit Elections</h3>

            <asp:Label ID="lblElectionID" runat="server" Text="Election ID:"></asp:Label>
                <br />
            <asp:TextBox ID="txtElectionID" runat="server"></asp:TextBox>
                <br />
                <br />
            <asp:Label ID="lblStartDate" runat="server" Text="Start Date:"></asp:Label>
                <br />
            <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                <br />
                <br />
            <asp:Label ID="lblEndDate" runat="server" Text="End Date:"></asp:Label>
                <br />
            <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                <br />
                <br />
            <asp:Button ID="btnAddElection" runat="server" Text="Add Election" />
        </div>
    </form>
</body>
</html>
