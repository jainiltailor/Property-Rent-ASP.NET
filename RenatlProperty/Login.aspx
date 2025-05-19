<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Rental.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-container {
            width: 450px;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .login-title {
            color: #007bff;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 600;
        }

        .form-group label {
            color: #343a40;
            margin-bottom: 10px;
            font-weight: 500;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #dee2e6;
            padding: 12px 15px;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: none;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 8px;
            padding: 12px 20px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0069d9;
        }

        .error-message {
            color: #dc3545;
            margin-top: 15px;
            text-align: center;
        }

        .forgot-password {
            text-align: right;
            margin-top: 10px;
        }

        .forgot-password a {
            color: #007bff;
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        .social-login {
            margin-top: 25px;
            text-align: center;
        }

        .social-login a {
            margin: 0 10px;
            color: #343a40;
            font-size: 1.5em;
            transition: color 0.3s ease;
        }

        .social-login a:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2 class="login-title">Login to Your Account</h2>

            <div class="form-group">
                <label for="emailTextBox">Email:</label>
                <asp:TextBox ID="emailTextBox" runat="server" type="email" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="passwordTextBox">Password:</label>
                <asp:TextBox ID="passwordTextBox" runat="server" type="password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
            </div>

            <div class="forgot-password">
                <a href="ForgetPassword.aspx">Forgot Password?</a>
            </div>

            <div class="text-center mt-4">
                <asp:Button ID="loginButton" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="loginButton_Click" />
            </div>

            <asp:Label ID="errorLabel" runat="server" CssClass="error-message" Visible="false"></asp:Label>

        
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#<%= loginButton.ClientID %>').click(function (e) {
                if ($('#<%= emailTextBox.ClientID %>').val() === '') {
                    $('#<%= errorLabel.ClientID %>').text('Email is required.').show();
                    e.preventDefault();
                } else if ($('#<%= passwordTextBox.ClientID %>').val() === '') {
                    $('#<%= errorLabel.ClientID %>').text('Password is required.').show();
                    e.preventDefault();
                } else {
                    $('#<%= errorLabel.ClientID %>').hide();
                }
            });

            $('.form-control').focus(function () {
                $(this).css('border-color', '#007bff');
            }).blur(function () {
                $(this).css('border-color', '#dee2e6');
            });
        });
    </script>
</body>
</html>