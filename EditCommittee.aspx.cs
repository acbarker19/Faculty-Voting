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
        Response.Write("AccountType is " + Session["AccountType"] + ".");

        if (Session["AccountType"] == "user")
        {
            Response.Redirect("Error.aspx");
        }
    }

    protected void btnAddCommit_Click(object sender, EventArgs e)
    {
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
                        + "VALUES ('" + Name + "','" + Description + "'," + CommitteeSize + "," + TermLength + ")";
                    conn.Open();

                    try
                    {
                        numRowsAffected = cmd.ExecuteNonQuery();
                        if (numRowsAffected == 1)
                        {
                            txtCommitSize.Text = "";
                            txtTermLength.Text = "";
                            txtCommitName.Text = "";
                            txtCommitDesc.Text = "";
                            Server.Transfer("~/EditCommittee.aspx");
                            lblCommitStatus.Text = "Committee " + Name + ": " + Description + " added.";
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
    protected void gvCommittees_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblCommitStatus.Text = "Unable to save changes." + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblCommitStatus.Text = "Update failed. Someone else changed or deleted this committee.";
        }
    }

    protected void gvCommittees_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblCommitStatus.Text = "Unable to delete." + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblCommitStatus.Text = "Delete failed. Someone else changed or deleted this committee.";
        }
    }
}