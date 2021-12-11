using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Utilities;
using Functions;

namespace AssetManagement
{
    public partial class AssetAdd : System.Web.UI.Page
    {
        AssetFunctions assetFunctions = new AssetFunctions();

        protected void Page_Load(object sender, EventArgs e)
        {
            //userAccess(); //need this method to capture tuid on temple servers when login in
            superUserList.Style.Add("display", "block"); //displays the add user page.
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

        protected void btnAddAsset_Click(object sender, EventArgs e)
        {
            if (txtModel.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            else
            {
                string assetName = txtModel.Text;
                string assetCategory = Convert.ToString(ddlCategory.SelectedValue);
                if (ddlCategory.SelectedValue == "other")
                {
                    assetCategory = Convert.ToString(txtOther.Text);
                }
                else if (ddlCategory.SelectedValue == "")
                {
                    assetCategory = Convert.ToString(ddlCategory.SelectedValue);
                }
                else
                {
                    assetCategory = Convert.ToString(ddlCategory.SelectedValue);
                }

                string assetYear = txtYear.Text;
                string assetBarcode = txtBarcode.Text;
                string assetCondition = Convert.ToString(ddlCondition.SelectedValue);

                string assetStatus = "In Stock";
                string assetBorrower = "0";
                string assetRecycled = "0";

                DBConnect objDB = new DBConnect();
                SqlCommand objCommand = new SqlCommand();

                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "CheckBarcode";

                SqlParameter inputParam = new SqlParameter("@Barcode", assetBarcode);
                inputParam.Direction = ParameterDirection.Input;
                inputParam.SqlDbType = SqlDbType.VarChar;
                objCommand.Parameters.Add(inputParam);

                DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

                int barcodeCheck = Convert.ToInt32(DS.Tables[0].Rows.Count);

                if (barcodeCheck == 1)
                {
                    lblAlert.Visible = true;
                    lblAlert.Text = "This Barcode already exists for another asset. Please enter another barcode.";
                }
                else
                {

                    assetFunctions.addNewAsset(assetName, assetCategory, assetYear, assetBarcode, assetStatus, assetBorrower, assetCondition, assetRecycled);

                    txtModel.Text = "";
                    ddlCategory.SelectedValue = "";
                    txtYear.Text = "";
                    txtBarcode.Text = "";
                    ddlCondition.SelectedValue = "";

                    Response.Redirect("AssetPage.aspx");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AssetPage.aspx");
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedValue == "other")
            {
                lblOther.Visible = true;
                txtOther.Visible = true;
            }
            else
            {
                lblOther.Visible = false;
                txtOther.Visible = false;
            }
        }
    }
}