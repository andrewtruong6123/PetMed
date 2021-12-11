using Functions;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace AssetManagement
{
    public partial class AssetPage : System.Web.UI.Page
    {
        AssetFunctions assetFunctions = new AssetFunctions();

        protected void Page_Load(object sender, EventArgs e)
        {
            //userAccess(); //need this method to capture tuid on temple servers when login in

            if (!IsPostBack)
            {
                getAssetData();
                superUserList.Style.Add("display", "block"); //displays the add user page.
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
                getAssetData();
                superUserList.Style.Add("display", "block");
            }
            else if (userType == 0)
            {
                getAssetData();
            }
            else
            {
                Session.Abandon();
                Response.Redirect("../Login.aspx.aspx");
            }
        }

        public void getAssetData()
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetAvailableAssets";
            rptAssets.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            rptAssets.DataBind();
        }

        protected void btnAddAsset_Click(object sender, EventArgs e)
        {
            Response.Redirect("AssetAdd.aspx");
        }

        //needs to create a stored procedure for this and add into assetfunctions class.
        //temporary unless we figure a way to recycle with assetUpdate itself.
        protected void assetRecycleButton_Click(object sender, EventArgs e)
        {

            RepeaterItem assetRecycle = (sender as LinkButton).Parent as RepeaterItem;
            ClientScript.RegisterStartupScript(GetType(), "hwa", "showRecycleModal();", true);

            recycleModal.Value = (assetRecycle.FindControl("lblAssetID") as Label).Text;
            HiddenField1.Value = (assetRecycle.FindControl("txtAssetName") as TextBox).Text.Trim();
            HiddenField2.Value = (assetRecycle.FindControl("txtAssetCategory") as TextBox).Text.Trim();
            HiddenField3.Value = (assetRecycle.FindControl("txtAssetYear") as TextBox).Text.Trim();
            HiddenField4.Value = (assetRecycle.FindControl("txtAssetBarcode") as TextBox).Text.Trim();
            HiddenField5.Value = (assetRecycle.FindControl("txtAssetStatus") as TextBox).Text.Trim();
            HiddenField6.Value = (assetRecycle.FindControl("txtBorrower") as TextBox).Text.Trim();
            HiddenField7.Value = (assetRecycle.FindControl("txtAssetCondition") as TextBox).Text.Trim();
            string assetRecycled = "1";
        }

        protected void recycleAsset_Click(object sender, EventArgs e)
        {
            assetFunctions.Update(int.Parse(recycleModal.Value), HiddenField1.Value, HiddenField2.Value, HiddenField3.Value, HiddenField4.Value,
                HiddenField5.Value, HiddenField6.Value, HiddenField7.Value, "1");

            //reference to stored procedure
            getAssetData(); //this binds the actions to the table and displays table after actions
        }

        protected void assetDeleteButton_Click(object sender, EventArgs e)
        {
            RepeaterItem assetDelete = (sender as LinkButton).Parent as RepeaterItem;
            int assetID = int.Parse((assetDelete.FindControl("lblAssetID") as Label).Text);
            ClientScript.RegisterStartupScript(GetType(), "hwa", "showDeleteModal();", true);
            deleteModal.Value = assetID.ToString();
        }

        protected void deleteAsset_Click(object sender, EventArgs e)
        {
            //Check if there are borrower records for this asset that is being deleted
            RepeaterItem assetDelete = (sender as LinkButton).Parent as RepeaterItem;
            int assetID = Convert.ToInt32(deleteModal.Value);

            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "CheckAssetIdForBorrower";

            SqlParameter inputParam = new SqlParameter("@assetId", assetID);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

            //Count the data set to see if there are any records in the borrowers table that
            //have the assetId. If so, delete them too
            int tableCheck = Convert.ToInt32(DS.Tables[0].Rows.Count);
            if (tableCheck == 0)
            {
                assetFunctions.deleteAsset(int.Parse(deleteModal.Value)); //refers to the assetfunctions class
                getAssetData(); //this binds the actions to the table and displays table after actions
            }
            else
            {
                assetFunctions.deleteBorrowerByAssetId(int.Parse(deleteModal.Value));
                assetFunctions.deleteAsset(int.Parse(deleteModal.Value)); //refers to the assetfunctions class
                getAssetData(); //this binds the actions to the table and displays table after actions
            }
        }

        //this detects the inputted info in the fields and updates after done editing.
        //hidden until edit linkbutton is clicked
        protected void assetUpdate_Click(object sender, EventArgs e)
        {
            RepeaterItem assetUpdate = (sender as LinkButton).Parent as RepeaterItem;
            int assetId = int.Parse((assetUpdate.FindControl("lblAssetID") as Label).Text);
            string assetName = (assetUpdate.FindControl("txtAssetName") as TextBox).Text.Trim();
            string assetCategory = (assetUpdate.FindControl("txtAssetCategory") as TextBox).Text.Trim();
            string assetYear = (assetUpdate.FindControl("txtAssetYear") as TextBox).Text.Trim();
            string assetBarcode = (assetUpdate.FindControl("txtAssetBarcode") as TextBox).Text.Trim();
            string assetStatus = (assetUpdate.FindControl("txtAssetStatus") as TextBox).Text.Trim();
            string assetBorrower = (assetUpdate.FindControl("txtBorrower") as TextBox).Text.Trim();
            string assetCondition = (assetUpdate.FindControl("txtAssetCondition") as TextBox).Text.Trim();
            string assetRecycled = (assetUpdate.FindControl("txtAssetRecycled") as TextBox).Text.Trim();

            Session["assetId"] = assetId;
            Session["assetName"] = assetName;
            Session["assetCategory"] = assetCategory;
            Session["assetYear"] = assetYear;
            Session["assetBarcode"] = assetBarcode;
            Session["assetStatus"] = assetStatus;
            Session["assetBorrower"] = assetBorrower;
            Session["assetCondition"] = assetCondition;
            Session["assetRecycled"] = assetRecycled;

            //Create session for redirecting beack to page when canceling and submitting on assetUpdate
            Session["redirectCheck"] = "AssetPage";
            Response.Redirect("AssetUpdate.aspx");

        }
    }
}