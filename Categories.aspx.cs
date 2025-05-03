using System;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

namespace ProjectWork
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        private void LoadCategories()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                string query = "SELECT CategoryID, CategoryName, ImagePath FROM Categories";
                MySqlDataAdapter da = new MySqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptCategories.DataSource = dt;
                rptCategories.DataBind();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    var btn = (System.Web.UI.WebControls.LinkButton)sender;
                    string categoryId = btn.CommandArgument;

                    string query = "DELETE FROM Categories WHERE CategoryID=@CategoryID";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@CategoryID", categoryId);
                    cmd.ExecuteNonQuery();

                    LoadCategories();
                    
                }
                catch (Exception)
                {
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        protected void btnViewProducts_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            string categoryname = e.CommandArgument.ToString();
            Response.Redirect("Products.aspx?CategoryName=" + categoryname);
        }


    }
}
