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

public partial class LatestElectionResults : System.Web.UI.Page
{
    private DataSet dsGeneral;

    protected void Page_Load(object sender, EventArgs e)
    {
        dsGeneral = getGeneralElectionResults();

        displayElectionInfo(getNewestCompleteElection());
    }

    private void displayElectionInfo(int electionID)
    {
        if (electionID == -1)
        {
            lblInfo.Text = "There are no complete elections at this time.";
        }
        else
        {
            DataSet dsSpecific = getSpecificElectionResults(electionID);
            lblInfo.Text = Convert.ToString(dsSpecific.Tables[0].Rows[0]["Description"]);
        }
    }

    private string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["FacultyVotingConnectionString"].ConnectionString;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public DataSet getGeneralElectionResults()
    {
        SqlDataAdapter dad = new SqlDataAdapter("EXEC getElectionResults", getConnectionString());
        DataSet ds = new DataSet();
        dad.Fill(ds);

        return ds;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public DataSet getSpecificElectionResults(int electionID)
    {
        SqlDataAdapter dad = new SqlDataAdapter("EXEC getSpecificElectionResults " + electionID, getConnectionString());
        DataSet ds = new DataSet();
        dad.Fill(ds);

        return ds;
    }

    public int getNewestCompleteElection()
    {
        int electionID = -1;
        DateTime today = DateTime.Today;
        DateTime newestEndDate = DateTime.Today;
        
        for (int row = 0; row < dsGeneral.Tables[0].Rows.Count; row++)
        {
            DateTime endDate = Convert.ToDateTime(dsGeneral.Tables[0].Rows[row]["EndDate"].ToString());

            //Checks if the election ended before today and if it is the last election to end.
            if (DateTime.Compare(today, endDate) > 0 && DateTime.Compare(endDate, newestEndDate) > 0)
            {
                newestEndDate = Convert.ToDateTime(dsGeneral.Tables[0].Rows[row]["EndDate"]);
                electionID = Convert.ToInt32(dsGeneral.Tables[0].Rows[row]["ElectionID"]);
            }
        }

        return electionID;
    }
}