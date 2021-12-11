using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Functions
{
    public class RequestFunctions
    {
        public int Update(int requestId, string requestStatus)
        {
            DBConnect dBConnect = new DBConnect();

            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.CommandText = "UpdateRequestStatus";

            SqlParameter para_RequestId = new SqlParameter("@requestId", requestId);
            para_RequestId.SqlDbType = SqlDbType.Int;
            sqlcmd.Parameters.Add(para_RequestId);

            SqlParameter para_Status = new SqlParameter("@requestStatus", requestStatus);
            para_Status.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_Status);

            int result = dBConnect.DoUpdateUsingCmdObj(sqlcmd);
            dBConnect.CloseConnection();
            return result;

        }
    }
}
