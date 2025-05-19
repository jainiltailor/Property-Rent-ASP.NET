using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace RenatlProperty
{
    public partial class propertylistings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    LoadProperties();
                    lblDebug.Visible = false;
                }
                catch (Exception ex)
                {
                    lblDebug.Text = "Error loading properties: " + ex.Message;
                    lblDebug.Visible = true;
                }
            }
        }

        private void LoadProperties(bool applyFilters = false)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            DataTable dtProperties = new DataTable();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"SELECT PropertyID, PropertyName, PropertyAge, CoverPhoto, 
                                    Remarks, Price, SquareFT, Room, Bathroom, FromDate, ToDate 
                                    FROM Properties WHERE IsApproved = 1";

                    List<string> conditions = new List<string>();
                    List<SqlParameter> parameters = new List<SqlParameter>();

                    if (applyFilters)
                    {
                        // Property Name filter
                        if (!string.IsNullOrEmpty(txtPropertyName.Text))
                        {
                            conditions.Add("PropertyName LIKE @PropertyName");
                            parameters.Add(new SqlParameter("@PropertyName", "%" + txtPropertyName.Text + "%"));
                        }

                        // Price Range filter
                        if (!string.IsNullOrEmpty(txtMinPrice.Text) && decimal.TryParse(txtMinPrice.Text, out decimal minPrice))
                        {
                            conditions.Add("Price >= @MinPrice");
                            parameters.Add(new SqlParameter("@MinPrice", minPrice));
                        }
                        if (!string.IsNullOrEmpty(txtMaxPrice.Text) && decimal.TryParse(txtMaxPrice.Text, out decimal maxPrice))
                        {
                            conditions.Add("Price <= @MaxPrice");
                            parameters.Add(new SqlParameter("@MaxPrice", maxPrice));
                        }

                        // Bedrooms filter
                        if (!string.IsNullOrEmpty(ddlBedrooms.SelectedValue))
                        {
                            int bedrooms = int.Parse(ddlBedrooms.SelectedValue);
                            if (bedrooms == 4) // 4+ bedrooms
                            {
                                conditions.Add("Room >= 4");
                            }
                            else
                            {
                                conditions.Add("Room = @Bedrooms");
                                parameters.Add(new SqlParameter("@Bedrooms", bedrooms));
                            }
                        }

                        // Bathrooms filter
                        if (!string.IsNullOrEmpty(ddlBathrooms.SelectedValue))
                        {
                            int bathrooms = int.Parse(ddlBathrooms.SelectedValue);
                            if (bathrooms == 3) // 3+ bathrooms
                            {
                                conditions.Add("Bathroom >= 3");
                            }
                            else
                            {
                                conditions.Add("Bathroom = @Bathrooms");
                                parameters.Add(new SqlParameter("@Bathrooms", bathrooms));
                            }
                        }

                        // Size range filter
                        if (!string.IsNullOrEmpty(txtMinSize.Text) && int.TryParse(txtMinSize.Text, out int minSize))
                        {
                            conditions.Add("SquareFT >= @MinSize");
                            parameters.Add(new SqlParameter("@MinSize", minSize));
                        }
                        if (!string.IsNullOrEmpty(txtMaxSize.Text) && int.TryParse(txtMaxSize.Text, out int maxSize))
                        {
                            conditions.Add("SquareFT <= @MaxSize");
                            parameters.Add(new SqlParameter("@MaxSize", maxSize));
                        }

                        // Availability filter
                        //if (!string.IsNullOrEmpty(ddlAvailability.SelectedValue))
                        //{
                        //    if (ddlAvailability.SelectedValue == "now")
                        //    {
                        //        conditions.Add("(FromDate IS NULL OR FromDate <= GETDATE())");
                        //    }
                        //    else if (ddlAvailability.SelectedValue == "soon")
                        //    {
                        //        conditions.Add("(FromDate > GETDATE())");
                        //    }
                        //}

                        // Property Age filter
                        if (!string.IsNullOrEmpty(ddlPropertyAge.SelectedValue))
                        {
                            switch (ddlPropertyAge.SelectedValue)
                            {
                                case "0-5":
                                    conditions.Add("PropertyAge IN ('0-1', '1-2', '2-3', '3-4', '4-5')");
                                    break;
                                case "5-10":
                                    conditions.Add("PropertyAge IN ('5-6', '6-7', '7-8', '8-9', '9-10')");
                                    break;
                                case "10+":
                                    conditions.Add("PropertyAge NOT IN ('0-1', '1-2', '2-3', '3-4', '4-5', '5-6', '6-7', '7-8', '8-9', '9-10')");
                                    break;
                            }
                        }

                        // Combine all conditions
                        if (conditions.Count > 0)
                        {
                            query += " AND " + string.Join(" AND ", conditions);
                        }
                    }

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // Add parameters
                        foreach (var param in parameters)
                        {
                            cmd.Parameters.Add(param);
                        }

                        conn.Open();
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dtProperties);
                        }
                    }
                }

                propertyList.Controls.Clear();

                if (dtProperties.Rows.Count > 0)
                {
                    pnlNoResults.Visible = false;

                    foreach (DataRow row in dtProperties.Rows)
                    {
                        AddPropertyCard(
                            propertyId: Convert.ToInt32(row["PropertyID"]),
                            title: row["PropertyName"].ToString(),
                            imageUrl: row["CoverPhoto"].ToString(),
                            description: row["Remarks"].ToString(),
                            price: Convert.ToDecimal(row["Price"]),
                            rooms: Convert.ToInt32(row["Room"]),
                            bathrooms: Convert.ToInt32(row["Bathroom"]),
                            size: Convert.ToInt32(row["SquareFT"])
                        );
                    }
                }
                else
                {
                    pnlNoResults.Visible = true;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Database error: " + ex.Message);
            }
        }

        private void AddPropertyCard(int propertyId, string title, string imageUrl, string description,
                                   decimal price, int rooms, int bathrooms, int size)
        {
            // Column div
            HtmlGenericControl colDiv = new HtmlGenericControl("div");
            colDiv.Attributes["class"] = "col-md-4 mb-4";

            // Card container
            HtmlGenericControl cardDiv = new HtmlGenericControl("div");
            cardDiv.Attributes["class"] = "property-card";

            // Property Image
            HtmlImage img = new HtmlImage();
            img.Src = !string.IsNullOrEmpty(imageUrl) ? imageUrl : ResolveUrl("~/images/default-property.jpg");
            img.Alt = title;
            img.Attributes["class"] = "img-fluid";

            // Card Body
            HtmlGenericControl cardBody = new HtmlGenericControl("div");
            cardBody.Attributes["class"] = "property-card-body";

            // Title
            HtmlGenericControl titleElement = new HtmlGenericControl("h5");
            titleElement.InnerText = title;

            // Details
            HtmlGenericControl details = new HtmlGenericControl("p");
            details.InnerHtml = $@"
                <strong>{rooms} BHK</strong> | 
                <strong>{bathrooms} Bath</strong> | 
                <strong>{size} sq.ft.</strong>
                <br>{description.Substring(0, Math.Min(100, description.Length))}...
            ";

            // Price
            HtmlGenericControl priceElement = new HtmlGenericControl("p");
            priceElement.InnerHtml = $"<strong>Price:</strong> ₹{price.ToString("N0")}";

            // View Button
            HtmlAnchor viewBtn = new HtmlAnchor();
            viewBtn.HRef = $"PropertyDetails.aspx?PropertyID={propertyId}";
            viewBtn.InnerText = "View Details";
            viewBtn.Attributes["class"] = "btn btn-primary";

            // Build card
            cardBody.Controls.Add(titleElement);
            cardBody.Controls.Add(details);
            cardBody.Controls.Add(priceElement);
            cardBody.Controls.Add(viewBtn);

            cardDiv.Controls.Add(img);
            cardDiv.Controls.Add(cardBody);

            colDiv.Controls.Add(cardDiv);
            propertyList.Controls.Add(colDiv);
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            try
            {
                LoadProperties(applyFilters: true);
                lblDebug.Visible = false;
            }
            catch (Exception ex)
            {
                lblDebug.Text = "Error applying filters: " + ex.Message;
                lblDebug.Visible = true;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // Reset all filter controls
            txtPropertyName.Text = "";
            txtMinPrice.Text = "";
            txtMaxPrice.Text = "";
            ddlBedrooms.SelectedIndex = 0;
            ddlBathrooms.SelectedIndex = 0;
            txtMinSize.Text = "";
            txtMaxSize.Text = "";
            //ddlAvailability.SelectedIndex = 0;
            ddlPropertyAge.SelectedIndex = 0;

            try
            {
                LoadProperties();
                lblDebug.Visible = false;
            }
            catch (Exception ex)
            {
                lblDebug.Text = "Error resetting filters: " + ex.Message;
                lblDebug.Visible = true;
            }
        }
    }
}