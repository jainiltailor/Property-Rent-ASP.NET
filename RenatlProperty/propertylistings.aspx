<%@ Page Title="Property Listings" Language="C#" MasterPageFile="~/ClientMasterPage.Master" AutoEventWireup="true" CodeBehind="propertylistings.aspx.cs" Inherits="RenatlProperty.propertylistings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Main container */
        .property-list-container {
            padding: 40px 20px;
            margin-top: 40px;
            min-height: 500px;
            background-color: #f9fafb;
            transition: all 0.3s ease;
        }

        body.dark-mode .property-list-container {
            background-color: #121826;
        }

        /* Filter section */
        .filter-section {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        body.dark-mode .filter-section {
            background-color: #1f2937;
            box-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        /* Property cards */
        .property-card {
            background-color: white;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 25px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        body.dark-mode .property-card {
            background-color: #1f2937;
            border-color: #374151;
            box-shadow: 0 2px 8px rgba(0,0,0,0.3);
        }

        .property-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .property-card-body {
            padding: 15px;
        }

        .property-card h5 {
            color: #1f2937;
            font-size: 1.1rem;
            margin-bottom: 10px;
            transition: color 0.3s ease;
        }

        body.dark-mode .property-card h5 {
            color: #e5e7eb;
        }

        .property-card p {
            color: #6b7280;
            margin-bottom: 8px;
            font-size: 0.9rem;
            transition: color 0.3s ease;
        }

        body.dark-mode .property-card p {
            color: #d1d5db;
        }

        /* Form controls */
        .form-control {
            background-color: white;
            color: #1f2937;
            border: 1px solid #e5e7eb;
            transition: all 0.3s ease;
        }

        body.dark-mode .form-control {
            background-color: #374151;
            color: #e5e7eb;
            border-color: #4b5563;
        }

        .filter-label {
            color: #1f2937;
            font-weight: 500;
            margin-bottom: 5px;
            transition: color 0.3s ease;
        }

        body.dark-mode .filter-label {
            color: #e5e7eb;
        }

        /* No results message */
        .no-results-message {
            color: #6b7280;
            transition: color 0.3s ease;
        }

        body.dark-mode .no-results-message {
            color: #d1d5db;
        }

        /* Buttons */
        .btn-primary {
            background-color: #2563eb;
            border: none;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #1d4ed8;
            transform: translateY(-1px);
        }

        .btn-secondary {
            background-color: #6b7280;
            border: none;
            color: white;
            transition: all 0.3s ease;
        }

        body.dark-mode .btn-secondary {
            background-color: #4b5563;
        }

        .btn-secondary:hover {
            background-color: #4b5563;
            transform: translateY(-1px);
        }

        /* Layout */
        .filter-row {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 15px;
        }

        .filter-group {
            flex: 1;
            min-width: 200px;
        }

        .price-range-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .price-range-input {
            flex: 1;
        }

        /* Responsive fixes */
        @media (max-width: 768px) {
            .property-card {
                margin-bottom: 20px;
            }

            .filter-group {
                min-width: 100%;
            }

            .price-range-container {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container property-list-container">
        <!-- Debug message -->
        <asp:Label ID="lblDebug" runat="server" CssClass="text-danger mb-3" Visible="false"></asp:Label>
        
        <h2 class="mb-4">Property Listings</h2>
        
        <!-- Filters Section -->
        <div class="filter-section">
            <h4 class="mb-3">Filter Properties</h4>
            
            <div class="filter-row">
                <!-- Property Name -->
                <div class="filter-group">
                    <label class="filter-label">Property Name</label>
                    <asp:TextBox ID="txtPropertyName" runat="server" CssClass="form-control" placeholder="Search by name"></asp:TextBox>
                </div>
                
                <!-- Price Range -->
                <div class="filter-group">
                    <label class="filter-label">Price Range (₹)</label>
                    <div class="price-range-container">
                        <asp:TextBox ID="txtMinPrice" runat="server" CssClass="form-control price-range-input" placeholder="Min" TextMode="Number"></asp:TextBox>
                        <span>to</span>
                        <asp:TextBox ID="txtMaxPrice" runat="server" CssClass="form-control price-range-input" placeholder="Max" TextMode="Number"></asp:TextBox>
                    </div>
                </div>
                
                <!-- Property Age -->
                <div class="filter-group">
                    <label class="filter-label">Property Age</label>
                    <asp:DropDownList ID="ddlPropertyAge" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Any Age" Value=""></asp:ListItem>
                        <asp:ListItem Text="New (0-5 years)" Value="0-5"></asp:ListItem>
                        <asp:ListItem Text="5-10 years" Value="5-10"></asp:ListItem>
                        <asp:ListItem Text="10+ years" Value="10+"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            
            <div class="filter-row">
                <!-- Bedrooms -->
                <div class="filter-group">
                    <label class="filter-label">Bedrooms</label>
                    <asp:DropDownList ID="ddlBedrooms" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Any" Value=""></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4+" Value="4"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                
                <!-- Bathrooms -->
                <div class="filter-group">
                    <label class="filter-label">Bathrooms</label>
                    <asp:DropDownList ID="ddlBathrooms" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Any" Value=""></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3+" Value="3"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                
                <!-- Size Range -->
                <div class="filter-group">
                    <label class="filter-label">Size (sq ft)</label>
                    <div class="price-range-container">
                        <asp:TextBox ID="txtMinSize" runat="server" CssClass="form-control price-range-input" placeholder="Min" TextMode="Number"></asp:TextBox>
                        <span>to</span>
                        <asp:TextBox ID="txtMaxSize" runat="server" CssClass="form-control price-range-input" placeholder="Max" TextMode="Number"></asp:TextBox>
                    </div>
                </div>
            </div>
            
            <!-- Filter Buttons -->
            <div class="filter-buttons mt-3">
                <asp:Button ID="btnReset" runat="server" Text="Reset Filters" CssClass="btn btn-secondary" OnClick="btnReset_Click" />
                <asp:Button ID="btnApplyFilters" runat="server" Text="Apply Filters" CssClass="btn btn-primary ml-2" OnClick="btnApplyFilters_Click" />
            </div>
        </div>
        
        <!-- Property List -->
        <div id="propertyList" runat="server" class="row">
            <!-- Properties will be loaded here -->
        </div>
        
        <!-- No Results Message -->
        <asp:Panel ID="pnlNoResults" runat="server" Visible="false" CssClass="col-12 text-center py-5 no-results-message">
            <h4>No properties found</h4>
            <p>Try adjusting your filters or check back later.</p>
        </asp:Panel>
    </div>
</asp:Content>