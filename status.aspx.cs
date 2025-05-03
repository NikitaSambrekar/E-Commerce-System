using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace ProjectWork
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCheckStatus_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            MySqlConnection con = new MySqlConnection(conStr);
            con.Open();

            string query = "SELECT Status FROM Customer WHERE Email=@Email AND Password=@Password";
            MySqlCommand cmd = new MySqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

            object statusObj = cmd.ExecuteScalar();

            if (statusObj != null)
            {
                lblStatus.ForeColor = System.Drawing.Color.Green;
                lblStatus.Text = "Your account status is: " + statusObj.ToString();
            }
            else
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Invalid email or password.";
            }

            con.Close();
        }
    }
}
    
