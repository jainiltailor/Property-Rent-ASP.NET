<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="RenatlProperty.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
          .contact-container {
      max-width: 800px;
      background-color: white;
      border-radius: 12px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      padding: 24px;
      margin: 32px auto;
      opacity: 0;
      transform: translateY(20px);
      animation: fadeInUp 0.6s ease forwards;
      transition: all 0.3s ease;
  }

  .dark-mode .contact-container {
      background-color: #1e293b;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
  }

  @keyframes fadeInUp {
      to {
          opacity: 1;
          transform: translateY(0);
      }
  }

  .contact-form {
      margin-top: 20px;
  }

  .form-group label {
      font-weight: 500;
      color: #4b5563;
      transition: color 0.3s ease;
  }

  .dark-mode .form-group label {
      color: #9ca3af;
  }

  .form-control {
      background-color: var(--light-gray);
      border: 1px solid var(--border-color);
      color: var(--text-color);
      transition: all 0.3s ease;
  }

  .dark-mode .form-control {
      background-color: #1f2937;
      border-color: #374151;
  }

  .btn-primary {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
      font-weight: 500;
      padding: 12px 24px;
      border-radius: 8px;
      transition: all 0.3s ease;
      box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
  }

  .btn-primary:hover {
      background-color: #1d4ed8;
      border-color: #1d4ed8;
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(37, 99, 235, 0.3);
  }

  .btn-primary:active {
      transform: translateY(0);
  }
    .theme-toggle {
      padding: 8px;
      background-color: transparent;
      border: none;
      color: #6b5563;
      border-radius: 4px;
      cursor: pointer;
      transition: all 0.3s ease;
  }

  .theme-toggle:hover {
      color: var(--primary-color);
  }

  .dark-mode .theme-toggle {
      color: #d1d5db;
  }

  .dark-mode .theme-toggle:hover {
      color: white;
  }

  /* Responsive styles */
  @media (max-width: 768px) {
      .contact-container {
          margin: 16px;
          padding: 16px;
      }
      
      .navbar-collapse {
          background-color: white;
          padding: 8px;
          border-radius: 8px;
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
          animation: slideDown 0.3s ease forwards;
      }

      .dark-mode .navbar-collapse {
          background-color: #1e293b;
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
      }

      @keyframes slideDown {
          from {
              opacity: 0;
              transform: translateY(-10px);
          }
          to {
              opacity: 1;
              transform: translateY(0);
          }
      }
  }

  /* Custom toggler icon */
  .navbar-toggler {
      border: none;
      padding: 0;
  }

  .navbar-toggler:focus {
      outline: none;
      box-shadow: none;
  }

  .navbar-toggler-icon {
      background-image: none;
      position: relative;
      height: 24px;
      width: 30px;
      transition: all 0.3s ease;
  }

  .navbar-toggler-icon::before,
  .navbar-toggler-icon::after {
      content: '';
      position: absolute;
      width: 100%;
      height: 2px;
      background-color: #4b5563;
      left: 0;
      transition: all 0.3s ease;
  }

  .dark-mode .navbar-toggler-icon::before,
  .dark-mode .navbar-toggler-icon::after {
      background-color: #d1d5db;
  }

  .navbar-toggler-icon::before {
      top: 8px;
  }

  .navbar-toggler-icon::after {
      bottom: 8px;
  }

  /* Contact info section */
  .contact-info {
      margin-top: 30px;
  }

  .contact-method {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
      padding: 15px;
      border-radius: 8px;
      background-color: var(--light-gray);
      transition: all 0.3s ease;
  }

  .contact-method:hover {
      transform: translateY(-3px);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  .dark-mode .contact-method:hover {
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  }

  .contact-icon {
      font-size: 24px;
      margin-right: 15px;
      color: var(--primary-color);
  }

  .contact-details h5 {
      margin-bottom: 5px;
      font-weight: 600;
  }

  .contact-details p {
      margin: 0;
      color: #6b7280;
  }

  .dark-mode .contact-details p {
      color: #9ca3af;
  }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container contact-container">
       <h2 class="mb-4">Contact Us</h2>
       
       <div class="row">
           <div class="col-md-6">
               <div class="contact-form">
                   <asp:Label ID="lblError" runat="server" ForeColor="#DC2626" CssClass="mb-3 d-block"></asp:Label>
                   <div class="form-group">
                       <label for="txtName">Name:</label>
                       <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                   </div>
                   <div class="form-group">
                       <label for="txtEmail">Email:</label>
                       <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                   </div>
                   <div class="form-group">
                       <label for="txtMessage">Message:</label>
                       <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                   </div>
                   <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
               </div>
           </div>
           
           <div class="col-md-6">
               <div class="contact-info">
                   <h4 class="mb-4">Other Ways to Reach Us</h4>
                   
                   <div class="contact-method">
                       <div class="contact-icon">
                           <i class="fas fa-map-marker-alt"></i>
                       </div>
                       <div class="contact-details">
                           <h5>Our Office</h5>
                           <p>123 Rental Street, Property City, PC 12345</p>
                       </div>
                   </div>
                   
                   <div class="contact-method">
                       <div class="contact-icon">
                           <i class="fas fa-phone-alt"></i>
                       </div>
                       <div class="contact-details">
                           <h5>Phone</h5>
                           <p>+1 (555) 123-4567</p>
                       </div>
                   </div>
                   
                   <div class="contact-method">
                       <div class="contact-icon">
                           <i class="fas fa-envelope"></i>
                       </div>
                       <div class="contact-details">
                           <h5>Email</h5>
                           <p>info@propertyrental.com</p>
                       </div>
                   </div>
                   
                   <div class="contact-method">
                       <div class="contact-icon">
                           <i class="fas fa-clock"></i>
                       </div>
                       <div class="contact-details">
                           <h5>Working Hours</h5>
                           <p>Monday - Friday: 9:00 AM - 6:00 PM</p>
                           <p>Saturday: 10:00 AM - 4:00 PM</p>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Animation for contact container
            const contactContainer = document.querySelector('.contact-container');
            setTimeout(() => {
                contactContainer.style.opacity = '1';
                contactContainer.style.transform = 'translateY(0)';
            }, 100);
        });
    </script>
</asp:Content>
