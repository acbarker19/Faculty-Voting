<!--
    11-13-19 - Alec created the page and set up the GridView.
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CurrentCommittees.aspx.cs" Inherits="CurrentCommittees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="gvCommittees" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CommitteeID" DataSourceID="sdsCommittees">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CommitteeID" HeaderText="Committee ID #" InsertVisible="False" ReadOnly="True" SortExpression="CommitteeID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="CommitteeSize" HeaderText="Committee Size" SortExpression="CommitteeSize" />
                <asp:BoundField DataField="TermLength" HeaderText="Term Length" SortExpression="TermLength" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsCommittees" runat="server" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" SelectCommand="SELECT * FROM [Committee]"></asp:SqlDataSource>
        <asp:Label ID="lblSelectedCommittee" runat="server"></asp:Label>
    </form>
</body>
</html>
