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
        //check for permission to view the page:
        if (!Session["AccountType"].Equals("admin"))
        {
            Response.Redirect("Error.aspx");
        }
    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }

    protected void btnHome_Click(object sender, EventArgs e)
    {
        if (Session["AccountType"].Equals("admin"))
        {
            Response.Redirect("AdminLanding.aspx");
        }
        else if (Session["AccountType"].Equals("user"))
        {
            Response.Redirect("UserLanding.aspx");
        }
    }

    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        string username, password, fName, lName, department, title, accountType, isActive;
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

                if (cbActive.Checked == true)
                {
                    isActive = "YES";
                }
                else
                {
                    isActive = "NO";
                }

                SqlConnection conn = new SqlConnection(getConnectionString());
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO People (Username, Password, FirstName, LastName, "+
                    "Department, Title, AccountType, CanVote, Active) "
                    + "VALUES ('" + username + "','" + password + "','" + fName + "','" + lName + "','" 
                    + department + "','" + title + "','" + accountType + "','" + canVote + "','" 
                    + isActive + "')";
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