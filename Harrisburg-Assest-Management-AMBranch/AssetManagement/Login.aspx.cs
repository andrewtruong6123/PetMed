using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagement
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            if (HttpContext.Current.Request.IsLocal.Equals(false))
            {
                string domain = Request.Url.Host;
                Response.Redirect("https://" + domain + "/Shibboleth.sso/Logout?return=https://" + GetFimEnvironment(domain) + ".temple.edu/idp/profile/Logout");
            }

        }

        private string GetFimEnvironment(string domain)
        {
            switch (domain)
            {
                case "np-stem.temple.edu":
                case "pre-stem.temple.edu":
                    return "np-fim";
                default:
                    return "fim";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("secure/Dashboard.aspx");
        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("RequestForm.aspx");
        }
    }
}