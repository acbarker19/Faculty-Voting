using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// We added these Namespaces:
using System.Data;           // for CommandType of a SqlCommand
using System.Data.SqlClient; // for SqlConnection, SqlCommand, SqlDataReader
using System.Configuration;  // for ConfigurationManager

public partial class EditCommittee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void btnAddCommit_Click(object sender, EventArgs e)
    {
        //CommitteeID int, Name string, Description string, CommitteeSize int, TermLength int
        //int CommitteeID; NOT NEEDED - AUTO GENERATED
        int CommitteeSize, TermLength;
        string Name, Description;
        int numRowsAffected;

        try
        {
            CommitteeSize = Convert.ToInt32(txtCommitSize.Text);
            try
            {
                TermLength = Convert.ToInt32(txtTermLength.Text);
                if (txtCommitName.Text.Length > 0 && txtCommitDesc.Text.Length > 0)
                {
                    Name = txtCommitName.Text;
                    Description = txtCommitDesc.Text;

                    SqlConnection conn = new SqlConnection(getConnectionString());
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "INSERT INTO Committee (Name, Description, CommitteeSize, TermLength) "
                        +"VALUES ('" + Name + "','" + Description + "'," + CommitteeSize + "," + TermLength + ")";
                    conn.Open();

                    try
                    {
                        numRowsAffected = cmd.ExecuteNonQuery();
                        if (numRowsAffected == 1)
                        {
                            lblCommitStatus.Text = "Committee " + Name + ": " + Description + " added.";
                            txtCommitSize.Text = "";
                            txtTermLength.Text = "";
                            txtCommitName.Text = "";
                            txtCommitDesc.Text = "";
                            //getAllMajors();
                            Server.Transfer("~/EditCommittee.aspx");
                        }
                        else
                        {
                            lblCommitStatus.Text = "Not added.";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblCommitStatus.Text = "Not added. Committee already exists.";
                    }
                    conn.Close();

                    //numRowsAffected = ws.insertBankAccount(accountID, lastName, firstName, balance);
                    //if (numRowsAffected > 0)
                    //{
                    //    lblCommitStatus.Text = "Committee added OK.";
                    //    txtCommitSize.Text = "";
                    //    txtTermLength.Text = "";
                    //    txtCommitName.Text = "";
                    //    txtCommitDesc.Text = "";
                    //    // Refresh the page to refresh the GridView
                    //    Server.Transfer("~/EditCommittee.aspx");
                    //}
                    //else
                    //{
                    //    lblCommitStatus.Text = "There already is a Committee with that ID.";
                    //}
                }
                else
                {
                    lblCommitStatus.Text = "Please enter a name and a description.";
                }
            }
            catch (FormatException ex)
            {
                lblCommitStatus.Text = "Please enter an integer for the Term Length.";
            }
        }
        catch (FormatException ex)
        {
            lblCommitStatus.Text = "Please enter an integer for Committee Size.";
        }
    }
    private string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["FacultyVotingConnectionString"].ConnectionString;
    } 
}