using Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Utilities;

namespace AssetManagement
{
    public partial class AssetUpdate : System.Web.UI.Page
    {
        //Instances of Functions Library
        AssetFunctions assetFunctions = new AssetFunctions();
        BorrowerFunctions borrowerFunctions = new BorrowerFunctions();
        string assetBorrower;

        protected void Page_Load(object sender, EventArgs e)
        {
            //userAccess(); //need this method to capture tuid on temple servers when login in
            superUserList.Style.Add("display", "block"); //displays the add user page.

            if (!IsPostBack)
            {
                txtUpdateName.Text = Convert.ToString(Session["assetName"]);//Sesion data in respective textboxes and dropdowns
                string category = Convert.ToString(Session["assetCategory"]);
                if (ddlUpdateCategory.Items.FindByValue(category) == null)
                {
                    lblUpdateOther.Visible = true;
                    txtUpdateOther.Visible = true;
                    txtUpdateOther.Text = Convert.ToString(Session["assetCategory"]);
                }
                else
                {
                    ddlUpdateCategory.SelectedValue = Convert.ToString(Session["assetCategory"]);
                }
                txtUpdateYear.Text = Convert.ToString(Session["assetYear"]);
                txtUpdateBarcode.Text = Convert.ToString(Session["assetBarcode"]);
                txtUpdateStatus.Text = Convert.ToString(Session["assetStatus"]);
                string borrower = Convert.ToString(Session["assetBorrower"]);

                //Check if there is a borrower
                if (borrower == "0")
                {
                    txtUpdateBorrower.Text = "";
                }
                else
                {
                    txtUpdateBorrower.Text = borrower;
                }

                ddlUpdateCondition.SelectedValue = Convert.ToString(Session["assetCondition"]);

                //Check for borrower information to be displayed in textboxes
                int assetIdBorrowerCheck = Convert.ToInt32(Session["assetId"]);

                DBConnect objDB = new DBConnect();
                SqlCommand objCommand = new SqlCommand();

                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "CheckAssetIdForBorrower";

                SqlParameter inputParam = new SqlParameter("@assetId", assetIdBorrowerCheck);
                inputParam.Direction = ParameterDirection.Input;
                inputParam.SqlDbType = SqlDbType.Int;
                objCommand.Parameters.Add(inputParam);

                DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

                int tableCheck = Convert.ToInt32(DS.Tables[0].Rows.Count);

                if (tableCheck == 0)
                {
                    txtUpdateBorrowerAccessNet.Text = "";
                    txtUpdateBorrowerEmail.Text = "";
                    txtUpdateBorrowerPhoneNumber.Text = "";
                    txtUpdateBorrowerAddress.Text = "";
                    txtUpdateBorrowerLocation.Text = "";
                    txtBorrowerDateOfReturn.Text = "";
                }
                else
                {
                    txtUpdateBorrowerAccessNet.Text = Convert.ToString(DS.Tables[0].Rows[0][2]);
                    txtUpdateBorrowerEmail.Text = Convert.ToString(DS.Tables[0].Rows[0][3]);
                    txtUpdateBorrowerPhoneNumber.Text = Convert.ToString(DS.Tables[0].Rows[0][4]);
                    txtUpdateBorrowerAddress.Text = Convert.ToString(DS.Tables[0].Rows[0][5]);
                    txtUpdateBorrowerLocation.Text = Convert.ToString(DS.Tables[0].Rows[0][6]);
                    txtBorrowerDateOfReturn.Text = Convert.ToString(DS.Tables[0].Rows[0][10]);
                }
            }
        }

        public void userAccess()
        {
            string employeeNumber = Request.Headers["employeeNumber"]; //this grabs header of employee number so we would need from temple servers

            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetSuperUserByTUiD";

            SqlParameter inputParam = new SqlParameter("@tuid", employeeNumber);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

            int userType = Convert.ToInt32(DS.Tables[0].Rows[0][6]);

            if (userType == 1)
            {
                superUserList.Style.Add("display", "block");
            }
            else if (userType == 0)
            {
                
            }
            else
            {
                Session.Abandon();
                Response.Redirect("../Login.aspx.aspx");
            }
        }

        //Update the asset
        protected void btnUpdateAsset_Click(object sender, EventArgs e)
        {
            if (txtUpdateBorrower.Text == "" || txtUpdateBorrower.Text == "None")
            {
                assetBorrower = "0";
            }
            else
            {
                assetBorrower = txtUpdateBorrower.Text;

                int assetIdCheck = Convert.ToInt32(Session["assetId"]);

                DBConnect objDB2 = new DBConnect();
                SqlCommand objCommand2 = new SqlCommand();

                objCommand2.CommandType = CommandType.StoredProcedure;
                objCommand2.CommandText = "CheckAssetIdForBorrower";

                SqlParameter inputParam2 = new SqlParameter("@assetId", assetIdCheck);
                inputParam2.Direction = ParameterDirection.Input;
                inputParam2.SqlDbType = SqlDbType.Int;
                objCommand2.Parameters.Add(inputParam2);

                DataSet DS = objDB2.GetDataSetUsingCmdObj(objCommand2);

                int borrowerCheck = Convert.ToInt32(DS.Tables[0].Rows.Count);
                objDB2.CloseConnection();

                string borrowerAccessNetId = txtUpdateBorrowerAccessNet.Text;
                string borrowerEmail = txtUpdateBorrowerEmail.Text;
                string borrowerPhoneNumber = txtUpdateBorrowerPhoneNumber.Text;
                string borrowerAddress = txtUpdateBorrowerAddress.Text;
                string borrowerLocation = txtUpdateBorrowerLocation.Text;
                string borrowerAssetName = txtUpdateName.Text;
                string borrowerDateOfReturn = txtBorrowerDateOfReturn.Text;

                if (borrowerCheck == 0)
                {
                    DateTime borrowerDateCreated = DateTime.Now;
                    borrowerFunctions.AddBorrower(assetBorrower, borrowerAccessNetId, borrowerEmail, borrowerPhoneNumber, borrowerAddress, borrowerLocation, assetIdCheck, borrowerAssetName, borrowerDateCreated, borrowerDateOfReturn);
                }
                else
                {
                    int borrowerId = Convert.ToInt32(DS.Tables[0].Rows[0][0]);
                    //borrowerFunctions.UpdateNewBorrower(assetBorrower, borrowerAccessNetId, borrowerEmail, borrowerPhoneNumber, borrowerAddress, borrowerLocation, borrowerId, borrowerAssetName);

                    //Connect to the database
                    DBConnect objDB = new DBConnect();

                    //Update the table with sql string due to stored procdeure and update function not updating borrowers table
                    String sql = "UPDATE Borrowers SET borrowerName = '" + assetBorrower + "', borrowerAccessNetId = '" + borrowerAccessNetId + "', borrowerEmail = '" + borrowerEmail + "', borrowerPhoneNumber = '" +
                       borrowerPhoneNumber + "', borrowerAddress = '" + borrowerAddress + "', borrowerLocation = '" + borrowerLocation + "', borrowerAssetName = '" + borrowerAssetName + "', borrowerDateOfReturn = '" + borrowerDateOfReturn + "' WHERE borrowerId = " + borrowerId + "";

                    objDB.DoUpdate(sql);
                }
            }

            int assetId = Convert.ToInt32(Session["assetId"]);
            string assetName = txtUpdateName.Text;
            string assetCategory;
            if (ddlUpdateCategory.SelectedValue == "other")
            {
                assetCategory = Convert.ToString(txtUpdateOther.Text);
            }
            else if (ddlUpdateCategory.SelectedValue == "")
            {
                assetCategory = Convert.ToString(ddlUpdateCategory.SelectedValue);
            }
            else
            {
                assetCategory = Convert.ToString(ddlUpdateCategory.SelectedValue);
            }

            //Updates Asset information
            string assetYear = txtUpdateYear.Text;
            string assetBarcode = txtUpdateBarcode.Text;
            string assetStatus = txtUpdateStatus.Text;
            string Condition = ddlUpdateCondition.SelectedValue;
            string recycle = Convert.ToString(Session["assetRecycled"]);

            assetFunctions.Update(assetId, assetName, assetCategory, assetYear, assetBarcode, assetStatus,
            assetBorrower, Condition, recycle);

            //Check to see which page to return the user to
            string sessionCheck = Convert.ToString(Session["redirectCheck"]);

            if (sessionCheck == "AssetPage")
            {
                Response.Redirect("AssetPage.aspx");
                Session.Clear();
            }
            else if (sessionCheck == "Borrowers")
            {
                Response.Redirect("Borrowers.aspx");
                Session.Clear();
            }
        }

        //Cancels update
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //Check to see if returning to borrowers or to asset page
            string sessionCheck = Convert.ToString(Session["redirectCheck"]);

            if (sessionCheck == "AssetPage")
            {
                Response.Redirect("AssetPage.aspx");
                Session.Clear();
            }
            else if (sessionCheck == "Borrowers")
            {
                Response.Redirect("Borrowers.aspx");
                Session.Clear();
            }
        }

        //On selected index change for category to display other category
        protected void ddlUpdateCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlUpdateCategory.SelectedValue == "other")
            {
                lblUpdateOther.Visible = true;
                txtUpdateOther.Visible = true;
            }
            else
            {
                lblUpdateOther.Visible = false;
                txtUpdateOther.Visible = false;
            }
        }
    }
}