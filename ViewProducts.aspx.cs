using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace ProjectWork
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        void LoadCategories()
        {
            using (MySqlConnection con = new MySqlConnection(conStr))
            {
                // Ensure CustomerID is available in session
                string customerID = Session["CustomerID"]?.ToString();
                if (string.IsNullOrEmpty(customerID))
                {
                    lblMessage.Text = "Session expired. Please log in again.";
                    return;
                }

                // Query to get categories selected by the customer
                string query = "SELECT CategoryName FROM SelectedCat WHERE UserID = @CustomerID";
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerID", customerID);

                try
                {
                    con.Open();
                    MySqlDataReader dr = cmd.ExecuteReader();

                    // Clear existing items before adding new ones
                    ddlCategory.Items.Clear();

                    // Add a default item
                    ddlCategory.Items.Add(new ListItem("Select Category", ""));

                    // Populate the dropdown with categories the customer has selected
                    while (dr.Read())
                    {
                        ddlCategory.Items.Add(new ListItem(dr["CategoryName"].ToString(), dr["CategoryName"].ToString()));
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An error occurred while loading categories: " + ex.Message;
                }
                finally
                {
                    con.Close();
                }
            }
        }


        // Handle product addition
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string productName = txtProductName.Text.Trim();
            string productPrice = txtProductPrice.Text.Trim();
            string categoryName = ddlCategory.SelectedValue;

            // Validate input
            if (string.IsNullOrEmpty(productName) || string.IsNullOrEmpty(productPrice) || string.IsNullOrEmpty(categoryName))
            {
                lblMessage.Text = "All fields are required!";
                return;
            }

            // Handle file upload
            string imagePath = null;
            if (fileUploadProductImage.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(fileUploadProductImage.FileName).ToLower();
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
                {
                    string fileName = Guid.NewGuid().ToString() + fileExtension;
                    string filePath = Server.MapPath("~/images/") + fileName;
                    fileUploadProductImage.SaveAs(filePath);
                    imagePath = fileName;
                }
                else
                {
                    lblMessage.Text = "Only .jpg, .jpeg, and .png files are allowed!";
                    return;
                }
            }

            // Ensure the session contains CustomerID
            if (Session["CustomerID"] == null)
            {
                lblMessage.Text = "User session expired. Please log in again.";
                return;
            }

            int customerID = Convert.ToInt32(Session["CustomerID"]); // Get the CustomerID from session

            // Insert product into the database
            using (MySqlConnection con = new MySqlConnection(conStr))
            {
                string query = "INSERT INTO Products (ProductName, ProductImage, ProductPrice, CategoryName, CustomerID) " +
                               "VALUES (@ProductName, @ProductImage, @ProductPrice, @CategoryName, @CustomerID)";
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ProductName", productName);
                cmd.Parameters.AddWithValue("@ProductImage", imagePath);
                cmd.Parameters.AddWithValue("@ProductPrice", productPrice);
                cmd.Parameters.AddWithValue("@CategoryName", categoryName);
                cmd.Parameters.AddWithValue("@CustomerID", customerID);  // Use CustomerID here

                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    lblMessage.Text = "Product added successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Failed to add product. Please try again!";
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm10.aspx");
        }
    }
}