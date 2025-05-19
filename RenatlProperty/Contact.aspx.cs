using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RenatlProperty
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            string query = "INSERT INTO ContactMessages (Name, Email, Message, SubmissionDate) VALUES (@Name, @Email, @Message, @SubmissionDate)";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Name", txtName.Text);
                        command.Parameters.AddWithValue("@Email", txtEmail.Text);
                        command.Parameters.AddWithValue("@Message", txtMessage.Text);
                        command.Parameters.AddWithValue("@SubmissionDate", DateTime.Now);

                        connection.Open();
                        command.ExecuteNonQuery();

                        lblError.Text = "Message sent successfully!";
                        lblError.ForeColor = System.Drawing.Color.Green;
                        txtName.Text = "";
                        txtEmail.Text = "";
                        txtMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "An error occurred: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}