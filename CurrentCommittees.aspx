<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CurrentCommittees.aspx.cs" Inherits="CurrentCommittees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%">
            <tr style="width:100%">
                <td style="width:100%"><h2 style="text-align:left">Current Committees</h2></td>
                <td style="width:100%">
                    <asp:Button ID="btnHome" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Home" OnClick="btnHome_Click"/>
                    <asp:Button ID="btnLogOut" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Log Out" OnClick="btnLogOut_Click"/>
                </td>
            </tr>
        </table>
        <hr />
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
        <asp:Label ID="lblSelectedCommittee" runat="server" ForeColor="#990099" Font-Bold="True"></asp:Label>
        <br />
        <br />

        <asp:GridView ID="gvPeopleInCommittee" runat="server" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="sdsCurrentCommitFaculty">
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" HeaderStyle-ForeColor="#990099" />
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
