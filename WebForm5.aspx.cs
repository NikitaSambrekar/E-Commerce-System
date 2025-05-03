using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;

namespace ProjectWork
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCounts();
               
            }

        }


        void LoadCounts()
        {
            string constr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                con.Open();

                MySqlCommand cmd = new MySqlCommand("SELECT COUNT(*) FROM Customer WHERE Status='Pending'", con);
                lblPending.Text = cmd.ExecuteScalar().ToString();

                cmd = new MySqlCommand("SELECT COUNT(*) FROM Customer WHERE Status='Approved'", con);
                lblApproved.Text = cmd.ExecuteScalar().ToString();

                cmd = new MySqlCommand("SELECT COUNT(*) FROM Customer", con);
                lblAll.Text = cmd.ExecuteScalar().ToString();

                con.Close();
            }

        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            LoadCustomers("Pending");
        }

        protected void btnApproved_Click(object sender, EventArgs e)
        {
            LoadCustomers("Approved");
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            LoadCustomers("");
        }

        void LoadCustomers(string status)
        {
            string query = "SELECT * FROM Customer";
            if (status != "")
                query += " WHERE Status='" + status + "' ";

            MySqlDataAdapter da = new MySqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvCustomers.DataSource = dt;
            gvCustomers.DataBind();
        }

        protected void gvCustomers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            if (e.CommandName == "approve")
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("UPDATE Customer SET Status='Approved' WHERE CustomerId=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
                con.Close();

                SendMail(id);
                LoadCustomers("");
                LoadCounts();
                lblStatusMessage.ForeColor = System.Drawing.Color.Green;
                lblStatusMessage.Text = "Status is Approved";
            }
            else if (e.CommandName == "reject")
            {
                string constr = ConfigurationManager.ConnectionStrings["MyDB"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    con.Open();

                    // First delete from selectedcat
                    string deleteSelectedCat = "DELETE FROM selectedcat WHERE UserID=@CustomerID";
                    using (MySqlCommand cmd = new MySqlCommand(deleteSelectedCat, con))
                    {
                        cmd.Parameters.AddWithValue("@CustomerID", id);
                        cmd.ExecuteNonQuery();
                    }

                    // Then delete from customer
                    string deleteCustomer = "DELETE FROM customer WHERE CustomerID=@CustomerID";
                    using (MySqlCommand cmd = new MySqlCommand(deleteCustomer, con))
                    {
                        cmd.Parameters.AddWithValue("@CustomerID", id);
                        cmd.ExecuteNonQuery();
                    }
                }

                // Refresh GridView and counts
                LoadCustomers("");
                LoadCounts();
                lblStatusMessage.ForeColor = System.Drawing.Color.Red;
                lblStatusMessage.Text = "Customer Rejected Successfully.";
            }


            else
            {
                if (e.CommandName == "ViewProfile")
                {
                    con.Open();
                    string customerId = e.CommandArgument.ToString();
                    Response.Redirect("ViewCustomerProfile.aspx?id=" + customerId);
                }
            }
        }

        void SendMail(string customerId)
        {
            // Step 1: Fetch the customer's email address from the database
            MySqlCommand cmd = new MySqlCommand("SELECT Email FROM Customer WHERE CustomerId=@id", con);
            cmd.Parameters.AddWithValue("@id", customerId);
            con.Open();
            string email = cmd.ExecuteScalar()?.ToString();  // Safely get the email
            con.Close();

            if (string.IsNullOrEmpty(email))
            {
                lblStatusMessage.ForeColor = System.Drawing.Color.Red;
                lblStatusMessage.Text = "Email not found for the customer.";
                return;
            }

            try
            {
                // Step 2: Create the MailMessage object and set the properties
                MailMessage mail = new MailMessage();

                // Set the recipient email address to the customer's email address
                mail.To.Add(email);  // Send the email to the customer's email ID

                // Set the sender's email address (your email account)
                mail.From = new MailAddress("nikitasambrekar9@gmail.com"); // Your email address (sender's email)

                // Set the subject and body of the email
                mail.Subject = "Your account has been approved!";
                mail.Body = "Congratulations, your account is now active.";

                // Step 3: Set up the SMTP client and send the email
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Credentials = new NetworkCredential("nikitasambrekar9@gmail.com", "dsdv dute mmvj tiiz"); // Sender email credentials
                smtp.EnableSsl = true;
                smtp.Port = 587;

                // Send the email
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                lblStatusMessage.ForeColor = System.Drawing.Color.Red;
                lblStatusMessage.Text = "Error sending email: " + ex.Message;
            }
        }


        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            // Check if the category name is empty
            if (string.IsNullOrWhiteSpace(txtCategoryName.Text))
            {
                lblCategoryMsg.Text = "Please enter a category name.";
                lblCategoryMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string categoryName = txtCategoryName.Text.Trim();

            // Check if the category is valid by comparing with predefined categories in AllowedCategories table
            con.Open();
            MySqlCommand checkAllowedCmd = new MySqlCommand("SELECT COUNT(*) FROM AllowedCategories WHERE AllowedCategoryName = @cat", con);
            checkAllowedCmd.Parameters.AddWithValue("@cat", categoryName);
            int existsInAllowed = Convert.ToInt32(checkAllowedCmd.ExecuteScalar());
            con.Close();

            if (existsInAllowed == 0)
            {
                lblCategoryMsg.Text = "Invalid category. Only predefined categories allowed.";
                lblCategoryMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Check if the category already exists in the Categories table
            con.Open();
            MySqlCommand checkCategoryCmd = new MySqlCommand("SELECT COUNT(*) FROM Categories WHERE CategoryName = @cat", con);
            checkCategoryCmd.Parameters.AddWithValue("@cat", categoryName);
            int existsInCategories = Convert.ToInt32(checkCategoryCmd.ExecuteScalar());
            con.Close();

            if (existsInCategories > 0)
            {
                lblCategoryMsg.Text = "This category already exists.";
                lblCategoryMsg.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Check if an image is uploaded
            string imagePath = "";
            if (FileUploadCategory.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(FileUploadCategory.FileName).ToLower();
                if (fileExtension == ".jpg" || fileExtension == ".png" || fileExtension == ".jpeg")
                {
                    // Save the image to the server
                    string folderPath = Server.MapPath("~/images/");
                    string fileName = Guid.NewGuid().ToString() + fileExtension;  // Use GUID to avoid file name conflicts
                    imagePath = "~/images/" + fileName;
                    FileUploadCategory.SaveAs(folderPath + fileName);
                }
                else
                {
                    lblCategoryMsg.Text = "Only image files (jpg, jpeg, png) are allowed.";
                    lblCategoryMsg.ForeColor = System.Drawing.Color.Red;
                    return;
                }
            }
            else
            {
                lblCategoryMsg.Text = "Please upload an image for the category.";
                lblCategoryMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Add the category and its image to the database
            con.Open();
            MySqlCommand insertCmd = new MySqlCommand("INSERT INTO Categories (CategoryName, ImagePath) VALUES (@cat, @imagePath)", con);
            insertCmd.Parameters.AddWithValue("@cat", categoryName);
            insertCmd.Parameters.AddWithValue("@imagePath", imagePath);
            insertCmd.ExecuteNonQuery();
            con.Close();

            // Clear the input fields
            txtCategoryName.Text = "";
            FileUploadCategory.Dispose(); // Optional: To clear the file upload control

            lblCategoryMsg.Text = "Category added successfully!";
            lblCategoryMsg.ForeColor = System.Drawing.Color.Green;
        }




        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        Image img = (Image)e.Row.FindControl("imgCustomer");
        //        string imgUrl = DataBinder.Eval(e.Row.DataItem, "ImageUrl").ToString();
        //        img.ImageUrl = imgUrl;
        //    }
        //}

        

       
        protected void gvCustomers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get the Approve button from this row
                Button btnApprove = (Button)e.Row.FindControl("btnApprove");

                // Get the status for this row
                string status = DataBinder.Eval(e.Row.DataItem, "Status").ToString();

                // If already approved, hide the Approve button
                if (status == "Approved")
                {
                    btnApprove.Visible = false;
                }
            }
        }

        protected void btnSeeAllCategories_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categories.aspx");
        }
    }
}