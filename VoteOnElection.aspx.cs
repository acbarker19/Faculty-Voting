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
public partial class VoteOnElection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check for permission to view the page:
        if(!(Session["AccountType"].Equals("admin") || Session["AccountType"].Equals("user")))
        {
            Response.Redirect("Error.aspx");
        }

        //check for voting permissions:
        String username = Session["UserName"].ToString();
        DataSet ds = getPeople();
        for (int row = 0; row < ds.Tables[0].Rows.Count; row++)
        {
            //Checks if username exists (not case sensitive) and if it matches the password (case sensitive) and if the user is active
            if (String.Equals(ds.Tables[0].Rows[row]["Username"].ToString(), username, StringComparison.CurrentCultureIgnoreCase)
                && ds.Tables[0].Rows[row]["CanVote"].ToString() == "n")
            {
                Response.Redirect("Error.aspx");
            }
        }

        if (!IsPostBack)
        {
            ddlPickElection.DataSource = sdsPickElection; // sdsElectionFaculty;
            ddlPickElection.DataBind();
            ddlPickElection.Items.Insert(0, new ListItem("Select an Election", "%"));
            if (ddlPickElection.Items.Count <= 1)
            {
                lblStatus.Text = "There are no current elections occuring. Please check again later.";
            }
        }
        else
        {
            try
            {
                gvElectionVoting.DataSource = sdsElectionFaculty;
                gvElectionVoting.DataBind();
            }
            catch (FormatException)
            {
                gvElectionVoting.DataSource = null;
                gvElectionVoting.DataBind();
            }
        }
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
}