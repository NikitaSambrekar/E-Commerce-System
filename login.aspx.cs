using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace ProjectWork
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string role = Session["Role"]?.ToString();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (role == "Admin")
            {
                string constr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    con.Open();
                    string query = "SELECT COUNT(*) FROM admin WHERE email=@Email AND password=@Password";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        int count = Convert.ToInt32(cmd.ExecuteScalar());
                        if (count == 1)
                        {
                            Response.Redirect("WebForm5.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Invalid Admin credentials.";
                        }
                    }
                }
            }
            else
            {
                lblMessage.Text = "Please select a role first.";
            }
        }

    }
}
