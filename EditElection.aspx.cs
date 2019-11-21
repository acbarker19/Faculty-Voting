using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditElection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("AccountType is " + Session["AccountType"] + ".");

        if (Session["AccountType"].Equals("user"))
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

    protected void btnAddElection_Click(object sender, EventArgs e)
    {
        string StartDate = txtStartDate.Text;
        string EndDate = txtEndDate.Text;

        if (StartDate.Length > 0 && EndDate.Length > 0)
        {
            sdsElections.InsertParameters["StartDate"].DefaultValue = StartDate;
            sdsElections.InsertParameters["EndDate"].DefaultValue = EndDate;

            try
            {
                sdsElections.Insert();
                lblStatus.Text = "The election was added.";
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error. Election not added.";
            }
        }
        else
        {
            lblStatus.Text = "You must enter data into all the fields before pressing the add button.";
        }

        txtStartDate.Text = "";
        txtEndDate.Text = "";
    }
}