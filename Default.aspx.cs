using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.ComponentModel; // for using DataObject & DataObjectMethod attributes
using System.Configuration; // for getting ConnectionString from Web.config
using System.Data; // for the DataSet class and for CommandType
using System.Data.SqlClient; // for SqlConnection, SqlCommand, etc.

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["FacultyVotingConnectionString"].ConnectionString;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public DataSet getPeople()
    {
        SqlDataAdapter dad = new SqlDataAdapter("SELECT * FROM People", getConnectionString());
        DataSet ds = new DataSet();
        dad.Fill(ds);

        return ds;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataSet ds = getPeople();

        Boolean loginAllowed = false;
        String accountType = null;

        for (int row = 0; row < ds.Tables[0].Rows.Count; row++)
        {
            //Checks if username exists (not case sensitive) and if it matches the password (case sensitive)
            if (String.Equals(ds.Tables[0].Rows[row]["Username"].ToString(), txtUsername.Text, StringComparison.CurrentCultureIgnoreCase)
                && ds.Tables[0].Rows[row]["Password"].ToString() == txtPassword.Text)
            {
                loginAllowed = true;
                accountType = ds.Tables[0].Rows[row]["AccountType"].ToString();
                break;
            }
        }

        if (loginAllowed)
        {
            if(String.Equals(accountType, "Admin", StringComparison.CurrentCultureIgnoreCase))
            {
                Response.Redirect("AdminLanding.aspx");
                Session["UserName"] = txtUsername.text;
                Session["AccountType"] = accountType;
            }
            else if(String.Equals(accountType, "User", StringComparison.CurrentCultureIgnoreCase))
            {
                Response.Redirect("UserLanding.aspx");
                Session["UserName"] = txtUsername.text;
                Session["AccountType"] = accountType;
            }
            else
            {
                lblStatus.Text = "This user has not been given permissions to view this website.";
            }
        }
        else
        {
            lblStatus.Text = "The entered username or password was incorrect.";
        }
    }
}