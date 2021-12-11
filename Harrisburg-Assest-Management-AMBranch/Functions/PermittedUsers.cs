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
    public class PermittedUsers
    {
        public int addPermittedUser(string permittedFirstName, string permittedLastName, string permittedAccessNetId, string permittedTUiD, string permittedEmail, string superUser)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AddPermittedUser";

            SqlParameter inputParam = new SqlParameter("@permittedFirstName", permittedFirstName);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@permittedLastName", permittedLastName);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@permittedAccessNetId", permittedAccessNetId);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@permittedTUiD", permittedTUiD);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@permittedEmail", permittedEmail);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@superUser", superUser);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            int ret = objDB.DoUpdateUsingCmdObj(objCommand);
            return ret;
        }

        public int deletePermittedUser(int permittedID)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "DeleteAuthUser";

            SqlParameter inputParam = new SqlParameter("@authID", permittedID);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            int ret = objDB.DoUpdateUsingCmdObj(objCommand);
            return ret;
        }

        public int userCheck(string userTUID)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "CheckifUserExists";

            SqlParameter inputParam = new SqlParameter("@userTUID", userTUID);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

            int count = Convert.ToInt32(DS.Tables[0].Rows.Count);
            return count;
        }
    }
}