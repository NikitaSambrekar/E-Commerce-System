using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace ProjectWork
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        private int CustomerID
        {
            get
            {
                return Convert.ToInt32(Request.QueryString["id"]);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            string connString = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connString))
            {
                string query = "SELECT Name, Email, City, Gender, Experience, ImagePath, Facebook, Instagram, Twitter, LinkedIn FROM Customer WHERE CustomerID = @CustomerID";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CustomerID", CustomerID);

                conn.Open();
                MySqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtName.Text = reader["Name"].ToString();
                    txtEmail.Text = reader["Email"].ToString();
                    txtCity.Text = reader["City"].ToString();
                    ddlGender.SelectedValue = reader["Gender"].ToString();
                    txtExperience.Text = reader["Experience"].ToString();
                    txtFacebook.Text = reader["Facebook"].ToString();
                    txtInstagram.Text = reader["Instagram"].ToString();
                    txtTwitter.Text = reader["Twitter"].ToString();
                    txtLinkedIn.Text = reader["LinkedIn"].ToString();

                    string imagePath = reader["ImagePath"].ToString();
                    imgProfile.ImageUrl = string.IsNullOrEmpty(imagePath) ? "~/Uploads/default-profile.png" : imagePath;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connString))
            {
                string imagePath = imgProfile.ImageUrl;

                if (fuImage.HasFile)
                {
                    string fileName = System.IO.Path.GetFileName(fuImage.PostedFile.FileName);
                    string filePath = "~/Uploads/" + fileName;
                    fuImage.SaveAs(Server.MapPath(filePath));
                    imagePath = filePath;
                }

                string query = @"UPDATE Customer SET 
                                    Name = @Name, Email = @Email, City = @City, Gender = @Gender, 
                                    Experience = @Experience, Facebook = @Facebook, Instagram = @Instagram, 
                                    Twitter = @Twitter, LinkedIn = @LinkedIn, ImagePath = @ImagePath 
                                WHERE CustomerID = @CustomerID";

                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@Experience", txtExperience.Text);
                cmd.Parameters.AddWithValue("@Facebook", txtFacebook.Text);
                cmd.Parameters.AddWithValue("@Instagram", txtInstagram.Text);
                cmd.Parameters.AddWithValue("@Twitter", txtTwitter.Text);
                cmd.Parameters.AddWithValue("@LinkedIn", txtLinkedIn.Text);
                cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                cmd.Parameters.AddWithValue("@CustomerID", CustomerID);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Label1.Text = "Data Updated successfully";
            Label1.ForeColor = System.Drawing.Color.Green;
        }

        protected void btnUpdatePhoto_Click(object sender, EventArgs e)
        {
            if (fuImage.HasFile)
            {
                string fileName = System.IO.Path.GetFileName(fuImage.PostedFile.FileName);
                string filePath = "~/Uploads/" + fileName;
                fuImage.SaveAs(Server.MapPath(filePath));

                string connString = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
                using (MySqlConnection conn = new MySqlConnection(connString))
                {
                    string query = "UPDATE Customer SET ImagePath = @ImagePath WHERE CustomerID = @CustomerID";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@ImagePath", filePath);
                    cmd.Parameters.AddWithValue("@CustomerID", CustomerID);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                imgProfile.ImageUrl = filePath;
                lblMsg.Text = "Profile photo updated successfully.";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Visible = true;
            }
            else
            {
                lblMsg.Text = "Please select an image to upload.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Visible = true;
            }
        }
    }
}
