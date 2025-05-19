<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.Master" AutoEventWireup="true" CodeBehind="AboutUS.aspx.cs" Inherits="RenatlProperty.AboutUS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .about-container {
    max-width: 900px;
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

.dark-mode .about-container {
    background-color: #1e293b;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

@keyframes fadeInUp {
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.about-section {
    margin-bottom: 30px;
    opacity: 0;
    transform: translateY(20px);
    transition: all 0.6s ease;
}

.about-section.show {
    opacity: 1;
    transform: translateY(0);
}

.about-section h2 {
    color: var(--primary-color);
    margin-bottom: 20px;
    font-weight: 600;
    transition: color 0.3s ease;
}

.about-section p {
    line-height: 1.8;
    color: #4b5563;
    transition: color 0.3s ease;
}

.dark-mode .about-section p {
    color: #d1d5db;
}

.team-member {
    text-align: center;
    margin-bottom: 30px;
    padding: 20px;
    border-radius: 8px;
    background-color: var(--light-gray);
    transition: all 0.3s ease;
}

.team-member:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.dark-mode .team-member:hover {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

.team-member img {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 15px;
    border: 3px solid var(--primary-color);
}

.team-member h3 {
    margin-top: 10px;
    font-weight: 600;
    color: var(--text-color);
    transition: color 0.3s ease;
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
    .about-container {
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

    .team-member {
        margin-bottom: 20px;
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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container about-container">
    <h1 class="mb-4">About Rental</h1>

    <div class="about-section show">
        <h2>Our Story</h2>
        <p>Rental was born from a passion for creating exceptional living experiences. We understand that finding the perfect rental property is more than just a transaction; it's about discovering a place you can truly call home. Our journey began with a vision to connect people with properties that match their unique lifestyles and needs.</p>
    </div>

    <div class="about-section show">
        <h2>Our Mission</h2>
        <p>Our mission is to provide a seamless and enjoyable rental experience. We strive to offer a curated selection of high-quality properties, transparent communication, and personalized service. We believe in building lasting relationships with our clients, both property owners and renters, based on trust and mutual respect.</p>
    </div>

    <div class="about-section show">
        <h2>Our Vision</h2>
        <p>Our vision is to be the leading platform in the rental industry, setting the standard for innovation, customer satisfaction, and community building. We aspire to create a future where finding a home is effortless, and property management is efficient, contributing to a better living experience for everyone.</p>
    </div>

    <div class="about-section show">
        <h2>Meet Our Team</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="team-member">
                    <img src="krish.jpg" alt="Krish Vaghela" />
                    <h3>Krish Vaghela</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="team-member">
                    <img src="oza.jpg" alt="Meet Oza" />
                    <h3>Meet Oza</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="team-member">
                    <img src="jay roognwla.jpg" alt="Jay Rangoonwala" />
                    <h3>Jay Rangoonwala</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="team-member">
                    <img src="jainil.jpg" alt="Jainil Tailor" />
                    <h3>Jainil Tailor</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="team-member">
                    <img src="daksh.jpg" alt="DakshSinh Parmar" />
                    <h3>DakshSinh Parmar</h3>
                </div>
            </div>
        </div>
    </div>
</div>
    <script>
        const aboutSections = document.querySelectorAll('.about-section');

        function checkScroll() {
            aboutSections.forEach(section => {
                const sectionTop = section.getBoundingClientRect().top;
                const windowHeight = window.innerHeight;

                if (sectionTop < windowHeight - 100) {
                    section.classList.add('show');
                }
            });
        }

        // Initial check
        checkScroll();

        // Check on scroll
        window.addEventListener('scroll', checkScroll);

        // Animation for about container
        const aboutContainer = document.querySelector('.about-container');
        setTimeout(() => {
            aboutContainer.style.opacity = '1';
            aboutContainer.style.transform = 'translateY(0)';
        }, 100);
});
    </script>
</asp:Content>
