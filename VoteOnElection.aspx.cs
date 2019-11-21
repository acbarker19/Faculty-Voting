using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VoteOnElection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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