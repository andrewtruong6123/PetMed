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
    public partial class Borrowers : System.Web.UI.Page
    {
        BorrowerFunctions borrowerFunctions = new BorrowerFunctions();

        protected void Page_Load(object sender, EventArgs e)
        {
            //userAccess(); //need this method to capture tuid on temple servers when login in

            if (!IsPostBack)
            {
                getBorrowers();
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
                getBorrowers();
                superUserList.Style.Add("display", "block");
            }
            else if (userType == 0)
            {
                getBorrowers();
            }
            else
            {
                Session.Abandon();
                Response.Redirect("../Login.aspx.aspx");
            }
        }

        public void getBorrowers()
        {
            DBConnect dBConnect = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetBorrowers";
            rptBorrowers.DataSource = dBConnect.GetDataSetUsingCmdObj(objCommand);
            rptBorrowers.DataBind();
        }

        //place holder not sure on how frank wants it to view.
        protected void lnkbtnViewBorrower_Click(object sender, EventArgs e)
        {

            RepeaterItem assetUpdate = (sender as LinkButton).Parent as RepeaterItem;
            int assetId = int.Parse((assetUpdate.FindControl("lblBorrowerAssetID") as Label).Text);

            //Use stored procedure to get fields form asset
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetAssetFromBorrower";

            SqlParameter inputParam = new SqlParameter("@assetId", assetId);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

            //Get asset information from Dataset and place values in variables

            string assetName = Convert.ToString(DS.Tables[0].Rows[0][1]);
            string assetCategory = Convert.ToString(DS.Tables[0].Rows[0][2]);
            string assetYear = Convert.ToString(DS.Tables[0].Rows[0][3]);
            string assetBarcode = Convert.ToString(DS.Tables[0].Rows[0][4]);
            string assetStatus = Convert.ToString(DS.Tables[0].Rows[0][5]);
            string assetBorrower = Convert.ToString(DS.Tables[0].Rows[0][6]);
            string assetCondition = Convert.ToString(DS.Tables[0].Rows[0][7]);
            string assetRecycled = Convert.ToString(DS.Tables[0].Rows[0][8]);

            Session["assetId"] = assetId;
            Session["assetName"] = assetName;
            Session["assetCategory"] = assetCategory;
            Session["assetYear"] = assetYear;
            Session["assetBarcode"] = assetBarcode;
            Session["assetStatus"] = assetStatus;
            Session["assetBorrower"] = assetBorrower;
            Session["assetCondition"] = assetCondition;
            Session["assetRecycled"] = assetRecycled;

            Session["redirectCheck"] = "Borrowers";
            Response.Redirect("AssetUpdate.aspx");
        }

        protected void lnkbtnDeleteBorrower_Click(object sender, EventArgs e)
        {
            RepeaterItem borrowerDelete = (sender as LinkButton).Parent as RepeaterItem; //identifies the linkbutton in repeater
            int borrowerID = int.Parse((borrowerDelete.FindControl("lblBorrowerID") as Label).Text); //this refers to the objects coming from borrowerFunctions
            int assetID = int.Parse((borrowerDelete.FindControl("lblBorrowerAssetId") as Label).Text);

            borrowerFunctions.deleteBorrower(borrowerID); //refers to the borrowerfunctions class
            borrowerFunctions.deleteBorrowerName(assetID);//Delete the borrower name in the asset table
            getBorrowers(); //this binds the actions to the table and displays table after actions
        }

        //Function for getting the correct formatting for each datetime in the repeater
        public string NewDateTime(DateTime borrowerDate)
        {
            var ts = new TimeSpan(DateTime.Now.Ticks - borrowerDate.Ticks);
            double delta = Math.Abs(ts.TotalSeconds);

            if (delta < 60)
            {
                return ts.Seconds == 1 ? "one second ago" : ts.Seconds + " seconds ago";
            }
            if (delta < 60 * 2)
            {
                return "a minute ago";
            }
            if (delta < 45 * 60)
            {
                return ts.Minutes + " minutes ago";
            }
            if (delta < 90 * 60)
            {
                return "an hour ago";
            }
            if (delta < 24 * 60 * 60)
            {
                return ts.Hours + " hours ago";
            }
            if (delta < 48 * 60 * 60)
            {
                return "yesterday";
            }
            if (delta < 30 * 24 * 60 * 60)
            {
                return ts.Days + " days ago";
            }
            if (delta < 12 * 30 * 24 * 60 * 60)
            {
                int months = Convert.ToInt32(Math.Floor((double)ts.Days / 30));
                return months <= 1 ? "one month ago" : months + " months ago";
            }
            int years = Convert.ToInt32(Math.Floor((double)ts.Days / 365));
            return years <= 1 ? "one year ago" : years + " years ago";
        }
    }
}