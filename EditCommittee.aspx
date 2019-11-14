<!--
    11-12-19 - Brody started working on the design view.
    11-12-19 - Amanda edited design.
    11-14-19 - Amanda worked on button functionality.
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
            <h2>Add/Edit Committees</h2>
            <hr />
                <asp:GridView ID="gvCommittees" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CommitteeID" DataSourceID="sdsCommittees">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="CommitteeID" HeaderText="CommitteeID" InsertVisible="False" ReadOnly="True" SortExpression="CommitteeID" HeaderStyle-ForeColor="#990099" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-ForeColor="#990099" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" HeaderStyle-ForeColor="#990099" />
                        <asp:BoundField DataField="CommitteeSize" HeaderText="CommitteeSize" SortExpression="CommitteeSize" HeaderStyle-ForeColor="#990099" />
                        <asp:BoundField DataField="TermLength" HeaderText="TermLength" SortExpression="TermLength" HeaderStyle-ForeColor="#990099" />
                    </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsCommittees" runat="server" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Committee]">
            </asp:SqlDataSource>
                <table>
                    <tr>
                        <td><%--<asp:Label ID="lblCommitID" runat="server" Text="Commitee ID:"></asp:Label>--%></td>
                        <td><%--<asp:TextBox ID="txtCommitID" runat="server"></asp:TextBox>--%></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lblCommitName" runat="server" Text="Commitee Name:"></asp:Label></td>
                        <td><asp:TextBox ID="txtCommitName" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lblCommitDesc" runat="server" Text="Commitee Description:"></asp:Label></td>
                        <td><asp:TextBox ID="txtCommitDesc" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lblCommitSize" runat="server" Text="Commitee Size:"></asp:Label></td>
                        <td><asp:TextBox ID="txtCommitSize" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="lblTermLength" runat="server" Text="Term Length:"></asp:Label></td>
                        <td><asp:TextBox ID="txtTermLength" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Button ID="btnAddCommit" runat="server" Text="Add Committee" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" OnClick="btnAddCommit_Click"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Label ID="lblCommitStatus" runat="server" ForeColor="#990099"></asp:Label></td>
                    </tr>
            </table>
        </div>
    </form>
</body>
</html>
