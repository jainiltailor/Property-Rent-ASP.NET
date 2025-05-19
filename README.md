A web application for managing property rentals built using ASP.NET MVC.  
This project allows users to browse, list, and manage rental properties with features like property listings, user registration, and booking requests.

---

## Table of Contents

- [Project Overview](#project-overview)  
- [Features](#features)  
- [Technologies Used](#technologies-used)  
- [Getting Started](#getting-started)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Contributing](#contributing)  
- [License](#license)  
- [Contact](#contact)  

---

## Project Overview

Property Rent is an ASP.NET MVC application designed to simplify the process of listing and renting properties. The platform supports user authentication, property management, and rental booking features, aiming to provide a smooth experience for both renters and property owners.

---

## Features

- User registration and login  
- Property listing with details and images  
- Search and filter properties  
- Booking request management  
- Admin panel for managing users and properties  

---

## Technologies Used

- ASP.NET MVC  
- C#  
- Entity Framework  
- SQL Server (or your preferred database)  
- Bootstrap (for responsive UI)  
- HTML, CSS, JavaScript  

---

## Getting Started

These instructions will help you get a copy of the project up and running on your local machine for development and testing purposes.

---

## Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/jainiltailor/Property-Rent-ASP.NET.git
   cd Property-Rent-ASP.NET

2. **Open the solution**

   Open the `.sln` file in Visual Studio.

3. **Configure the database**

   * Update your `connectionStrings` in `Web.config` to point to your SQL Server instance.
   * Run the Entity Framework migrations or update the database using the Package Manager Console:

   ```powershell
   Update-Database
   ```

4. **Restore NuGet packages**

   Visual Studio should restore packages automatically. If not, go to **Tools > NuGet Package Manager > Manage NuGet Packages for Solution** and restore missing packages.

5. **Build and run the project**

   Press `F5` or click **Start Debugging** in Visual Studio.

---

## Usage

* Register as a new user or log in with existing credentials.
* Browse available rental properties.
* Property owners can add and manage listings.
* Renters can send booking requests and manage their bookings.
