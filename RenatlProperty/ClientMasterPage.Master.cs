using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RenatlProperty
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckUserSession(); // Check if the user is logged in
            }
        }


        private void CheckUserSession()
        {
            if (Session["UserID"] != null)
            {
                // User is logged in
                LoginLink.Visible = false;
                RegisterLink.Visible = false;
                // If you are using the <asp:Button> in your markup,
                // you might want to make it visible here as well:
                if (LogoutLink != null)
                {
                    LogoutLink.Visible = true;
                }
            }
            else
            {
                // User is not logged in
                LoginLink.Visible = true;
                RegisterLink.Visible = true;
                // If you are using the <asp:Button> in your markup,
                // you might want to hide it here:
                if (LogoutLink != null)
                {
                    LogoutLink.Visible = false;
                }
            }
        }
        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            // Clear the user's session
            Session.Abandon(); // Destroys all session objects

            // Or, if you only want to remove specific session variables:
            // Session.Remove("UserID");
            // Session.Remove("UserName");
            // ...

            // Clear any authentication cookies (if you are using forms authentication)
            FormsAuthentication.SignOut();

            // Redirect the user to the home page or login page
            Response.Redirect("~/Home.aspx"); // Or "~/Login.aspx"
        }
    }
    }
