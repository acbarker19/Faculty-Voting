using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;           // for CommandType of a SqlCommand
using System.Data.SqlClient; // for SqlConnection, SqlCommand, SqlDataReader
using System.Configuration;  // for ConfigurationManager
using System.ComponentModel;

[DataObject(true)]
public static class UserDataSet
{
    //Todo: Setup dataSet
    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int insertUser(string Username, string Password, string AccountType, string FirstName, string LastName, string Department, string Title, char canVote)
    {
        SqlConnection conn;
        SqlCommand cmd;
        int numRowsAffected;
        conn = new SqlConnection(getConnectionString());
        cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO People" +
            "VALUES: ('" + Username + "','" + Password + "','" + AccountType + "','" + FirstName + "','" + LastName + "','" + Department + "','" + Title + "','" + canVote + "');";
         conn.Open();
        try
        {
            numRowsAffected = cmd.ExecuteNonQuery();
        }
        catch (Exception)
        {
            numRowsAffected = 0;
        }
        conn.Close();
        return numRowsAffected;
    }
    private static string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings[""].ConnectionString;
    } // end of getConnectionString
}