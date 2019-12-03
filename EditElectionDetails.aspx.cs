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

public partial class EditElectionDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountType"].Equals("user"))
        {
            Response.Redirect("Error.aspx");
        }

        DataSet people = getPeople();

        for (int row = 0; row < people.Tables[0].Rows.Count; row++)
        {
            cblPeople.Items.Add(people.Tables[0].Rows[row]["Username"].ToString());
        }
        cblPeople.SelectedIndexChanged += new EventHandler(cbList_SelectedIndexChanged);
    }

    void cbList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //fires both on check & uncheck of an item
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