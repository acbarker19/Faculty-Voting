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

    }

    protected void btnAddElection_Click(object sender, EventArgs e)
    {
        string ElectionID = txtElectionID.Text;
        string StartDate = txtStartDate.Text;
        string EndDate = txtEndDate.Text;

        if (ElectionID.Length > 0 && StartDate.Length > 0 && EndDate.Length > 0)
        {
            sdsElections.InsertParameters["ElectionID"].DefaultValue = ElectionID;
            sdsElections.InsertParameters["StartDate"].DefaultValue = StartDate;
            sdsElections.InsertParameters["EndDate"].DefaultValue = EndDate;

            try
            {
                sdsElections.Insert();
                lblStatus.Text = ElectionID + " : " + StartDate + " : " + EndDate + " : was added.";
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error: Duplicate ElectionID. "
                               + ElectionID + " : " + StartDate + " : " + EndDate + ": was not added.";
            }
        }
        else
        {
            lblStatus.Text = "You must enter data into all the fields before pressing the add button.";
        }

        txtElectionID.Text = "";
        txtStartDate.Text = "";
        txtEndDate.Text = "";
    }
}