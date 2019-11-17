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
            ddlPickElection.DataSource = sdsElectionFaculty;
            ddlPickElection.DataBind();
            ddlPickElection.Items.Insert(0, new ListItem("Select a Election", "%"));
        }
    }
}