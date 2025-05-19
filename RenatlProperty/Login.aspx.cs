using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Rental
{
    public partial class Login : System.Web.UI.Page
    {
        protected void loginButton_Click(object sender, EventArgs e)
        {
            string email = emailTextBox.Text.Trim();
            string password = passwordTextBox.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ShowError("Email and password are required.");
                return;
            }

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT PasswordHash, Role FROM Users WHERE Email = @Email";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string hashedPassword = reader["PasswordHash"].ToString();
                                string role = reader["Role"].ToString();

                                if (BCrypt.Net.BCrypt.Verify(password, hashedPassword))
                                {
                                    // Login successful
                                    // Set session variables
                                    Session["Email"] = email;
                                    Session["Role"] = role;

                                    if (role.Equals("admin", StringComparison.OrdinalIgnoreCase))
                                    {
                                        Response.Redirect("AdminPanel.aspx"); // Redirect to admin panel
                                    }
                                    else if (role.Equals("user", StringComparison.OrdinalIgnoreCase))
                                    {
                                        Response.Redirect("Home.aspx"); // Redirect to user page
                                    }
                                    else
                                    {
                                        ShowError("Invalid role.");
                                    }
                                }
                                else
                                {
                                    ShowError("Invalid email or password.");
                                }
                            }
                            else
                            {
                                ShowError("Invalid email or password.");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError("Login failed: " + ex.Message);
            }
        }

        private void ShowError(string message)
        {
            errorLabel.Text = message;
            errorLabel.Visible = true;
        }
    }
}