﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VoteOnElection.aspx.cs" Inherits="VoteOnElection" Debug="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vote On Election</title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%">
            <tr style="width:100%">
                <td style="width:100%"><h2 style="text-align:left">Vote On Elections</h2></td>
                <td style="width:100%;white-space: nowrap;">
                    <asp:Button ID="btnHome" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Home" OnClick="btnHome_Click"/>
                    <asp:Button ID="btnLogOut" runat="server" BackColor="#990099" BorderStyle="Solid" Font-Bold="True" ForeColor="White" Text="Log Out" OnClick="btnLogOut_Click"/>
                </td>
            </tr>
        </table>
        <hr />
        <asp:Label ID="lblElectionPicker" runat="server" Text="Select a election to vote on by ID: "></asp:Label>
        <asp:DropDownList ID="ddlPickElection" runat="server" DataTextField="ElectionID" DataValueField="ElectionID" AutoPostBack="True" Height="16px"></asp:DropDownList>
        <br /> <br />
        <asp:SqlDataSource ID="sdsPickElection" runat="server" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" SelectCommand="SELECT [ElectionID] FROM [Election]"></asp:SqlDataSource>
        <asp:GridView ID="gvElectionVoting" runat="server" AutoGenerateColumns="False" DataKeyNames="Username,ElectionID" >
            <Columns>
                <asp:BoundField DataField="ElectionID" HeaderText="ElectionID" ReadOnly="True" SortExpression="ElectionID" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="CommitteeID" HeaderText="CommitteeID" SortExpression="CommitteeID" HeaderStyle-ForeColor="#990099" />
                <asp:BoundField DataField="Name" HeaderText="Committee Name" SortExpression="Name" HeaderStyle-ForeColor="#990099" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsElectionFaculty" runat="server" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" SelectCommand="SELECT FacultyRunning.ElectionID, FacultyRunning.CommitteeID, Committee.Name, People.FirstName, People.LastName, FacultyRunning.Username FROM FacultyRunning INNER JOIN Committee ON FacultyRunning.CommitteeID = Committee.CommitteeID INNER JOIN People ON FacultyRunning.Username = People.Username WHERE (FacultyRunning.ElectionID = @ElectionID) ORDER BY FacultyRunning.ElectionID, FacultyRunning.Username">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlPickElection" DefaultValue="%" Name="ElectionID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="lblStatus" runat="server" Text="" EnableViewState ="False" ForeColor="#990099" Font-Bold="True"></asp:Label>
    </form>
</body>
</html>