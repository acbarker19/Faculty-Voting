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

using System.Collections; // for ArrayList

public partial class LatestElectionResults : System.Web.UI.Page
{
    private DataSet dsGeneral;

    protected void Page_Load(object sender, EventArgs e)
    {
        dsGeneral = getGeneralElectionResults();

        displayElectionInfo(getNewestCompleteElection());
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

    private void displayElectionInfo(int electionID)
    {
        if (electionID == -1)
        {
            lblInfo.Text = "There are no complete elections at this time.";
        }
        else
        {
            DataSet dsSpecific = getSpecificElectionResults(electionID);

            DateTime startDate = Convert.ToDateTime(dsSpecific.Tables[0].Rows[0]["StartDate"]);
            DateTime endDate = Convert.ToDateTime(dsSpecific.Tables[0].Rows[0]["EndDate"]);

            lblInfo.Text = "<table><tr><td colspan=\"2\"><h3>Election #" + electionID + "</h3></td></tr>" +
                "<tr><td>Start Date</td><td>" + startDate.ToString("MMMM dd, yyyy") +
                "</td></tr><tr><td>End Date</td><td>" + endDate.ToString("MMMM dd, yyyy") + "</td></tr></table>" +
                "<br /><br />";

            ArrayList committeesRunning = new ArrayList();

            int committeeID = -1;

            for (int row = 0; row < dsSpecific.Tables[0].Rows.Count; row++)
            {
                committeeID = Convert.ToInt32(dsSpecific.Tables[0].Rows[row]["CommitteeID"]);

                if (committeeID != -1 && committeesRunning.Contains(committeeID) == false)
                {
                    committeesRunning.Add(committeeID);
                }
            }

            DataSet dsCommittee;
            int totalVotes;
            int numPositionsAvailable;
            String name;
            

            for(int committee = 0; committee < committeesRunning.Count; committee++)
            {
                dsCommittee = getSpecificElectionResultsForCommittee(electionID,
                    Convert.ToInt32(committeesRunning[committee]));
                totalVotes = 0;
                numPositionsAvailable = Convert.ToInt32(dsCommittee.Tables[0].Rows[0]["NumPositionsAvailable"]);

                List<Tuple<String, int>> voteList = new List<Tuple<String, int>>();

                lblInfo.Text += "<table><tr><td colspan=\"2\"><b>" + dsCommittee.Tables[0].Rows[0]["Name"] +
                    "</b> - " + numPositionsAvailable + " Position(s) Available" +
                    "</td></tr><tr><td colspan=\"2\">" + dsCommittee.Tables[0].Rows[0]["Description"] +
                    "</td></tr><tr><td colspan=\"2\"><hr></td></tr>";

                for (int row = 0; row < dsCommittee.Tables[0].Rows.Count; row++)
                {
                    name = dsCommittee.Tables[0].Rows[row]["FirstName"] + " " + dsCommittee.Tables[0].Rows[row]["LastName"];
                    lblInfo.Text += "<tr><td>" + name + "</td><td>" +
                            dsCommittee.Tables[0].Rows[row]["NumberOfVotes"] + "</td></tr>";
                    totalVotes += Convert.ToInt32(dsCommittee.Tables[0].Rows[row]["NumberOfVotes"]);

                    voteList.Add(Tuple.Create(name, Convert.ToInt32(dsCommittee.Tables[0].Rows[row]["NumberOfVotes"])));
                }

                int neededVotes;

                if (totalVotes % 2 == 0)
                {
                    neededVotes = totalVotes / 2;
                }
                else
                {
                    neededVotes = totalVotes / 2 + 1;
                }

                lblInfo.Text += "<tr><td colspan=\"2\"><hr></td></tr><tr><td>Total Number of Votes</td>" +
                    "<td>" + totalVotes + "</td></tr><tr><td>Number of Votes Needed</td>" +
                    "<td>" + neededVotes + "</td></tr>" +
                    "<tr><td colspan=\"2\"><hr></td></tr>";

                //Orders list by number of votes from most to least
                voteList = voteList.OrderBy(i => i.Item2).ToList();
                voteList.Reverse();

                int positionsFilled = 0;
                List<Tuple<String, int>> notElectedList = new List<Tuple<String, int>>();

                for (int position = 0; position < voteList.Count; position++)
                {
//Right now only works for if the person gets more votes than needed. Need to check if it exceeds the number of
//open positions, and if there is a tie. In either case, there may need to be a run-off
                    if (voteList[position].Item2 >= neededVotes)
                    /*    && !notElectedList.Contains(voteList[position])
                        && position < voteList.Count
                        && voteList[position].Item2 != voteList[position + 1].Item2
                        && position > 0
                        && voteList[position].Item2 == voteList[position + 1].Item2) */
                    {
                        positionsFilled++;

                        lblInfo.Text += "<tr><td colspan=\"2\">" + voteList[position].Item1 + " was elected to " +
                        dsCommittee.Tables[0].Rows[0]["Name"] + "</td></tr>";
                    }
                /*    else if(position != voteList.Count - 1
                        && voteList[position].Item2 == voteList[position + 1].Item2)
                    {
                        notElectedList.Add(voteList[position]);
                        notElectedList.Add(voteList[position + 1]);
                    }
                    else
                    {
                        notElectedList.Add(voteList[position]);
                    }*/
                }
                
                if(positionsFilled < numPositionsAvailable)
                {
                    lblInfo.Text += "<tr><td colspan=\"2\">Not all positions were filled. There will be a runoff " +
                        "election for the following nominees:</td></tr>";

                    for(int position = 0; position < notElectedList.Count; position++)
                    {
                        lblInfo.Text += "<tr><td colspan=\"2\">" + notElectedList[position].Item1 + "</td></tr>";
                    }
                }

                lblInfo.Text += "</table><br /><br />";
            }
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
        SqlDataAdapter dad = new SqlDataAdapter("EXEC getSpecificElectionResults " + electionID,
            getConnectionString());
        DataSet ds = new DataSet();
        dad.Fill(ds);

        return ds;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public DataSet getSpecificElectionResultsForCommittee(int electionID, int committeeID)
    {
        SqlDataAdapter dad = new SqlDataAdapter("EXEC getSpecificElectionResultsForCommittee " +
            electionID + ", " + committeeID, getConnectionString());
        DataSet ds = new DataSet();
        dad.Fill(ds);

        return ds;
    }

    public int getNewestCompleteElection()
    {
        int electionID = -1;
        DateTime today = DateTime.Today;
        DateTime newestEndDate = Convert.ToDateTime("01/01/0001");
        
        for (int row = 0; row < dsGeneral.Tables[0].Rows.Count; row++)
        {
            DateTime endDate = Convert.ToDateTime(dsGeneral.Tables[0].Rows[row]["EndDate"].ToString());

            //Checks if the election ended before today and if it is the last election to end.
            if (endDate.Date < today.Date && newestEndDate.Date < endDate.Date)
            {
                newestEndDate = Convert.ToDateTime(dsGeneral.Tables[0].Rows[row]["EndDate"]);
                electionID = Convert.ToInt32(dsGeneral.Tables[0].Rows[row]["ElectionID"]);
            }
        }

        return electionID;
    }
}