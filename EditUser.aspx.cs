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

public partial class EditUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvUsers_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblUserStatus.Text = "Unable to delete.";
            e.ExceptionHandled = true;
        }
        else
        {
            if (e.AffectedRows == 0)
            {
                lblUserStatus.Text = "Delete failed. Someone else already deleted this user.";
            }
            else
            {
                lblUserStatus.Text = "Deleted OK";
            }
        }
    }

    protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string committeeID, committeeName;

        if (e.CommandName == "DeleteAsk")
        {
            GridViewRow gvr = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
            int rowIndex = gvr.RowIndex;
            committeeID = gvUsers.Rows[rowIndex].Cells[1].Text;
            committeeName = gvUsers.Rows[rowIndex].Cells[2].Text;

            Response.Write("You chose to delete " + committeeID + ": " + committeeName);

            Session["DeleteCommitteeID"] = committeeID;
            Session["DeleteCommitteeName"] = committeeName;
            lblUserStatus.Text = "Confirm delete for " + committeeID + ": " + committeeName + "?";
            e.Handled = true;

        }

        

        


        //majorCode = (string)Session["DeleteMajorCode"];
        //majorDescription = (string)Session["DeleteMajorDescription"];



        //Response.Write("You are deleting " + majorCode + ": " + majorDescription);
        //int numRowsAffected;
        //SqlConnection conn;
        //SqlCommand cmd;

        //conn = new SqlConnection(getConnectionString());
        //conn.Open();

        //cmd = new SqlCommand();
        //cmd.Connection = conn;
        //cmd.CommandType = CommandType.Text;
        //cmd.CommandText = "DELETE FROM Major WHERE MajorCode = '" + majorCode + "'";

        //try
        //{
        //    numRowsAffected = cmd.ExecuteNonQuery();
        //    if (numRowsAffected == 1)
        //    {
        //        lblStatus.Text = majorCode + ": " + majorDescription + " deleted.";
        //        gvMajors.DataBind();
        //    }
        //    else
        //    {
        //        lblStatus.Text = "Not deleted. Someone els already deleted it.";
        //    }
        //}
        //catch (Exception ex)
        //{
        //    lblStatus.Text = "Not delted. You many not delete " + majorCode + ": " + majorDescription
        //        + " because some students have that major.";
        //}



        //conn.Close();

    }

    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        string username, password, fName, lName, department, title, accountType;
        char canVote;

        int numRowsAffected;
        try
        {
            if (txtUsername.Text.Length > 0 && txtPassword.Text.Length > 0 &&
                txtFirstName.Text.Length > 0 && txtLastName.Text.Length > 0 &&
                txtDepartment.Text.Length > 0 && txtTitle.Text.Length > 0)
            {
                username = txtUsername.Text;
                password = txtPassword.Text;
                fName = txtFirstName.Text;
                lName = txtLastName.Text;
                department = txtDepartment.Text;
                title = txtTitle.Text;
                
                if (cbCanVote.Checked == true)
                {
                    canVote = 'y'; 

                }
                else
                {
                    canVote = 'n';
                }

                if (cbAccountType.Checked == true)
                {
                    accountType = "admin";
                }
                else
                {
                    accountType = "user";
                }

                SqlConnection conn = new SqlConnection(getConnectionString());
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO People (Username, Password, FirstName, LastName, "+
                    "Department, Title, AccountType, CanVote) "
                    + "VALUES ('" + username + "','" + password + "','" + fName + "','" + lName + "','" 
                    + department + "','" + title + "','" + accountType + "','" + canVote + "')";
                conn.Open();

                try
                {
                    numRowsAffected = cmd.ExecuteNonQuery();
                    if (numRowsAffected == 1)
                    {
                        lblUserStatus.Text = "User " + fName + " " + lName + " added.";
                        txtUsername.Text = "";
                        txtPassword.Text = "";
                        txtFirstName.Text = "";
                        txtLastName.Text = "";
                        txtDepartment.Text = "";
                        txtTitle.Text = "";
                        cbAccountType.Checked = false; 
                        cbCanVote.Checked = false;
                        Server.Transfer("~/EditUser.aspx");
                    }
                    else
                    {
                        lblUserStatus.Text = "Not added.";
                    }
                }
                catch (Exception ex)
                {
                    lblUserStatus.Text = "Not added. User already exists.";
                }
                conn.Close();
            }
            else
            {
                lblUserStatus.Text = "Please make sure you have entered information in all the textboxes.";
            }
        }
        catch (FormatException ex)
        {
            lblUserStatus.Text = "Error. User not added.";
        }

    }
    private string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["FacultyVotingConnectionString"].ConnectionString;
    }
}   