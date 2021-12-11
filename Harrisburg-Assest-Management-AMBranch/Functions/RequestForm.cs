using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Utilities;

namespace Functions
{
    public class RequestForm
    {
        public const string Accepted = "ACCEPTED";
        public const string Pending = "PENDING";
        public const string Processed = "PROCESSED";

        private string
            requestId,
            requestFirstName,
            requestLastName,
            requestAccessNetId,
            requestEmail,
            requestPhoneNumber,
            requestAssetName,
            requestTimeofRequest,
            requestStatus,
            requestComment;
        public string RequestId { get { return requestId; } }
        public string RequestFirstName { get { return requestFirstName; } }
        public string RequestLastName { get { return requestLastName; } }
        public string RequestAccessNetId { get { return requestAccessNetId; } }
        public string RequestEmail { get { return requestEmail; } }
        public string RequestPhoneNumber { get { return requestPhoneNumber; } }
        public string RequestAssetName { get { return requestAssetName; } }
        public string RequestTimeOfRequest { get { return requestTimeofRequest; } }
        public string RequestStatus { get { return requestStatus; } set { requestStatus = value; } }
        public string RequestComment { get { return requestComment; } }

        //for getting the List<RequestForm>
        public RequestForm(string requestID, string requestFirstName,
            string requestLastName, string requestAccessNetId,
            string requestEmail, string requestPhoneNumber,
            string requestAssetName, string requestTimeofRequest,
            string requestStatus, string requestComment)
        {
            this.requestId = requestID;
            this.requestFirstName = requestFirstName;
            this.requestLastName = requestLastName;
            this.requestAccessNetId = requestAccessNetId;
            this.requestEmail = requestEmail;
            this.requestPhoneNumber = requestPhoneNumber;
            this.requestAssetName = requestAssetName;
            this.requestTimeofRequest = requestTimeofRequest;
            this.requestStatus = requestStatus;
            this.requestComment = requestComment;
        }

        //For inserting a new request
        public RequestForm(string requestFirstName,
            string requestLastName, string requestAccessNetId,
            string requestEmail, string requestPhoneNumber,
            string requestAssetName, string requestTimeofRequest,
            string requestStatus, string requestComment)
        {
            this.requestFirstName = requestFirstName;
            this.requestLastName = requestLastName;
            this.requestAccessNetId = requestAccessNetId;
            this.requestEmail = requestEmail;
            this.requestPhoneNumber = requestPhoneNumber;
            this.requestAssetName = requestAssetName;
            this.requestTimeofRequest = requestTimeofRequest;
            this.requestStatus = requestStatus;
            this.requestComment = requestComment;
        }

        public override string ToString()
        {
            return requestFirstName + requestLastName + requestAccessNetId
                + requestEmail + requestPhoneNumber + requestAssetName + requestTimeofRequest
                + requestStatus + requestComment;
        }

        public static int InsertRequestForm(RequestForm rf)
        {
            DBConnect dBConnect = new DBConnect();

            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.CommandText = "InsertRequestForm";
            /*
			SqlParameter para1 = new SqlParameter("@requestId", rf.RequestId);
			para1.SqlDbType = SqlDbType.Int;
			sqlcmd.Parameters.Add(para1);
			*/
            SqlParameter para2 = new SqlParameter("@requestFirstName", rf.RequestFirstName);
            para2.SqlDbType = SqlDbType.NVarChar;
            para2.Size = 50;
            sqlcmd.Parameters.Add(para2);

            SqlParameter para3 = new SqlParameter("@requestLastName", rf.RequestLastName);
            para3.SqlDbType = SqlDbType.NVarChar;
            para3.Size = 50;
            sqlcmd.Parameters.Add(para3);

            SqlParameter para4 = new SqlParameter("@requestAccessNetId", rf.RequestAccessNetId);
            para4.SqlDbType = SqlDbType.NVarChar;
            para4.Size = 9;
            sqlcmd.Parameters.Add(para4);

            SqlParameter para5 = new SqlParameter("@requestEmail", rf.RequestEmail);
            para5.SqlDbType = SqlDbType.NVarChar;
            para5.Size = 100;
            sqlcmd.Parameters.Add(para5);

            SqlParameter para6 = new SqlParameter("@requestPhoneNumber", rf.RequestPhoneNumber);
            para6.SqlDbType = SqlDbType.NVarChar;
            para6.Size = 10;
            sqlcmd.Parameters.Add(para6);

            SqlParameter para7 = new SqlParameter("@requestAssetName", rf.RequestAssetName);
            para7.SqlDbType = SqlDbType.NVarChar;
            para7.Size = 100;
            sqlcmd.Parameters.Add(para7);

            SqlParameter para8 = new SqlParameter("@requestTimeOfRequest", rf.RequestTimeOfRequest);
            para8.SqlDbType = SqlDbType.DateTime;
            sqlcmd.Parameters.Add(para8);

            SqlParameter para9 = new SqlParameter("@requestStatus", rf.RequestStatus);
            para9.SqlDbType = SqlDbType.NVarChar;
            para9.Size = 10;
            sqlcmd.Parameters.Add(para9);

            SqlParameter para10 = new SqlParameter("@requestComment", rf.RequestComment);
            para10.SqlDbType = SqlDbType.NVarChar;
            para9.Size = 200;
            sqlcmd.Parameters.Add(para10);

            int result = dBConnect.DoUpdateUsingCmdObj(sqlcmd);
            dBConnect.CloseConnection();
            return result;

        }

        public static int UpdateRequestStatus(RequestForm rf)
        {
            DBConnect dBConnect = new DBConnect();

            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.CommandText = "UpdateRequestStatus";

            SqlParameter para1 = new SqlParameter("@requestId", int.Parse(rf.RequestId));
            para1.SqlDbType = SqlDbType.Int;
            sqlcmd.Parameters.Add(para1);

            SqlParameter para9 = new SqlParameter("@requestStatus", rf.RequestStatus);
            para9.SqlDbType = SqlDbType.NVarChar;
            para9.Size = 10;
            sqlcmd.Parameters.Add(para9);

            int result = dBConnect.DoUpdateUsingCmdObj(sqlcmd);
            dBConnect.CloseConnection();
            return result;

        }

        public static DataSet GetRequests()
        {
            DBConnect dBConnect = new DBConnect();

            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.CommandText = "GetRequests";

            DataSet ds = dBConnect.GetDataSetUsingCmdObj(sqlcmd);
            dBConnect.CloseConnection();
            return ds;
        }

        public static int DeleteRequest(int id)
        {
            DBConnect dBConnect = new DBConnect();

            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.CommandText = "DeleteRequest";

            SqlParameter para1 = new SqlParameter("@id", id);
            para1.SqlDbType = SqlDbType.Int;
            sqlcmd.Parameters.Add(para1);

            int result = dBConnect.DoUpdateUsingCmdObj(sqlcmd);
            dBConnect.CloseConnection();
            return result;
        }

    }

    /*
	 * 
	 * protected void Page_Load(object sender, EventArgs e)
			{
				Cheng.RequestForm request = new Cheng.RequestForm(
					"4",
					"zhicheng",
					"Zhao",
					"123456789",
					"zhicheng12@gmail.com",
					"1234567890",
					"Laptop",
					DateTime.Now.ToLongTimeString(),
					Cheng.RequestForm.Pending,
					"no comment"
					);
				if (Cheng.RequestForm.InsertRequestForm(request) != -1)
				{
					//insert success
				}
				request.RequestStatus = Cheng.RequestForm.Accepted;
				if (Cheng.RequestForm.UpdateRequestStatus(request) != -1)
				{
					//Update success
				}
				DataSet ds = Cheng.RequestForm.GetRequests();
				int count = ds.Tables[0].Rows.Count;
				GridView1.DataSource = ds;
				GridView1.DataBind();
			}
	 * 
	 * 
	 */
}

