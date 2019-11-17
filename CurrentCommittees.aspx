<!--
    11-13-19 - Alec created the page and set up the GridView.
    11-17-19 - Faith got the connect gridView working.
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CurrentCommittees.aspx.cs" Inherits="CurrentCommittees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Current Committees</h2>
        <hr />
        <br />

        <asp:GridView ID="gvCommittees" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CommitteeID" DataSourceID="sdsCommittees">
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                <asp:BoundField DataField="CommitteeID" HeaderText="Committee ID #" InsertVisible="False" ReadOnly="True" SortExpression="CommitteeID" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="CommitteeSize" HeaderText="Committee Size" SortExpression="CommitteeSize" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="TermLength" HeaderText="Term Length" SortExpression="TermLength" HeaderStyle-ForeColor="#990099" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsCommittees" runat="server" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" SelectCommand="SELECT * FROM [Committee]"></asp:SqlDataSource>

        <br />
        <asp:Label ID="lblSelectedCommittee" runat="server" ForeColor="#990099"></asp:Label>
        <br />

        <asp:GridView ID="gvPeopleInCommittee" runat="server" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="sdsCurrentCommitFaculty">
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsCurrentCommitFaculty" runat="server" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" SelectCommand="SELECT People.Username, People.FirstName, People.LastName, People.Department, People.Title FROM FacultyInCommittee, People WHERE ([CommitteeID] = @CommitteeID) AND FacultyInCommittee.Username = People.Username">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvCommittees" Name="CommitteeID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
