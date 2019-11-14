<!--
    11-12-19 - Faith started working on the design view.
    11-12-19 - Amanda edited design.
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditElection.aspx.cs" Inherits="EditElection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add/Edit Elections</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Add/Edit Elections</h2>
        <hr />
        <asp:GridView ID="gvElections" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ElectionID" DataSourceID="sdsElections">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
                <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="ElectionID" HeaderText="ElectionID" InsertVisible="False" ReadOnly="True" SortExpression="ElectionID" HeaderStyle-ForeColor="#990099" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsElections" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" DeleteCommand="DELETE FROM [Election] WHERE [ElectionID] = @original_ElectionID AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL))" InsertCommand="INSERT INTO [Election] ([StartDate], [EndDate]) VALUES (@StartDate, @EndDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Election]" UpdateCommand="UPDATE [Election] SET [StartDate] = @StartDate, [EndDate] = @EndDate WHERE [ElectionID] = @original_ElectionID AND (([StartDate] = @original_StartDate) OR ([StartDate] IS NULL AND @original_StartDate IS NULL)) AND (([EndDate] = @original_EndDate) OR ([EndDate] IS NULL AND @original_EndDate IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_ElectionID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="original_StartDate" />
                    <asp:Parameter DbType="Date" Name="original_EndDate" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="StartDate" />
                    <asp:Parameter DbType="Date" Name="EndDate" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Date" Name="StartDate" />
                    <asp:Parameter DbType="Date" Name="EndDate" />
                    <asp:Parameter Name="original_ElectionID" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="original_StartDate" />
                    <asp:Parameter DbType="Date" Name="original_EndDate" />
                </UpdateParameters>
            </asp:SqlDataSource>
        <table>
            <tr>
                <td><asp:Label ID="lblElectionID" runat="server" Text="Election ID:"></asp:Label></td>
                <td><asp:TextBox ID="txtElectionID" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblStartDate" runat="server" Text="Start Date:"></asp:Label></td>
                <td><asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblEndDate" runat="server" Text="End Date:"></asp:Label></td>
                <td><asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="btnAddElection" OnClick ="btnAddElection_Click" runat="server" Text="Add Election" ForeColor="White" Font-Bold="True" BorderStyle="Solid" BackColor="#990099" /></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblStatus" runat="server" Text="" Font-Bold="True" ForeColor="#990099"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>
