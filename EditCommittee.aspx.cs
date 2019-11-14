using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditCommittee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void btnAddCommit_Click(object sender, EventArgs e)
    {
        //CommitteeID int, Name string, Description string, CommitteeSize int, TermLength int
        //int CommitteeID; NOT NEEDED - AUTO GENERATED
        int CommitteeSize, TermLength;
        string Name, Description;
        int numRowsAffected;

        //int accountID, numRowsAffected;
        //decimal balance;
        //string lastName, firstName;

        try
        {
            //accountID = Convert.ToInt32(txtAccountID.Text);
            //CommitteeID = Convert.ToInt32(txtCommitID.Text);
            CommitteeSize = Convert.ToInt32(txtCommitSize.Text);
            TermLength = Convert.ToInt32(txtTermLength.Text);
            try
            {
                balance = Convert.ToDecimal(txtBalance.Text);
                if (txtLastName.Text.Length > 0 && txtFirstName.Text.Length > 0)
                {
                    lastName = txtLastName.Text;
                    firstName = txtFirstName.Text;

                    numRowsAffected = ws.insertBankAccount(accountID, lastName, firstName, balance);
                    if (numRowsAffected > 0)
                    {
                        lblStatus.Text = "Bank Account Inserted OK";
                        txtAccountID.Text = "";
                        txtLastName.Text = "";
                        txtFirstName.Text = "";
                        txtBalance.Text = "";
                        // Refresh the page to refresh the GridView
                        Server.Transfer("~/WSBankAccountTester2.aspx");
                    }
                    else
                    {
                        lblCommitStatus.Text = "There already is a Bank Account with that ID";
                    }
                }
                else
                {
                    lblCommitStatus.Text = "Please enter a last name and a first name";
                }
            }
            catch (FormatException ex)
            {
                lblCommitStatus.Text = "Please enter an integer for the ";
            }
        }
        catch (FormatException ex)
        {
            lblCommitStatus.Text = "Please enter an integer for Account ID";
        }
    }
}