using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DHSDataSetTableAdapters;

public partial class SearchResults : System.Web.UI.Page
{
    public string searchType;
    protected void Page_Load(object sender, EventArgs e)
    {

        HttpCookie cookie = Request.Cookies["DHSradius"];
        //Response.Write(cookie.Value);
        string searchArea = Request.QueryString["searchArea"];
        string geoArea = Request.QueryString["geoArea"];
        searchType = Request.QueryString["searchType"];

        //string val = Request.QueryString["searchArea"];
        string geo = Request.QueryString["geo"];
        switch (searchArea)
        {
            case "keyword":

                if (geoArea != null)
                {
                    switch (geoArea)
                    {
                        case "Distance":
                            ListView1.DataSourceID = "ObjectDataSource6";
                            break;
                        case "City":
                            ListView1.DataSourceID = "ObjectDataSource11";
                            break;
                        case "County":
                            ListView1.DataSourceID = "ObjectDataSource9";
                            break;
                    }
                }
                else
                {
                    ListView1.DataSourceID = "ObjectDataSource3";
                }

                    break;
            case "service":

                    if (geoArea != null)
                    {
                        switch (geoArea)
                        {
                            case "Distance":
                                ListView1.DataSourceID = "ObjectDataSource7";
                                break;
                            case "City":
                                ListView1.DataSourceID = "ObjectDataSource12";
                                break;
                            case "County":
                                ListView1.DataSourceID = "ObjectDataSource10";
                                break;
                        }
                    }
                    else
                    {
                        ListView1.DataSourceID = "ObjectDataSource4";
                    }
                break;
            case "domain":
                if (geoArea != null)
                {
                    switch (geoArea)
                    {
                        case "Distance":
                            ListView1.DataSourceID = "ObjectDataSource17";
                            break;
                        case "City":
                            ListView1.DataSourceID = "ObjectDataSource19";
                            break;
                        case "County":
                            ListView1.DataSourceID = "ObjectDataSource18";
                            break;
                    }
                }
                else
                {
                    ListView1.DataSourceID = "ObjectDataSource5";
                }
                break;
            case "sfpf":
                if (geoArea != null)
                {
                    switch (geoArea)
                    {
                        case "Distance":
                            ListView1.DataSourceID = "ObjectDataSource14";
                            break;
                        case "City":
                            ListView1.DataSourceID = "ObjectDataSource16";
                            break;
                        case "County":
                           ListView1.DataSourceID = "ObjectDataSource15";
                            break;
                    }
                }
                else
                {
                    ListView1.DataSourceID = "ObjectDataSource8";
                }
                break;
            default:
                ListView1.DataSourceID = "ObjectDataSource1";
                break;
        }
        Page.DataBind();
        if (!Page.IsPostBack)
        {
            PopulateCountyDropDown();
            PopulateCityDropDown();
        }
       //  Label2.Text = ListView1.DataPager1.TotalRowCount.ToString();
    }

    public static bool CookieExists(string key, HttpRequest request)
    {
        if (request == null) return false;
        if (string.IsNullOrEmpty(key)) return false;
        return request.Cookies[key] != null;
    }

    public void PopulateCountyDropDown()
    {
        masterFIPSTableAdapter countyDropDown = new masterFIPSTableAdapter();
        DropDownCounty.DataSource = countyDropDown.GetCountyList();
        DropDownCounty.DataTextField = "countyName";
        DropDownCounty.DataValueField = "countyFIPS";
        DropDownCounty.DataBind();
    }

    public void PopulateCityDropDown()
    {

        rgOrganizationsTableAdapter cityDropDown = new rgOrganizationsTableAdapter();
        DropDownCity.DataSource = cityDropDown.GetAllCities();
        DropDownCity.DataTextField = "CITY";
        DropDownCity.DataValueField = "CITY";
        DropDownCity.DataBind();
    }
}