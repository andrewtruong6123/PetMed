using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Utilities;
using System.Text;

namespace AssetManagement
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //userAccess(); //need this method to capture tuid on temple servers when login in

            getAllAssets();
            getAllBorrowers();
            getAllRequests();
            getAcceptedRequests();

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

            if (userType == 1) //if super user load and show add atuh user link
            {
                getAllAssets();
                getAllBorrowers();
                getAllRequests();
                getAcceptedRequests();
                superUserList.Style.Add("display", "block");
            }
            else if (userType == 0) //if not super user then just load
            {
                getAllAssets();
                getAllBorrowers();
                getAllRequests();
                getAcceptedRequests();
            }
            else
            {
                Session.Abandon();
                Response.Redirect("../Login.aspx.aspx");
            }
        }

        protected string GetShibbolethHeaderAttributes()
        {
            string employeeNumber = Request.Headers["employeeNumber"]; //grabs user tuid since it's unique and never changes. Use this with stored procedure
            Session["SSO_Attribute_mail"] = Request.Headers["mail"]; //email changes, each eprson can have diff alias so not the best to use email.
            Session["SSO_Attribute_affiliation"] = Request.Headers["affiliation"];
            Session["SSO_Attribute_eduPersonPrincipalName"] = Request.Headers["eduPersonPrincipalName"];
            Session["SSO_Attribute_Unscoped_Affiliation"] = Request.Headers["unscopedaffiliation"];
            Session["SSO_Attribute_employeeNumber"] = employeeNumber;
            Session["HTTP_Request_Headers"] = RetrieveHTTPHeaders();

            return employeeNumber;
        }

        private string RetrieveHTTPHeaders()
        {
            StringBuilder headers = new StringBuilder();
            foreach (var key in Request.Headers.AllKeys)
                headers.Append(key + "=" + Request.Headers[key] + "\n");

            return headers.ToString();
        }

        public void getAllAssets()
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetAvailableAssets";

            DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

            string numberOfAssets = Convert.ToString(DS.Tables[0].Rows.Count);

            lblTotalAssets.Text = numberOfAssets;
        }

        public void getAllBorrowers()
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetBorrowers";

            DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

            string numberOfBorrowers = Convert.ToString(DS.Tables[0].Rows.Count);

            lblTotalBorrowers.Text = numberOfBorrowers;
        }

        public void getAllRequests()
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetRequestsPending";

            DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

            string numberOfRequests = Convert.ToString(DS.Tables[0].Rows.Count);

            lblTotalRequests.Text = numberOfRequests;
        }

        public void getAcceptedRequests()
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetRequestsPending";
            rptDashboard.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            rptDashboard.DataBind();
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}