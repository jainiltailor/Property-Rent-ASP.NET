using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using BCrypt.Net;
using System.Web; // Required for session

namespace Rental
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                roleSelectionDiv.Visible = true;
                registrationFormDiv.Visible = false;
                errorLabel.Visible = false;
            }
        }

        protected void selectRoleButton_Click(object sender, EventArgs e)
        {
            string selectedRole = roleDropDownList.SelectedValue;

            if (selectedRole == "User" || selectedRole == "Admin")
            {
                ViewState["SelectedRole"] = selectedRole;
                roleSelectionDiv.Visible = false;
                registrationFormDiv.Visible = true;
            }
            else
            {
                ShowError("Please select a role.");
            }
        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            string email = emailTextBox.Text.Trim();
            string password = passwordTextBox.Text.Trim();
            string role = ViewState["SelectedRole"].ToString();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ShowError("Email and password are required.");
                return;
            }

            if (!IsValidEmail(email))
            {
                ShowError("Invalid email format.");
                return;
            }

            if (password.Length < 6)
            {
                ShowError("Password must be at least 6 characters long.");
                return;
            }

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password);

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "INSERT INTO Users (Email, PasswordHash, Role) VALUES (@Email, @PasswordHash, @Role); SELECT SCOPE_IDENTITY();"; //Get the new user Id

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@PasswordHash", hashedPassword);
                        command.Parameters.AddWithValue("@Role", role);

                        int newUserID = Convert.ToInt32(command.ExecuteScalar()); //Get the new user ID.

                        // Create session variables
                        Session["UserID"] = newUserID;
                        Session["UserEmail"] = email;
                        Session["UserRole"] = role;

                    }
                }

                Response.Redirect("Home.aspx"); //Redirect to home page.
            }
            catch (Exception ex)
            {
                ShowError("Registration failed: " + ex.Message);
            }
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private void ShowError(string message)
        {
            errorLabel.Text = message;
            errorLabel.Visible = true;
        }
    }
}