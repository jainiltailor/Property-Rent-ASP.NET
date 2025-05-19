<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMasterPage.Master" AutoEventWireup="true" CodeBehind="PropertyDetails.aspx.cs" Inherits="RenatlProperty.PropertyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .property-details-container {
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
     .dark-mode .property-details-container {
     background-color: #1e293b;
     box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
 }

 @keyframes fadeInUp {
     to {
         opacity: 1;
         transform: translateY(0);
     }
 }

 .gallery-container {
     position: relative;
     overflow: hidden;
     border-radius: 8px;
     margin-bottom: 20px;
 }

 .property-image {
     width: 100%;
     border-radius: 8px;
     object-fit: cover;
     height: 360px;
     transition: transform 0.5s ease;
 }

 .gallery-container:hover .property-image {
     transform: scale(1.03);
 }

 .image-overlay {
     position: absolute;
     top: 0;
     left: 0;
     right: 0;
     bottom: 0;
     background: linear-gradient(to bottom, rgba(0,0,0,0) 50%, rgba(0,0,0,0.7) 100%);
     border-radius: 8px;
     display: flex;
     align-items: flex-end;
     padding: 20px;
     color: white;
     opacity: 0;
     transition: opacity 0.3s ease;
 }

 .gallery-container:hover .image-overlay {
     opacity: 1;
 }

 .gallery-controls {
     position: absolute;
     top: 50%;
     width: 100%;
     display: flex;
     justify-content: space-between;
     padding: 0 15px;
     transform: translateY(-50%);
     opacity: 0;
     transition: opacity 0.3s ease;
 }

 .gallery-container:hover .gallery-controls {
     opacity: 1;
 }

 .gallery-control {
     background-color: rgba(255, 255, 255, 0.8);
     color: #333;
     width: 40px;
     height: 40px;
     border-radius: 50%;
     display: flex;
     align-items: center;
     justify-content: center;
     cursor: pointer;
     transition: all 0.3s ease;
 }

 .dark-mode .gallery-control {
     background-color: rgba(30, 41, 59, 0.8);
     color: white;
 }

 .gallery-control:hover {
     background-color: white;
     transform: scale(1.1);
 }

 .dark-mode .gallery-control:hover {
     background-color: #334155;
 }

 .property-title {
     font-size: 1.75rem;
     font-weight: 600;
     color: #111827;
     margin-bottom: 4px;
     line-height: 1.3;
     transition: color 0.3s ease;
 }

 .dark-mode .property-title {
     color: #f3f4f6;
 }

 .property-location {
     font-size: 1rem;
     color: #6b7280;
     margin-bottom: 16px;
     display: block;
     transition: color 0.3s ease;
 }

 .dark-mode .property-location {
     color: #9ca3af;
 }

 .property-description {
     color: #4b5563;
     margin-bottom: 20px;
     display: block;
     transition: color 0.3s ease;
 }

 .dark-mode .property-description {
     color: #d1d5db;
 }

 .property-price {
     font-size: 1.5rem;
     color: var(--secondary-color);
     font-weight: 600;
     margin-bottom: 20px;
     display: block;
     transition: color 0.3s ease;
 }

 .property-details-list {
     margin-bottom: 24px;
 }

 .property-details-list li {
     padding: 14px 0;
     border-bottom: 1px solid var(--border-color);
     display: flex;
     justify-content: space-between;
     transition: all 0.3s ease;
 }

 .property-details-list li:hover {
     background-color: var(--light-gray);
     padding-left: 10px;
     border-radius: 4px;
 }

 .property-details-list li:last-child {
     border-bottom: none;
 }

 .detail-label {
     font-weight: 500;
     color: #4b5563;
     transition: color 0.3s ease;
     display: flex;
     align-items: center;
 }

 .dark-mode .detail-label {
     color: #9ca3af;
 }

 .detail-icon {
     margin-right: 8px;
     color: var(--primary-color);
 }

 .detail-value {
     color: #1f2937;
     transition: color 0.3s ease;
 }

 .dark-mode .detail-value {
     color: #e5e7eb;
 }

 .btn-contact {
     background-color: var(--primary-color);
     border-color: var(--primary-color);
     font-weight: 500;
     padding: 12px 24px;
     border-radius: 8px;
     transition: all 0.3s ease;
     box-shadow: 0 2px 4px rgba(37, 99, 235, 0.2);
 }

 .btn-contact:hover {
     background-color: #1d4ed8;
     border-color: #1d4ed8;
     transform: translateY(-2px);
     box-shadow: 0 4px 8px rgba(37, 99, 235, 0.3);
 }

 .btn-contact:active {
     transform: translateY(0);
 }
 .listing-meta {
     background-color: var(--light-gray);
     border-radius: 8px;
     padding: 12px;
     margin-top: 24px;
     font-size: 0.875rem;
     color: #6b7280;
     transition: all 0.3s ease;
 }

 .dark-mode .listing-meta {
     color: #9ca3af;
 }

 .theme-toggle {
     padding: 8px;
     background-color: transparent;
     border: none;
     color: #6b7280;
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

 .amenities-section {
     margin: 30px 0;
 }

 .amenity-tag {
     display: inline-block;
     background-color: var(--light-gray);
     color: #4b5563;
     padding: 8px 12px;
     border-radius: 30px;
     margin: 0 8px 8px 0;
     font-size: 0.875rem;
     transition: all 0.3s ease;
 }

 .dark-mode .amenity-tag {
     color: #d1d5db;
 }

 .amenity-tag i {
     margin-right: 5px;
     color: var(--primary-color);
 }

 .amenity-tag:hover {
     background-color: #e5e7eb;
     transform: translateY(-2px);
 }

 .dark-mode .amenity-tag:hover {
     background-color: #374151;
 }

 .map-placeholder {
     background-color: var(--light-gray);
     height: 200px;
     border-radius: 8px;
     margin: 20px 0;
     display: flex;
     align-items: center;
     justify-content: center;
     color: #6b7280;
     position: relative;
     overflow: hidden;
     cursor: pointer;
     transition: all 0.3s ease;
 }

 .map-placeholder:hover {
     transform: translateY(-3px);
     box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
 }

 .dark-mode .map-placeholder:hover {
     box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
 }

 .map-overlay {
     position: absolute;
     top: 0;
     left: 0;
     right: 0;
     bottom: 0;
     background-color: rgba(0, 0, 0, 0.1);
     display: flex;
     align-items: center;
     justify-content: center;
     opacity: 0;
     transition: opacity 0.3s ease;
 }

 .map-placeholder:hover .map-overlay {
     opacity: 1;
 }

 .map-btn {
     background-color: white;
     color: var(--primary-color);
     padding: 8px 16px;
     border-radius: 4px;
     font-weight: 500;
     box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
 }

 .dark-mode .map-btn {
     background-color: #1e293b;
     color: #d1d5db;
     box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
 }

 /* Responsive styles */
 @media (max-width: 768px) {
     .property-details-container {
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

     .property-image {
         height: 280px;
     }
 }

 /* Animated elements */
 .animated-item {
     opacity: 0;
     transform: translateY(20px);
     transition: all 0.6s ease;
 }

 .animated-item.show {
     opacity: 1;
     transform: translateY(0);
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
                    <div class="container property-details-container">
            <asp:Label ID="lblError" runat="server" ForeColor="#DC2626" CssClass="mb-3 d-block"></asp:Label>
            
            <div class="gallery-container">
                <asp:Image ID="propertyImage" runat="server" CssClass="property-image" />
                <div class="image-overlay">
                    <span>Click to view all photos</span>
                </div>
                <div class="gallery-controls">
                    <div class="gallery-control prev">
                        <i class="fas fa-chevron-left"></i>
                    </div>
                    <div class="gallery-control next">
                        <i class="fas fa-chevron-right"></i>
                    </div>
                </div>
            </div>
            
            <div class="animated-item">
                <asp:Label ID="propertyName" runat="server" CssClass="property-title"></asp:Label>
                <asp:Label ID="propertyLocation" runat="server" CssClass="property-location"></asp:Label>
                <asp:Label ID="propertyDescription" runat="server" CssClass="property-description"></asp:Label>
                <asp:Label ID="propertyPrice" runat="server" CssClass="property-price"></asp:Label>
            </div>

            <div class="amenities-section animated-item">
                <h5>Amenities</h5>
                <div>
                    <span class="amenity-tag"><i class="fas fa-wifi"></i> Wi-Fi</span>
                    <span class="amenity-tag"><i class="fas fa-parking"></i> Parking</span>
                    <span class="amenity-tag"><i class="fas fa-swimmer"></i> Swimming Pool</span>
                    <span class="amenity-tag"><i class="fas fa-dumbbell"></i> Gym</span>
                    <span class="amenity-tag"><i class="fas fa-utensils"></i> Kitchen</span>
                    <span class="amenity-tag"><i class="fas fa-tv"></i> TV</span>
                </div>
            </div>

            <ul class="list-unstyled property-details-list animated-item">
                <li>
                    <span class="detail-label"><i class="fas fa-calendar-alt detail-icon"></i> Age</span>
                    <span class="detail-value"><asp:Label ID="propertyAge" runat="server"></asp:Label> years</span>
                </li>
                <li>
                    <span class="detail-label"><i class="fas fa-ruler-combined detail-icon"></i> Square Feet</span>
                    <span class="detail-value"><asp:Label ID="propertySquareFeet" runat="server"></asp:Label> sq ft</span>
                </li>
                <li>
                    <span class="detail-label"><i class="fas fa-door-open detail-icon"></i> Rooms</span>
                    <span class="detail-value"><asp:Label ID="propertyRooms" runat="server"></asp:Label></span>
                </li>
                <li>
                    <span class="detail-label"><i class="fas fa-bath detail-icon"></i> Bathrooms</span>
                    <span class="detail-value"><asp:Label ID="propertyBathrooms" runat="server"></asp:Label></span>
                </li>
                <li>
                    <span class="detail-label"><i class="fas fa-calendar-plus detail-icon"></i> Available From</span>
                    <span class="detail-value"><asp:Label ID="propertyFromDate" runat="server"></asp:Label></span>
                </li>
                <li>
                    <span class="detail-label"><i class="fas fa-calendar-times detail-icon"></i> Available Until</span>
                    <span class="detail-value"><asp:Label ID="propertyToDate" runat="server"></asp:Label></span>
                </li>
                <li>
                    <span class="detail-label"><i class="fas fa-user detail-icon"></i> Owner</span>
                    <span class="detail-value"><asp:Label ID="propertyOwnerName" runat="server"></asp:Label></span>
                </li>
                <li>
                    <span class="detail-label"><i class="fas fa-phone-alt detail-icon"></i> Contact</span>
                    <span class="detail-value"><asp:Label ID="propertyOwnerMobile" runat="server"></asp:Label></span>
                </li>
            </ul>

            <div class="map-placeholder animated-item">
                <i class="fas fa-map-marker-alt fa-2x"></i> <div class="ml-2">Location: <asp:Label ID="propertyLatitude" runat="server"></asp:Label>, <asp:Label ID="propertyLongitude" runat="server"></asp:Label></div>
                <div class="map-overlay">
                    <div class="map-btn">
                        <i class="fas fa-map"></i> View on map
                    </div>
                </div>
            </div>

         <div class="text-center animated-item">
   <asp:Button ID="btnContact" runat="server" Text="Book now" CssClass="btn btn-primary btn-contact animate__animated animate__pulse animate__infinite animate__slower" OnClientClick="showBookingConfirmation(); return false;" />
</div>
            
            <!-- Listing metadata -->
            <div class="listing-meta animated-item">
                <div class="row">
                    <div class="col-md-6">
                        <small><i class="fas fa-calendar"></i> Listed on: <asp:Label ID="propertyDateAdded" runat="server"></asp:Label></small>
                    </div>
                    <div class="col-md-6 text-md-right">
                        <small><i class="fas fa-sync-alt"></i> Last Updated: <asp:Label ID="propertyDateModified" runat="server"></asp:Label></small>
                    </div>
                </div>
            </div>
        </div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // Dark mode toggle
    document.addEventListener('DOMContentLoaded', function () {
        //const themeToggle = document.getElementById('themeToggle');
        //const body = document.body;

        //// Check for saved theme preference
        //const savedTheme = localStorage.getItem('theme');
        //if (savedTheme === 'dark') {
        //    body.classList.add('dark-mode');
        //    themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
        //}

        //themeToggle.addEventListener('click', function () {
        //    body.classList.toggle('dark-mode');

        //    if (body.classList.contains('dark-mode')) {
        //        localStorage.setItem('theme', 'dark');
        //        themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
        //    } else {
        //        localStorage.setItem('theme', 'light');
        //        themeToggle.innerHTML = '<i class="fas fa-moon"></i>';
        //    }
        //});

        // Animation on scroll
        const animatedItems = document.querySelectorAll('.animated-item');

        function checkScroll() {
            animatedItems.forEach(item => {
                const itemTop = item.getBoundingClientRect().top;
                const windowHeight = window.innerHeight;

                if (itemTop < windowHeight - 50) {
                    item.classList.add('show');
                }
            });
        }

        // Initial check
        checkScroll();

        // Check on scroll
        window.addEventListener('scroll', checkScroll);

        // Gallery navigation simulation
        const prevBtn = document.querySelector('.gallery-control.prev');
        const nextBtn = document.querySelector('.gallery-control.next');
        const propertyImage = document.getElementById('<%= propertyImage.ClientID %>');

        // Sample images for gallery simulation (would be replaced with actual data)
        const sampleImages = [
            propertyImage.src,
            propertyImage.src.replace('.jpg', '-2.jpg'),
            propertyImage.src.replace('.jpg', '-3.jpg')
        ];

        let currentImageIndex = 0;

        prevBtn.addEventListener('click', function (e) {
            e.preventDefault();
            currentImageIndex = (currentImageIndex > 0) ? currentImageIndex - 1 : sampleImages.length - 1;
            propertyImage.classList.add('animate__animated', 'animate__fadeIn');
            propertyImage.src = sampleImages[currentImageIndex];
            setTimeout(() => propertyImage.classList.remove('animate__animated', 'animate__fadeIn'), 500);
        });

        nextBtn.addEventListener('click', function (e) {
            e.preventDefault();
            currentImageIndex = (currentImageIndex < sampleImages.length - 1) ? currentImageIndex + 1 : 0;
            propertyImage.classList.add('animate__animated', 'animate__fadeIn');
            propertyImage.src = sampleImages[currentImageIndex];
            setTimeout(() => propertyImage.classList.remove('animate__animated', 'animate__fadeIn'), 500);
        });

        // Map placeholder click handler
        const mapPlaceholder = document.querySelector('.map-placeholder');
        mapPlaceholder.addEventListener('click', function () {
            // Get the labels
            const latLabel = document.getElementById('<%= propertyLatitude.ClientID %>');
            const lngLabel = document.getElementById('<%= propertyLongitude.ClientID %>');

            // Check if they exist and have content
            if (latLabel && lngLabel && latLabel.textContent && lngLabel.textContent) {
                const lat = latLabel.textContent.trim();
                const lng = lngLabel.textContent.trim();

                // Verify we have valid values before opening the map
                if (lat !== "" && lng !== "" && !isNaN(parseFloat(lat)) && !isNaN(parseFloat(lng))) {
                    window.open(`https://www.google.com/maps?q=${lat},${lng}`, '_blank');
                } else {
                    // Alert the user if coordinates are invalid
                    alert("Map coordinates are not available for this property.");
                }
            } else {
                // Alert the user if elements are not found
                alert("Map information is not available for this property.");
            }
        });

        // Contact button hover effect
        const contactBtn = document.getElementById('<%= btnContact.ClientID %>');
        contactBtn.addEventListener('mouseenter', function () {
            this.classList.add('animate__animated', 'animate__heartBeat');
            setTimeout(() => this.classList.remove('animate__animated', 'animate__heartBeat'), 1000);
        });
    });
</script>
    

</asp:Content>