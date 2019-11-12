<!--
    11-12-19 - Faith started working on the design view.
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditCommittee.aspx.cs" Inherits="EditCommittee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add/Edit Commitees</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Add/Edit Commitees</h3>

            <asp:Label ID="lblCommitID" runat="server" Text="Commitee ID:"></asp:Label>
                <br />
            <asp:TextBox ID="txtCommitID" runat="server"></asp:TextBox>
                <br />
                <br />
            <asp:Label ID="lblCommitName" runat="server" Text="Commitee Name:"></asp:Label>
                <br />
            <asp:TextBox ID="txtCommitName" runat="server"></asp:TextBox>
                <br />
                <br />
            <asp:Label ID="lblCommitDesc" runat="server" Text="Commitee Description:"></asp:Label>
                <br />
            <asp:TextBox ID="txtCommitDesc" runat="server"></asp:TextBox>
                <br />
                <br />
            <asp:Label ID="lblCommitSize" runat="server" Text="Commitee Size:"></asp:Label>
                <br />
            <asp:TextBox ID="txtCommitSize" runat="server"></asp:TextBox>
                <br />
                <br />
            <asp:Label ID="lblTermLength" runat="server" Text="Term Length:"></asp:Label>
                <br />
            <asp:TextBox ID="txtTermLength" runat="server"></asp:TextBox>
                <br />
                <br />
            <asp:Button ID="btnAddCommit" runat="server" Text="Button" />
        </div>
    </form>
</body>
</html>
