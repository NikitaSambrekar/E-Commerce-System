using System;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI;

namespace ProjectWork
{
    public partial class WebForm7 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    LoadCustomerDetails(id);
                }
            }
        }

        private void LoadCustomerDetails(string customerId)
        {
            string constr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                con.Open();
                string query = "SELECT * FROM Customer WHERE CustomerId=@CustomerId";
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerId", customerId);
                MySqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Populate textboxes with customer data
                    txtName.Text = reader["Name"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtCity.Text = reader["City"].ToString();
                    txtGender.Text = reader["Gender"].ToString();
                    txtExperience.Text = reader["Experience"].ToString();
                    txtCategory.Text = reader["Category"].ToString();
                    txtInstagram.Text = reader["Instagram"].ToString();
                    txtFacebook.Text = reader["Facebook"].ToString();
                    txtLinkedIn.Text = reader["LinkedIn"].ToString();
                    txtTwitter.Text = reader["Twitter"].ToString();
                    imgProfile.ImageUrl = reader["ImagePath"].ToString();
                }
                reader.Close();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                // Ensure all required fields are filled out
                if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtCity.Text))
                {
                    lblMsg.Text = "All fields must be filled!";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                try
                {
                    // Update the customer details in the database
                    con.Open();
                    string customerId = Request.QueryString["id"];  // Fetch customerId from query string

                    MySqlCommand cmd = new MySqlCommand(
                        "UPDATE Customer SET Name=@name, Email=@email, City=@city, Gender=@gender, Experience=@exp, Category=@cat, Instagram=@instagram, Facebook=@facebook, LinkedIn=@linkedin, Twitter=@twitter WHERE CustomerId=@id", con);

                    cmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@gender", txtGender.Text.Trim());
                    cmd.Parameters.AddWithValue("@exp", txtExperience.Text.Trim());
                    cmd.Parameters.AddWithValue("@cat", txtCategory.Text.Trim());
                    cmd.Parameters.AddWithValue("@instagram", txtInstagram.Text.Trim());
                    cmd.Parameters.AddWithValue("@facebook", txtFacebook.Text.Trim());
                    cmd.Parameters.AddWithValue("@linkedin", txtLinkedIn.Text.Trim());
                    cmd.Parameters.AddWithValue("@twitter", txtTwitter.Text.Trim());
                    cmd.Parameters.AddWithValue("@id", customerId);  // Use the customerId from the query string


                    cmd.ExecuteNonQuery();
                    lblMsg.Text = "Customer details updated successfully!";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "Error: " + ex.Message;
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm10.aspx");
        }
    }
}
