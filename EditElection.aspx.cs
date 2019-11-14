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
    }
}