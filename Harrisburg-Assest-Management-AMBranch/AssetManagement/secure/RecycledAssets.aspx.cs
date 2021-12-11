using Functions;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace AssetManagement
{
    public partial class RecycledAssets : System.Web.UI.Page
    {
        AssetFunctions assetFunctions = new AssetFunctions();

        protected void Page_Load(object sender, EventArgs e)
        {
            //userAccess(); //need this method to capture tuid on temple servers when login in

            if (!IsPostBack)
            {
                getRecycledData();
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

            if (userType == 1) //if super user load and show add atuh user link
            {
                getRecycledData();
                superUserList.Style.Add("display", "block");
            }
            else if (userType == 0) //if not super user then just load
            {
                getRecycledData();
            }
            else
            {
                Session.Abandon();
                Response.Redirect("../Login.aspx.aspx");
            }
        }

        public void getRecycledData()
        {
            DBConnect dBConnect = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetRecycledAssets";
            rptRecycle.DataSource = dBConnect.GetDataSetUsingCmdObj(objCommand);
            rptRecycle.DataBind();
        }

        protected void assetRecoverButton_Click(object sender, EventArgs e)
        {

            RepeaterItem assetRecover = (sender as LinkButton).Parent as RepeaterItem;
            ClientScript.RegisterStartupScript(GetType(), "hwa", "showRecoverModal();", true);

            recoverModal.Value = (assetRecover.FindControl("lblAssetID") as Label).Text;
            HiddenField1.Value = (assetRecover.FindControl("txtAssetName") as TextBox).Text.Trim();
            HiddenField2.Value = (assetRecover.FindControl("txtAssetCategory") as TextBox).Text.Trim();
            HiddenField3.Value = (assetRecover.FindControl("txtAssetYear") as TextBox).Text.Trim();
            HiddenField4.Value = (assetRecover.FindControl("txtAssetBarcode") as TextBox).Text.Trim();
            HiddenField5.Value = (assetRecover.FindControl("txtAssetStatus") as TextBox).Text.Trim();
            HiddenField6.Value = (assetRecover.FindControl("txtBorrower") as TextBox).Text.Trim();
            HiddenField7.Value = (assetRecover.FindControl("txtAssetCondition") as TextBox).Text.Trim();
        }

        protected void recoverAsset_Click(object sender, EventArgs e)
        {
            assetFunctions.Update(int.Parse(recoverModal.Value), HiddenField1.Value, HiddenField2.Value, HiddenField3.Value, HiddenField4.Value,
                HiddenField5.Value, HiddenField6.Value, HiddenField7.Value, "0");

            //reference to stored procedure
            getRecycledData(); //this binds the actions to the table and displays table after actions
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
            assetFunctions.deleteAsset(int.Parse(deleteModal.Value)); //refers to the assetfunctions class
            getRecycledData(); //this binds the actions to the table and displays table after actions
        }
    }
}