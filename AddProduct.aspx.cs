using System;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace ProjectWork
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        void LoadProducts()
        {
            using (MySqlConnection con = new MySqlConnection(conStr))
            {
                string customerID = Session["CustomerID"]?.ToString();
                if (string.IsNullOrEmpty(customerID))
                {
                    lblMessage.Text = "Session expired. Please log in again.";
                    return;
                }

                string query = "SELECT ProductID, ProductName, ProductImage, ProductPrice, CategoryName FROM Products WHERE CustomerID = @CustomerID";
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerID", customerID);

                try
                {
                    con.Open();
                    MySqlDataReader dr = cmd.ExecuteReader();
                    rptProducts.DataSource = dr;
                    rptProducts.DataBind();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading products: " + ex.Message;
                }
            }
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProduct")
            {
                int productID = Convert.ToInt32(e.CommandArgument);
                using (MySqlConnection con = new MySqlConnection(conStr))
                {
                    string query = "DELETE FROM Products WHERE ProductID = @ProductID";
                    MySqlCommand cmd = new MySqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ProductID", productID);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Product deleted successfully!";
                        LoadProducts();
                    }
                    else
                    {
                        lblMessage.Text = "Failed to delete product.";
                    }
                }
            }
        }
    }
}
