using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Net.Mail;
using System.Configuration;
namespace ProjectWork
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string conStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter both email and password.";
                return;
            }

            // Check the credentials and approval status
            using (MySqlConnection con = new MySqlConnection(conStr))
            {
                string query = "SELECT CustomerID, Status FROM Customer WHERE Email = @Email AND Password = @Password";
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                try
                {
                    con.Open();
                    MySqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        string status = dr["Status"].ToString();
                        if (status.ToLower() == "approved")
                        {
                            // Set session variables for user information
                            Session["CustomerID"] = dr["CustomerID"].ToString(); // Store CustomerID in session
                            Session["UserEmail"] = email;

                            // Redirect to Customer Dashboard or appropriate page
                            Response.Redirect("WebForm10.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Your account is not approved yet.";
                        }
                    }
                    else
                    {
                        lblMessage.Text = "Invalid email or password.";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An error occurred: " + ex.Message;
                }
            }
        }

    }
}
