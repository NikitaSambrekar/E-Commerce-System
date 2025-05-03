using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.IO;
using System.Linq;

namespace ProjectWork
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)  // Bind categories only on initial page load
            {
                BindCategories();
            }
        }

        private void BindCategories()
        {
            string connString = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connString))
            {
                string query = "SELECT CategoryID, CategoryName FROM Categories";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                conn.Open();

                MySqlDataReader reader = cmd.ExecuteReader();
                Categories.Items.Clear();  // Ensure the list is cleared before adding new items

                while (reader.Read())
                {
                    Categories.Items.Add(new ListItem(reader["CategoryName"].ToString(), reader["CategoryID"].ToString()));
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string imgPath = "";

                // Image Upload Validation
                if (fuImage.HasFile)
                {
                    string fileExtension = Path.GetExtension(fuImage.FileName).ToLower();

                    if (fileExtension == ".jpg" || fileExtension == ".png" || fileExtension == ".jpeg")
                    {
                        string fileName = Path.GetFileName(fuImage.FileName);
                        imgPath = "~/Uploads/" + fileName;
                        fuImage.SaveAs(Server.MapPath(imgPath));
                    }
                    else
                    {
                        lblMsg.Text = "Only image files (jpg, jpeg, png) are allowed.";
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }

                string selectedCategories = "";
                foreach (ListItem item in Categories.Items)
                {
                    if (item.Selected)  // Ensure to check if the item is selected
                    {
                        if (!string.IsNullOrEmpty(selectedCategories))
                            selectedCategories += ",";
                        selectedCategories += item.Text;
                    }
                }

                if (string.IsNullOrEmpty(selectedCategories))
                {
                    lblMsg.Text = "Please select at least one category.";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // Connection string and command setup
                string connString = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
                using (MySqlConnection conn = new MySqlConnection(connString))
                {
                    conn.Open();  // Open connection once

                    string query = @"INSERT INTO Customer
                            (Name, Email, Password, City, Gender, Experience, ImagePath, Facebook, Instagram, Twitter, LinkedIn,Category) 
                            VALUES 
                            (@Name, @Email, @Password, @City, @Gender, @Experience, @ImagePath, @Facebook, @Instagram, @Twitter, @LinkedIn,@Category)";

                    MySqlCommand cmd = new MySqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@Name", name.Text);
                    cmd.Parameters.AddWithValue("@Email", email.Text);
                    cmd.Parameters.AddWithValue("@Password", password.Text);
                    cmd.Parameters.AddWithValue("@City", city.Text);
                    cmd.Parameters.AddWithValue("@Gender", gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Experience", experience.Text);
                    cmd.Parameters.AddWithValue("@ImagePath", imgPath);
                    cmd.Parameters.AddWithValue("@Facebook", txtFacebook.Text);
                    cmd.Parameters.AddWithValue("@Instagram", txtInstagram.Text);
                    cmd.Parameters.AddWithValue("@Twitter", txtTwitter.Text);
                    cmd.Parameters.AddWithValue("@LinkedIn", txtLinkedIn.Text);
                    cmd.Parameters.AddWithValue("@Category", selectedCategories);

                    int rowsAffected = cmd.ExecuteNonQuery();  // Execute the query to insert the customer

                    if (rowsAffected > 0)
                    {
                        // Get the inserted user's ID (CustomerID)
                        MySqlCommand idCmd = new MySqlCommand("SELECT LAST_INSERT_ID()", conn);
                        int userID = Convert.ToInt32(idCmd.ExecuteScalar());  // Get the last inserted ID

                        // Insert selected categories into the SelectedCat table
                        foreach (ListItem item in Categories.Items)
                        {
                            if (item.Selected)  // If the category is selected
                            {
                                string categoryQuery = @"INSERT INTO SelectedCat (UserID, CategoryID, CategoryName) 
                                                 VALUES (@UserID, @CategoryID, @CategoryName)";
                                MySqlCommand categoryCmd = new MySqlCommand(categoryQuery, conn);

                                categoryCmd.Parameters.AddWithValue("@UserID", userID);  // Use the correct UserID
                                categoryCmd.Parameters.AddWithValue("@CategoryID", item.Value);  // CategoryID
                                categoryCmd.Parameters.AddWithValue("@CategoryName", item.Text);  // CategoryName

                                categoryCmd.ExecuteNonQuery();  // Execute the query to insert into SelectedCat
                            }
                        }

                        lblMsg.ForeColor = System.Drawing.Color.Green;
                        lblMsg.Text = "Registration Successful!";
                    }
                    else
                    {
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                        lblMsg.Text = "Registration failed.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}
