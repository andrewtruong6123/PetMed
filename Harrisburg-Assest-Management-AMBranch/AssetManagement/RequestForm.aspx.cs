using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;
using System.Data.SqlClient;
using System.Data;
using Functions;

namespace AssetManagement
{
    public partial class RequestForm : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmitRequest_Click(object sender, EventArgs e)
        {
            if (containsInvalidChar(inputFName.Value) || inputFName.Value.Contains("@") || inputFName.Value.Contains("."))
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showErrorModal('Special Characters are not allowed in First Name field.');", true);
                return;
            }
            else if (inputFName.Value.Length > 50 || inputFName.Value.Length < 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showErrorModal('Please enter your First Name with no more than 50 characters.');", true);
                return;
            }

            if (inputLName.Value.Length > 50 || inputLName.Value.Length < 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showErrorModal('Please enter your Last Name with no more than 50 characters.');", true);
                return;
            }
            else if (containsInvalidChar(inputLName.Value) || inputLName.Value.Contains("@") || inputLName.Value.Contains("."))
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showErrorModal('Special Characters are not allowed in Last Name field.');", true);
                return;
            }

            if (inputTUID.Value.Length != 9)
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showErrorModal('Invalid value in TUID.');", true);
                return;
            }

            if (inputEmail.Value.Length < 1 || inputEmail.Value.Length > 100)
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showErrorModal('Please enter your email with no more than 100 characters.');", true);
                return;
            }
            else if (containsInvalidChar(inputEmail.Value))
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showErrorModal('Some Special Characters are not allowed in Last Name field.');", true);
                return;
            }

            string formatedPhone = phone.Value;
            string numberPhone = formatedPhone.Substring(0, 3) + formatedPhone.Substring(4, 3) + formatedPhone.Substring(8, 4);

            if (numberPhone.Length != 10 || containsInvalidChar(numberPhone))
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showErrorModal('Invalid value in Phone Number.');", true);
                return;
            }

            if (requestItems.Value.Length < 1 || requestItems.Value.Length > 100)
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showErrorModal('Please enter your Device Requesting with no more than 100 characters.');", true);
                return;
            }
            else if (containsInvalidChar(requestItems.Value) || requestItems.Value.Contains("@") || requestItems.Value.Contains("."))
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showErrorModal('Special Characters are not allowed in Device Requesting field.');", true);
                return;
            }

            if (TAComment.Value.Length > 200)
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showErrorModal('Please enter your Comment with no more than 200 characters');", true);
                return;
            }

            Functions.RequestForm rf = new Functions.RequestForm(
                inputFName.Value,
                inputLName.Value,
                inputTUID.Value,
                inputEmail.Value,
                numberPhone,
                requestItems.Value,
                DateTime.Now.ToString(),
                Functions.RequestForm.Pending,
                TAComment.Value
                );

            if (Functions.RequestForm.InsertRequestForm(rf) != -1)
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showModal('Request form submission success.');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showModal('Request form submission failed.');", true);
            }
        }

        protected void btnExitRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnNewRequest_ServerClick(object sender, EventArgs e)
        {
            inputFName.Value = null;
            inputLName.Value = null;
            inputTUID.Value = null;
            inputEmail.Value = null;
            requestItems.Value = null;
            phone.Value = null;
            TAComment.Value = null;
        }

        protected bool containsInvalidChar(String s)
        {
            if (s.Contains("<")
                || s.Contains(">")
                || s.Contains("?")
                //|| s.Contains(",")
                //|| s.Contains(".")
                || s.Contains("/")
                || s.Contains("!")
                || s.Contains("#")
                || s.Contains("$")
                || s.Contains("%")
                || s.Contains("^")
                || s.Contains("&")
                || s.Contains("*")
                || s.Contains("(")
                || s.Contains(")")
                || s.Contains("-")
                || s.Contains("_")
                || s.Contains("+")
                || s.Contains("=")
                || s.Contains("`")
                || s.Contains("~")
                || s.Contains(":")
                || s.Contains(";")
                || s.Contains("[")
                || s.Contains("]")
                || s.Contains("{")
                || s.Contains("}"))
            {
                return true;
            }
            else return false;
        }
    }
}