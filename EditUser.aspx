<!--
    11-12-19 - Jacob created, set up gv and sds, added textboxes/labels for adding.
    11-12-19 - Amanda edited design.
    11-13-19 - Who?? Changed SQL Data Source so info displayed correctly.
    11-14-19 - Amanda worked on btn functionality
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditUser.aspx.cs" Inherits="EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Users</title>
</head>
<body>
    <form id="form1" runat="server">
            <h2>Edit/Add Users</h2>
            <hr />
            <asp:GridView ID="gvUsers" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="sdsUsers" CellPadding="1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
                    <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" ControlStyle-BorderStyle="None" HeaderStyle-ForeColor="#990099" ><ControlStyle BorderStyle="None"></ControlStyle><HeaderStyle ForeColor="#990099"></HeaderStyle></asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" HeaderStyle-ForeColor="#990099" ><HeaderStyle ForeColor="#990099"></HeaderStyle></asp:BoundField>
                    <asp:BoundField DataField="AccountType" HeaderText="AccountType" SortExpression="AccountType" HeaderStyle-ForeColor="#990099" ><HeaderStyle ForeColor="#990099"></HeaderStyle></asp:BoundField>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" HeaderStyle-ForeColor="#990099" ><HeaderStyle ForeColor="#990099"></HeaderStyle></asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" HeaderStyle-ForeColor="#990099" ><HeaderStyle ForeColor="#990099"></HeaderStyle></asp:BoundField>
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" HeaderStyle-ForeColor="#990099" ><HeaderStyle ForeColor="#990099"></HeaderStyle></asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" HeaderStyle-ForeColor="#990099" ><HeaderStyle ForeColor="#990099"></HeaderStyle></asp:BoundField>
                    <asp:BoundField DataField="CanVote" HeaderText="CanVote" SortExpression="CanVote" HeaderStyle-ForeColor="#990099" ><HeaderStyle ForeColor="#990099"></HeaderStyle></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [People]">
            </asp:SqlDataSource>
            <table>
                <tr>
                    <td><asp:Label ID="lblUsername" runat="server" Text="Username: "></asp:Label></td>
                    <td><asp:TextBox ID="txtUser" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label></td>
                    <td><asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblAccountType" runat="server" Text="Has Administrative Permissions: "></asp:Label></td>
                    <td><asp:CheckBox ID="cbAccountType" runat="server" BorderColor="#990099" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblFirstName" runat="server" Text="First Name: "></asp:Label></td>
                    <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblLastName" runat="server" Text="Last Name: "></asp:Label></td>
                    <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblDepartment" runat="server" Text="Department: "></asp:Label></td>
                    <td><asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblTitle" runat="server" Text="Title: "></asp:Label></td>
                    <td><asp:TextBox ID="txtTitle" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblCanVote" runat="server" Text="Has Voting Permissions: "></asp:Label></td>
                    <td><asp:CheckBox ID="cbCanVote" runat="server" BorderColor="#990099" /></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button ID="btnAddUser" runat="server" Text="Add User" BackColor="#990099" Font-Bold="True" ForeColor="White" BorderStyle="Solid" OnClick="btnAddUser_Click"/></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Label ID="lblUserStatus" runat="server" ForeColor="#990099"></asp:Label></td>
                </tr>
            </table>
    </form>
</body>
</html>
