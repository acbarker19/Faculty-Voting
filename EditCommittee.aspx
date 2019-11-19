<!--
    11-12-19 - Brody started working on the design view.
    11-12-19 - Amanda edited design.
    11-14-19 - Amanda worked on button functionality.
    11-17-19 - Amanda edited design to match other pages.
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
                        <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="CommitteeID" HeaderText="CommitteeID" InsertVisible="False" ReadOnly="True" SortExpression="CommitteeID" HeaderStyle-ForeColor="#990099" >
<HeaderStyle ForeColor="#990099"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-ForeColor="#990099" >
<HeaderStyle ForeColor="#990099"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" HeaderStyle-ForeColor="#990099" >
<HeaderStyle ForeColor="#990099"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="CommitteeSize" HeaderText="CommitteeSize" SortExpression="CommitteeSize" HeaderStyle-ForeColor="#990099" >
<HeaderStyle ForeColor="#990099"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TermLength" HeaderText="TermLength" SortExpression="TermLength" HeaderStyle-ForeColor="#990099" >
<HeaderStyle ForeColor="#990099"></HeaderStyle>
                        </asp:BoundField>
                    </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sdsCommittees" runat="server" ConnectionString="<%$ ConnectionStrings:FacultyVotingConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Committee]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Committee] WHERE [CommitteeID] = @original_CommitteeID AND [Name] = @original_Name AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([CommitteeSize] = @original_CommitteeSize) OR ([CommitteeSize] IS NULL AND @original_CommitteeSize IS NULL)) AND (([TermLength] = @original_TermLength) OR ([TermLength] IS NULL AND @original_TermLength IS NULL))" InsertCommand="INSERT INTO [Committee] ([Name], [Description], [CommitteeSize], [TermLength]) VALUES (@Name, @Description, @CommitteeSize, @TermLength)" UpdateCommand="UPDATE [Committee] SET [Name] = @Name, [Description] = @Description, [CommitteeSize] = @CommitteeSize, [TermLength] = @TermLength WHERE [CommitteeID] = @original_CommitteeID AND [Name] = @original_Name AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([CommitteeSize] = @original_CommitteeSize) OR ([CommitteeSize] IS NULL AND @original_CommitteeSize IS NULL)) AND (([TermLength] = @original_TermLength) OR ([TermLength] IS NULL AND @original_TermLength IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_CommitteeID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                    <asp:Parameter Name="original_CommitteeSize" Type="Int32" />
                    <asp:Parameter Name="original_TermLength" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CommitteeSize" Type="Int32" />
                    <asp:Parameter Name="TermLength" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CommitteeSize" Type="Int32" />
                    <asp:Parameter Name="TermLength" Type="Int32" />
                    <asp:Parameter Name="original_CommitteeID" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Description" Type="String" />
                    <asp:Parameter Name="original_CommitteeSize" Type="Int32" />
                    <asp:Parameter Name="original_TermLength" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
                <br />
                <table>
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
                        <td colspan="2"><asp:Label ID="lblCommitStatus" runat="server" ForeColor="#990099" EnableViewState="false"></asp:Label></td>
                    </tr>
            </table>
        </div>
    </form>
</body>
</html>
