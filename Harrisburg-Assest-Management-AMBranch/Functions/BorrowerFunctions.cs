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
    public class BorrowerFunctions
    {
        public int AddBorrower(string borrowerName, string borrowerAccessNetId, string borrowerEmail, string borrowerPhoneNumber, string borrowerAddress, string borrowerLocation,
            int borrowerId, string borrowerAssetName, DateTime borrowerDateCreated, string borrowerDateOfReturn)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AddBorrower";

            SqlParameter inputParam = new SqlParameter("@borrowerAssetId", borrowerId);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@borrowerName", borrowerName);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@borrowerAccessNetId", borrowerAccessNetId);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@borrowerEmail", borrowerEmail);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@borrowerPhoneNumber", borrowerPhoneNumber);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@borrowerAddress", borrowerAddress);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@borrowerLocation", borrowerLocation);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@borrowerAssetName", borrowerAssetName);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@borrowerDateCreated", borrowerDateCreated);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.DateTime;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@borrowerDateOfReturn", borrowerDateOfReturn);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            int ret = objDB.DoUpdateUsingCmdObj(objCommand);
            return ret;
        }

        public int UpdateNewBorrower(string borrowerName, string borrowerAccessNetId, string borrowerEmail, string borrowerPhoneNumber, string borrowerAddress, string borrowerLocation,
            int borrowerId, string borrowerAssetName, string borrowerDateOfReturn)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand sqlcmd = new SqlCommand();

            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.CommandText = "UpdateBorrower";

            SqlParameter para_borrowerName = new SqlParameter("@borrowerName", borrowerName);
            para_borrowerName.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_borrowerName);

            SqlParameter para_borrowerAccessNetId = new SqlParameter("@borrowerAccessNetId", borrowerAccessNetId);
            para_borrowerAccessNetId.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_borrowerAccessNetId);

            SqlParameter para_borrowerEmail = new SqlParameter("@borrowerEmail", borrowerEmail);
            para_borrowerEmail.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_borrowerEmail);

            SqlParameter para_borrowerPhoneNumber = new SqlParameter("@borrowerPhoneNumber", borrowerPhoneNumber);
            para_borrowerPhoneNumber.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_borrowerPhoneNumber);

            SqlParameter para_borrowerAddress = new SqlParameter("@borrowerAddress", borrowerAddress);
            para_borrowerAddress.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_borrowerAddress);

            SqlParameter para_borrowerLocation = new SqlParameter("@borrowerLocation", borrowerLocation);
            para_borrowerLocation.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_borrowerLocation);

            SqlParameter para_borrowerId = new SqlParameter("@borrowerId", borrowerId);
            para_borrowerId.SqlDbType = SqlDbType.Int;
            sqlcmd.Parameters.Add(para_borrowerId);

            SqlParameter para_borrowerAssetName = new SqlParameter("@borrowerAssetName", borrowerAssetName);
            para_borrowerAssetName.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_borrowerAssetName);

            SqlParameter para_borrowerDateOfReturn = new SqlParameter("@borrowerDateOfReturn", borrowerDateOfReturn);
            para_borrowerDateOfReturn.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_borrowerDateOfReturn);

            int result = objDB.DoUpdateUsingCmdObj(sqlcmd);
            objDB.CloseConnection();
            return result;
        }

        public int recordCheck(int assetIdBorrowerCheck)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "CheckAssetIdForBorrower";

            SqlParameter inputParam = new SqlParameter("@assetId", assetIdBorrowerCheck);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            DataSet DS = objDB.GetDataSetUsingCmdObj(objCommand);

            int tableCheck = Convert.ToInt32(DS.Tables[0].Rows.Count);
            return tableCheck;
        }

        public int deleteBorrower(int borrowerId)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "DeleteBorrower";

            SqlParameter inputParam = new SqlParameter("@borrowerId", borrowerId);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            int ret = objDB.DoUpdateUsingCmdObj(objCommand);
            return ret;
        }

        public int deleteBorrowerName(int assetId)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "DeleteBorrowerNameFromAsset";

            SqlParameter inputParam = new SqlParameter("@assetId", assetId);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            string dummyName = "0";

            inputParam = new SqlParameter("@assetBorrower", dummyName);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            int ret = objDB.DoUpdateUsingCmdObj(objCommand);
            return ret;
        }
    }
}