using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLanding : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("AccountType is " + Session["AccountType"] + ".");

        if (Session["AccountType"].Equals("user"))
        {
            Response.Redirect("Error.aspx");
        }
    }
}