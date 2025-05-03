using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace ProjectWork
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;

        private int CustomerID
        {
            get
            {
                if (Session["CustomerID"] != null)
                    return Convert.ToInt32(Session["CustomerID"]);
                return 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        void LoadProfile()
        {

            using (MySqlConnection con = new MySqlConnection(conStr))
            {
                string query = "SELECT * FROM Customer WHERE Email = @Email";
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", Session["UserEmail"]);
                con.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    
                    Session["CustomerID"] = dr["CustomerID"];

                    lblName.Text = dr["Name"].ToString();
                    lblEmail.Text = dr["Email"].ToString();
                    lblCity.Text = dr["City"].ToString();
                    lblGender.Text = dr["Gender"].ToString();
                    lblExperience.Text = dr["Experience"].ToString();
                    imgProfile.ImageUrl = dr["ImagePath"].ToString();
                    lblCategories.Text = dr["Category"].ToString();
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (CustomerID != 0)
            {
                Response.Redirect("WebForm13.aspx?id=" + CustomerID);
            }
            else
            {
              
                Response.Write("<script>alert('Session expired. Please log in again.');</script>");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebForm10.aspx");
        }
    }
}
