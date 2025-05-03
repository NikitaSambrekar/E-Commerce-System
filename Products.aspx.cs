using System;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace ProjectWork
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            string categoryname = Request.QueryString["CategoryName"];
            if (string.IsNullOrEmpty(categoryname))
            {
                Response.Redirect("Categories.aspx"); // If no category is selected, go back.
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
                using (MySqlConnection conn = new MySqlConnection(connStr))
                {
                    string query = "SELECT ProductName, ProductImage, ProductPrice FROM Products WHERE CategoryName=@CategoryName";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@CategoryName", categoryname);

                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptProducts.DataSource = dt;
                    rptProducts.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Log the error (you can use a logging framework or just display the error message)
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
