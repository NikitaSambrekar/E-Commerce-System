using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWork
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Role"] = "Admin";
            Response.Redirect("~/login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Role"] = "Customer";
            Response.Redirect("~/register.aspx");
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}