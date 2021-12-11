using Functions;
using System;
using System.Collections;
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
    public partial class AddUser : System.Web.UI.Page
    {
        PermittedUsers permittedUsers = new PermittedUsers();

        protected void Page_Load(object sender, EventArgs e)
        {
            //userAccess(); //need this method to capture tuid on temple servers when login in

            getAuthUsers();
            superUserList.Style.Add("display", "block");
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
                getAuthUsers();
                superUserList.Style.Add("display", "block");
            }
            else if (userType == 0)
            {
                Response.Redirect("noPermission.aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect("../Login.aspx.aspx");
            }
        }

        public void getAuthUsers()
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetAuthUsers";
            rptAuthUsers.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            rptAuthUsers.DataBind();
        }

        //add user(s) and default their superuser to 0
        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            //Deny record creation if any fields are blank
            if (txtAddUserFN.Text == "" || txtAddUserLN.Text == "" || txtAddAccessNet.Text == "" || txtAddTUiD.Text == "" || txtAddUserEmail.Text == "")
            {
                lblAlert.Visible = true;
                lblAlert.Text = "Please fill in all fields to create a new user record";
            }
            else
            {
                AuthUsers authUsers = new AuthUsers();
                authUsers.PermittedFirstName = txtAddUserFN.Text;
                authUsers.PermittedLastName = txtAddUserLN.Text;
                authUsers.PermittedAccessNetId = txtAddAccessNet.Text;
                authUsers.PermittedTUiD = txtAddTUiD.Text;
                authUsers.PermittedEmail = txtAddUserEmail.Text;
                string superUser = "0";
                PermittedUsers permittedUsers = new PermittedUsers();
                //Check if user with tuid is already in the system
                string templeID = txtAddTUiD.Text;
                int templeIDCheck = permittedUsers.userCheck(templeID);

                if (templeIDCheck == 0)
                {
                    permittedUsers.addPermittedUser(authUsers.PermittedFirstName,
                    authUsers.PermittedLastName, authUsers.PermittedAccessNetId, authUsers.PermittedTUiD, authUsers.PermittedEmail, superUser);

                    //success
                    lblAlert.Visible = true;
                    lblAlert.Text = "New authorized user is added to system";
                    btnClear_Click(sender, e);
                }
                else
                {
                    //fail
                    lblAlert.Visible = true;
                    lblAlert.Text = "Failed to add New authorized user due to TUID credentials exisiting in the system";
                }
                getAuthUsers();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtAddUserFN.Text = string.Empty;
            txtAddUserLN.Text = string.Empty;
            txtAddAccessNet.Text = string.Empty;
            txtAddTUiD.Text = string.Empty;
            txtAddUserEmail.Text = string.Empty;
        }

        //make it where it if there is one super user then it will not delete. Only delete when there is more than one.
        protected void btnAuthDelete_Click(object sender, EventArgs e)
        {
            RepeaterItem authDelete = (sender as LinkButton).Parent as RepeaterItem; //identifies the linkbutton in repeater
            int authID = int.Parse((authDelete.FindControl("lblAuthID") as Label).Text); //this refers to the objects coming from assetFunctions
            string authTUID = Convert.ToString((authDelete.FindControl("lblAuthTUiD") as Label).Text);//Will be used to check if user being deleted is current user

            //obtain role status
            int roleStatus = int.Parse((authDelete.FindControl("lblSuperUser") as Label).Text);

            //Check how many super users are in user table
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetAllSuperUsers";

            SqlParameter inputParam = new SqlParameter("@role", roleStatus);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

            int superUserCount = DS.Tables[0].Rows.Count;

            //Check if templeId of account being deleted is current account
            string employeeNumber = Request.Headers["employeeNumber"];

            if (superUserCount == 1 && roleStatus == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            else if (employeeNumber == authTUID)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal2();", true);
            }
            else
            {
                permittedUsers.deletePermittedUser(authID); //refers to the assetfunctions class
                getAuthUsers(); //this binds the actions to the table and displays table after actions
            }
        }

        //add user(s) and default their superuser to 1
        protected void btnAddSuperUser_Click(object sender, EventArgs e)
        {
            //Deny record creation if any fields are blank
            if (txtAddUserFN.Text == "" || txtAddUserLN.Text == "" || txtAddAccessNet.Text == "" || txtAddTUiD.Text == "" || txtAddUserEmail.Text == "")
            {
                lblAlert.Visible = true;
                lblAlert.Text = "Please fill in all fields to create a new user record";
            }
            else
            {
                AuthUsers authUsers = new AuthUsers();
                authUsers.PermittedFirstName = txtAddUserFN.Text;
                authUsers.PermittedLastName = txtAddUserLN.Text;
                authUsers.PermittedAccessNetId = txtAddAccessNet.Text;
                authUsers.PermittedTUiD = txtAddTUiD.Text;
                authUsers.PermittedEmail = txtAddUserEmail.Text;
                string superUser = "1";

                PermittedUsers permittedUsers = new PermittedUsers();
                //Check if user with tuid is already in the system
                string templeID = txtAddTUiD.Text;
                int templeIDCheck = permittedUsers.userCheck(templeID);

                if (templeIDCheck == 0)
                {
                    permittedUsers.addPermittedUser(authUsers.PermittedFirstName,
                    authUsers.PermittedLastName, authUsers.PermittedAccessNetId, authUsers.PermittedTUiD, authUsers.PermittedEmail, superUser);

                    //success
                    lblAlert.Visible = true;
                    lblAlert.Text = "New super user is added to system";
                    btnClear_Click(sender, e);
                }
                else
                {
                    //fail
                    lblAlert.Visible = true;
                    lblAlert.Text = "Failed to add New super user due to TUID credentials exisiting in the system";
                }
                getAuthUsers();
            }
        }
    }
}