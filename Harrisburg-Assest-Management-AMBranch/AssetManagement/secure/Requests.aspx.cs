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
using System.Net.Mail;
using System.Net;

namespace AssetManagement
{
    public partial class MailBox : System.Web.UI.Page
    {
        RequestFunctions requestFunctions = new RequestFunctions();

        protected void Page_Load(object sender, EventArgs e)
        {
            //userAccess(); //need this method to capture tuid on temple servers when login in

            if (!IsPostBack)
            {
                getPending();
                superUserList.Style.Add("display", "block"); //displays the add user page.
            }

            btnShowPending.Enabled = false;
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
                getPending();
                btnShowPending.Enabled = false;
                superUserList.Style.Add("display", "block");
            }
            else if (userType == 0) //if not super user then just load
            {
                getPending();
                btnShowPending.Enabled = false;
            }
            else
            {
                Session.Abandon();
                Response.Redirect("../Login.aspx.aspx");
            }
        }

        public void getPending()
        {
            DBConnect dBConnect = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetRequestsPending";
            rptRequests.DataSource = dBConnect.GetDataSetUsingCmdObj(objCommand);
            rptRequests.DataBind();
        }

        public void getApproved()
        {
            DBConnect dBConnect = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetRequestsApproved";
            rptRequests.DataSource = dBConnect.GetDataSetUsingCmdObj(objCommand);
            rptRequests.DataBind();
        }

        public void getDenied()
        {
            DBConnect dBConnect = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetRequestsDenied";
            rptRequests.DataSource = dBConnect.GetDataSetUsingCmdObj(objCommand);
            rptRequests.DataBind();
        }

        public void getAll()
        {
            DBConnect dBConnect = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetRequests";
            rptRequests.DataSource = dBConnect.GetDataSetUsingCmdObj(objCommand);
            rptRequests.DataBind();
        }

        protected void requestApprove_Click(object sender, EventArgs e)
        {
            RepeaterItem requestApprove = (sender as LinkButton).Parent as RepeaterItem;
            int requestId = int.Parse((requestApprove.FindControl("lblRequestID") as Label).Text);
            string requestStatus = "APPROVED";

            //this takes in the request id
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetRequestEmailByRequestID";

            SqlParameter inputParam = new SqlParameter("@requestID", requestId);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

            //the column is selected from the requests table and not from the datatable on the front end
            string requestEmail = Convert.ToString(DS.Tables[0].Rows[0][4]);

            String strTO = requestEmail; //retrieved from stored procedure
            String strFROM = "no.replyrequestingasset@gmail.com";
            String strSubject = "Request Accepted";
            String strMessage = "Your request has been approved." +
                "<br/> You can pick it up at 234 Strawberry St, Harrisburg, PA 17101" +
                "<br/> Pick up time is 11:00AM - 5:00PM." +
                "<br/> Any problems or concerns please contact: <a href=\"mailto:sean.maxwell@temple.edu\"> sean.maxwell@temple.edu </a>" +
                "<br/> <br /> Do not reply to this email.";

            //<a href='mailto:sean.maxwell@temple.edu/'> sean.maxwell@temple.edu </a>"
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            //takes the credentials of the made gmail, pw is @Noreplyass3ts
            smtp.Credentials = new NetworkCredential(strFROM, "@Noreplyass3ts");
            smtp.Timeout = 10000;
            
            MailMessage message = new MailMessage(strFROM, strTO);
            message.IsBodyHtml = true;
            message.Subject = strSubject;
            message.Body = strMessage;
            smtp.Send(message);
            //objEmail.SendMail(strTO, strFROM, strSubject, strMessage);

            requestFunctions.Update(requestId, requestStatus);
            Response.Redirect("Requests.aspx");
        }

        protected void requestDeny_Click(object sender, EventArgs e)
        {
            RepeaterItem requestApprove = (sender as LinkButton).Parent as RepeaterItem;
            int requestId = int.Parse((requestApprove.FindControl("lblRequestID") as Label).Text);
            string requestStatus = "DENIED";

            //this takes in the request id
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetRequestEmailByRequestID";

            SqlParameter inputParam = new SqlParameter("@requestID", requestId);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

            //the column is selected from the requests table and not from the datatable on the front end
            string requestEmail = Convert.ToString(DS.Tables[0].Rows[0][4]);

            String strTO = requestEmail; //retrieved from stored procedure
            String strFROM = "no.replyrequestingasset@gmail.com";
            String strSubject = "Request Denied";
            String strMessage = "Your request has been denied." +
                "<br />Unfortunately we cannot complete your request for the time being." +
                "<br />Please contact <a href=\"mailto:sean.maxwell@temple.edu\"> sean.maxwell@temple.edu </a> for any concerns or problems that you may face." +
                "<br/> <br /> Do not reply to this email.";

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(strFROM, "@Noreplyass3ts");
            smtp.Timeout = 10000;

            MailMessage message = new MailMessage(strFROM, strTO);
            message.IsBodyHtml = true;
            message.Subject = strSubject;
            message.Body = strMessage;
            smtp.Send(message);

            requestFunctions.Update(requestId, requestStatus);
            Response.Redirect("Requests.aspx");
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            getAll();

            btnShowAll.Enabled = false;
            btnShowApproved.Enabled = true;
            btnShowPending.Enabled = true;
            btnShowDenied.Enabled = true;
        }

        protected void btnShowApproved_Click(object sender, EventArgs e)
        {
            getApproved();

            btnShowAll.Enabled = true;
            btnShowApproved.Enabled = false;
            btnShowPending.Enabled = true;
            btnShowDenied.Enabled = true;
        }

        protected void btnShowPending_Click(object sender, EventArgs e)
        {
            getPending();

            btnShowAll.Enabled = true;
            btnShowApproved.Enabled = true;
            btnShowPending.Enabled = false;
            btnShowDenied.Enabled = true;
        }

        protected void btnShowDenied_Click(object sender, EventArgs e)
        {
            getDenied();

            btnShowAll.Enabled = true;
            btnShowApproved.Enabled = true;
            btnShowPending.Enabled = true;
            btnShowDenied.Enabled = false;
        }

        protected void requestDelete_Click(object sender, EventArgs e)
        {
            RepeaterItem requestApprove = (sender as LinkButton).Parent as RepeaterItem;

            int requestId = int.Parse((requestApprove.FindControl("lblRequestID") as Label).Text);
            if (Functions.RequestForm.DeleteRequest(requestId) != -1)
            {
                if (!btnShowAll.Enabled)
                {
                    btnShowAll_Click(sender, e);
                }
                else if (!btnShowApproved.Enabled)
                {
                    btnShowApproved_Click(sender, e);
                }
                else if (!btnShowDenied.Enabled)
                {
                    btnShowDenied_Click(sender, e);
                }
                else if (!btnShowPending.Enabled)
                {
                    btnShowPending_Click(sender, e);
                }
            }

        }

    }
}