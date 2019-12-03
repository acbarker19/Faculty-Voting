<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditElectionDetails.aspx.cs" Inherits="EditElectionDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%">
            <tr style="width:100%">
                <td style="width:100%"><h2 style="text-align:left">Add Committees/Faculty to Elections</h2></td>
                <td style="width:100%;white-space: nowrap;">
                    <asp:Button ID="btnHome" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Home" OnClick="btnHome_Click"/>
                    <asp:Button ID="btnLogOut" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Log Out" OnClick="btnLogOut_Click"/>
                </td>
            </tr>
        </table>
        <hr />
        <asp:Label ID="lblElectionID" runat="server" Text="Election ID: "></asp:Label>
        <asp:DropDownList ID="ddlElections" runat="server" DataSourceID="sdsElections" DataTextField="ElectionID" DataValueField="ElectionID"></asp:DropDownList>
        <asp:SqlDataSource ID="sdsElections" runat="server" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" SelectCommand="SELECT [ElectionID] FROM [Election]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="lblCommittee" runat="server" Text="Committee: "></asp:Label>
        <asp:DropDownList ID="ddlCommittees" runat="server" DataSourceID="sdsCommittees" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
        <asp:SqlDataSource ID="sdsCommittees" runat="server" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" SelectCommand="SELECT [Name] FROM [Committee]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="lblNumPositions" runat="server" Text="Number of Positions up for Election: "></asp:Label>
        <asp:TextBox ID="txtNumPositions" runat="server"></asp:TextBox>
        <br />
        <asp:CheckBoxList ID="cblPeople" runat="server"></asp:CheckBoxList>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add Committee to Election" ForeColor="White" Font-Bold="True" BorderStyle="Solid" BackColor="#990099"  />
    </form>
</body>
</html>
