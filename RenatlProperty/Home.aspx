<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RenatlProperty.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Theme toggle button */
    .theme-toggle {
        padding: 8px;
        background-color: transparent;
        border: none;
        color: var(--text-color);
        border-radius: 4px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .theme-toggle:hover {
        color: var(--primary-color);
    }

    /* Hero section */
    .hero {
        text-align: center;
        padding: 100px 20px;
        border-radius: 10px;
        margin: 40px auto;
        max-width: 800px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('propertybackground.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        color: white;
        position: relative;
    }

    .hero h1 {
        font-size: 3.5em;
        margin-bottom: 20px;
        color: white;
    }

    /* Features section */
    .features-section {
        padding: 60px 0;
    }

    .feature {
        background-color: var(--card-bg);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        text-align: center;
        transition: transform 0.3s ease;
        height: 100%;
    }

    .dark-mode .feature {
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
    }

    .feature:hover {
        transform: translateY(-5px);
    }

    .feature-icon {
        font-size: 2.5rem;
        color: var(--primary-color);
        margin-bottom: 15px;
    }

    /* Why Choose Us section */
    .why-choose-us {
        padding: 60px 0;
        background-color: var(--light-gray);
        transition: background-color 0.5s ease;
    }

    .benefit-card {
        background-color: var(--card-bg);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
        transition: all 0.3s ease;
    }

    .dark-mode .benefit-card {
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
    }

    .benefit-card:hover {
        transform: translateY(-5px);
    }

    .benefit-icon {
        font-size: 2rem;
        color: var(--primary-color);
        margin-bottom: 15px;
    }

    /* Services section */
    .services-section {
        padding: 60px 0;
    }

    .service-card {
        border: 1px solid var(--border-color);
        border-radius: 10px;
        overflow: hidden;
        margin-bottom: 20px;
        transition: transform 0.3s ease;
        background-color: var(--card-bg);
    }

    .service-card:hover {
        transform: translateY(-5px);
    }

    .service-card img {
        height: 100px;
        margin-bottom: 15px;
        object-fit: contain;
    }

    /* Responsive styles */
    @media (max-width: 768px) {
        .navbar-collapse {
            background-color: var(--card-bg);
            padding: 8px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .dark-mode .navbar-collapse {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }

        .hero {
            padding: 60px 20px;
        }

        .hero h1 {
            font-size: 2.5em;
        }
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero">
    <h1>Find Your Dream Home Today</h1>
    <p class="lead">Discover the perfect rental property tailored to your lifestyle and budget</p>
    <asp:Button ID="ExploreButton" runat="server" Text="Browse Listings" CssClass="btn btn-primary btn-lg mt-3" OnClick="ExploreButton_Click" />
</div>

<section class="features-section">
    <div class="container">
        <div class="text-center mb-5">
            <h2>How It Works</h2>
            <p class="lead">Renting made simple with our easy process</p>
        </div>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="feature">
                    <div class="feature-icon">
                        <i class="fas fa-search"></i>
                    </div>
                    <h3>Search Easily</h3>
                    <p>Use our powerful filters to find properties that match your exact needs and preferences.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="feature">
                    <div class="feature-icon">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <h3>Schedule Visits</h3>
                    <p>Book viewings at your convenience with our easy online scheduling system.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="feature">
                    <div class="feature-icon">
                        <i class="fas fa-file-signature"></i>
                    </div>
                    <h3>Sign Digitally</h3>
                    <p>Complete your lease agreement securely online with our digital signing process.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="why-choose-us">
    <div class="container">
        <div class="text-center mb-5">
            <h2>Why Choose Us</h2>
            <p class="lead">We make renting simple, transparent, and stress-free</p>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h3>Verified Listings</h3>
                    <p>Every property is personally verified by our team to ensure accuracy and quality.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <h3>No Hidden Fees</h3>
                    <p>Transparent pricing with no surprises. See exactly what you'll pay upfront.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-headset"></i>
                    </div>
                    <h3>24/7 Support</h3>
                    <p>Our dedicated support team is available anytime to assist you.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="services-section">
    <div class="container">
        <div class="text-center mb-5">
            <h2>Our Services</h2>
            <p class="lead">Comprehensive solutions for all your rental needs</p>
        </div>
        <div class="row justify-content-around">
            <div class="col-md-4">
                <div class="service-card text-center p-4">
                    <img src="https://cdn-icons-png.flaticon.com/512/3081/3081919.png" alt="Property Management" />
                    <h3>Property Management</h3>
                    <p>Comprehensive management services for your property.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-card text-center p-4">
                    <img src="https://cdn-icons-png.flaticon.com/512/2873/2873347.png" alt="Tenant Screening" />
                    <h3>Tenant Screening</h3>
                    <p>Rigorous screening to ensure reliable tenants.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="service-card text-center p-4">
                    <img src="https://cdn-icons-png.flaticon.com/512/4819/4819349.png" alt="Maintenance" />
                    <h3>Maintenance</h3>
                    <p>Prompt and professional maintenance services.</p>
                </div>
            </div>
        </div>
    </div>
</section>
</asp:Content>
