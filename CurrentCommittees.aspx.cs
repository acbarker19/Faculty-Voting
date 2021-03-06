﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CurrentCommittees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //check for permission to view the page:
        if (!(Session["AccountType"].Equals("admin") || Session["AccountType"].Equals("user")))
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

}