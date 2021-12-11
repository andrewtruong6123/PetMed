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
    public class AssetFunctions
    {
        public int addNewAsset(string assetName, string assetCategory, string assetYear, string assetBarcode, string assetStatus,
            string assetBorrower, string assetCondition, string assetRecycled)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "addAsset";

            SqlParameter inputParam = new SqlParameter("@assetName", assetName);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@assetCategory", assetCategory);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@assetYear", assetYear);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@assetBarcode", assetBarcode);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@assetStatus", assetStatus);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@assetBorrower", assetBorrower);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@assetCondition", assetCondition);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            inputParam = new SqlParameter("@assetRecycled", assetRecycled);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(inputParam);

            int ret = objDB.DoUpdateUsingCmdObj(objCommand);
            return ret;
        }

        public int Update(int assetId, string assetName, string assetCategory, string assetYear, string assetBarcode, string assetStatus,
            string assetBorrower, string assetCondition, string assetRecycled)
        {//Written by zhicheng sep20 and Frank to edit
            DBConnect dBConnect = new DBConnect();

            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.CommandText = "UpdateAsset";

            SqlParameter para_AssetId = new SqlParameter("@assetId", assetId);
            para_AssetId.SqlDbType = SqlDbType.Int;
            sqlcmd.Parameters.Add(para_AssetId);

            SqlParameter para_Name = new SqlParameter("@assetName", assetName);
            para_Name.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_Name);

            SqlParameter para_Make = new SqlParameter("@assetCategory", assetCategory);
            para_Make.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_Make);

            SqlParameter para_Year = new SqlParameter("@assetYear", assetYear);
            para_Year.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_Year);

            SqlParameter para_Barcode = new SqlParameter("@assetBarcode", assetBarcode);
            para_Barcode.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_Barcode);

            SqlParameter para_Status = new SqlParameter("@assetStatus", assetStatus);
            para_Status.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_Status);

            SqlParameter para_Borrower = new SqlParameter("@assetBorrower", assetBorrower);
            para_Borrower.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_Borrower);

            SqlParameter para_Condition = new SqlParameter("@assetCondition", assetCondition);
            para_Condition.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_Condition);

            SqlParameter para_Recycled = new SqlParameter("@assetRecycled", assetRecycled);
            para_Recycled.SqlDbType = SqlDbType.VarChar;
            sqlcmd.Parameters.Add(para_Recycled);

            int result = dBConnect.DoUpdateUsingCmdObj(sqlcmd);
            dBConnect.CloseConnection();
            return result;

        }

        public int deleteAsset(int assetID)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "deleteAsset";

            SqlParameter inputParam = new SqlParameter("@assetId", assetID);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            int ret = objDB.DoUpdateUsingCmdObj(objCommand);
            return ret;
        }

        public int deleteBorrowerByAssetId(int assetID)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "DeleteBorrowerFromAssetId";

            SqlParameter inputParam = new SqlParameter("@assetId", assetID);
            inputParam.Direction = ParameterDirection.Input;
            inputParam.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(inputParam);

            int ret = objDB.DoUpdateUsingCmdObj(objCommand);
            return ret;
        }
    }
}