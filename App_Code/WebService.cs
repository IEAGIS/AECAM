using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DHSDataSetTableAdapters;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Collections;
using System.Collections.Specialized;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://hworld.org/",Description="Hello World sample",Name="WebService")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

  /* [WebMethod]
   [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string keywordLookup(string partial)
    {

        int i = 0;
        masterKeywordsTableAdapter kw = new masterKeywordsTableAdapter();
        DHSDataSet.masterKeywordsDataTable dt = kw.DataAutocomplete(partial);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.masterKeywordsRow row in dt)
        {
            retval[i] = row.keyword;
            i++;
        }

        return new JavaScriptSerializer().Serialize(retval); 
        //return retval;

    }*/

    [WebMethod]
    public string[] nameLookup(string partial)
    {

        int i = 0;
        rgOrganizationsTableAdapter name = new rgOrganizationsTableAdapter();
        DHSDataSet.rgOrganizationsDataTable dt = name.DataAutocompleteName(partial);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.rgOrganizationsRow row in dt)
        {
            retval[i] = row.ORGNAME;
            i++;
        }

        return (retval);

    }

    [WebMethod]
    public string[] keywordLookup(string partial)
    {
        
        int i = 0;
        masterKeywordsTableAdapter kw = new masterKeywordsTableAdapter();
        DHSDataSet.masterKeywordsDataTable dt = kw.DataAutocomplete(partial);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.masterKeywordsRow row in dt)
        {
            retval[i] = row.keyword;
            i++;
        }

        return (retval);

    }

    [WebMethod]
    public string[] serviceLookup(string partial)
    {

        int i = 0;
        masterServicesTableAdapter kw = new masterServicesTableAdapter();
        DHSDataSet.masterServicesDataTable dt = kw.DataAutocomplete(partial);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.masterServicesRow row in dt)
        {
            retval[i] = row.service;
            i++;
        }

        return (retval);

    }

    [WebMethod]
    public string[] schoolLookup(string partial)
    {

        //int i = 0;
        OrderedDictionary myOrderedDictionary = new OrderedDictionary();
        ICollection valueCollection = myOrderedDictionary.Values;
        ABCTableAdapter kw = new ABCTableAdapter();
        DHSDataSet.ABCDataTable dt = kw.DataAutocompleteSchool(partial);
        
        foreach (DHSDataSet.ABCRow row in dt)
        {
            if (!myOrderedDictionary.Contains(row.School_Dis))
            {
                myOrderedDictionary.Add(row.School_Dis, row.School_Dis);
            }
            
        }
        string[] retval = new string[myOrderedDictionary.Count];
        valueCollection.CopyTo(retval, 0);
        return (retval);

    }

    [WebMethod]
    public string[] cityLookup(string partial)
    {

        //int i = 0;
        OrderedDictionary myOrderedDictionary = new OrderedDictionary();
        ICollection valueCollection = myOrderedDictionary.Values;
        ABCTableAdapter kw = new ABCTableAdapter();
        DHSDataSet.ABCDataTable dt = kw.DataAutocompleteCity(partial);

        foreach (DHSDataSet.ABCRow row in dt)
        {
            if (!myOrderedDictionary.Contains(row.ARC_City))
            {
                myOrderedDictionary.Add(row.ARC_City, row.ARC_City);
            }

        }
        string[] retval = new string[myOrderedDictionary.Count];
        valueCollection.CopyTo(retval, 0);
        return (retval);

    }

    [WebMethod]
    public string[] countKeywordEntries(string keyword)
    {

        int i = 0;
        rgOrganizationsTableAdapter name = new rgOrganizationsTableAdapter();
        DHSDataSet.rgOrganizationsDataTable dt = name.CountKeywordRecords(keyword);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.rgOrganizationsRow row in dt)
        {
            retval[i] = row.ORGNAME;
            i++;
        }

        return (retval);

    }

    [WebMethod]
    public string[] countServiceEntries(string service)
    {

        int i = 0;
        rgOrganizationsTableAdapter name = new rgOrganizationsTableAdapter();
        DHSDataSet.rgOrganizationsDataTable dt = name.CountServiceResults(service);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.rgOrganizationsRow row in dt)
        {
            retval[i] = row.ORGNAME;
            i++;
        }

        return (retval);

    }

    [WebMethod]
    public string[] countServiceCountyEntries(string service,string FIPS)
    {

        int i = 0;
        rgOrganizationsTableAdapter name = new rgOrganizationsTableAdapter();
        DHSDataSet.rgOrganizationsDataTable dt = name.CountServiceResultsByCounty(service,FIPS);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.rgOrganizationsRow row in dt)
        {
            retval[i] = row.ORGNAME;
            i++;
        }

        return (retval);

    }

    [WebMethod]
    public string[] countServiceCityEntries(string service, string CITY)
    {

        int i = 0;
        rgOrganizationsTableAdapter name = new rgOrganizationsTableAdapter();
        DHSDataSet.rgOrganizationsDataTable dt = name.CountServiceResultsByCity(service, CITY);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.rgOrganizationsRow row in dt)
        {
            retval[i] = row.ORGNAME;
            i++;
        }

        return (retval);

    }

    [WebMethod]
    public string[] countKeywordCountyEntries(string keyword, string FIPS)
    {

        int i = 0;
        rgOrganizationsTableAdapter name = new rgOrganizationsTableAdapter();
        DHSDataSet.rgOrganizationsDataTable dt = name.CountKeywordResultsByCounty(keyword,FIPS);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.rgOrganizationsRow row in dt)
        {
            retval[i] = row.ORGNAME;
            i++;
        }

        return (retval);

    }

    [WebMethod]
    public string[] countKeywordCityEntries(string keyword, string CITY)
    {

        int i = 0;
        rgOrganizationsTableAdapter name = new rgOrganizationsTableAdapter();
        DHSDataSet.rgOrganizationsDataTable dt = name.CountKeywordResultsByCity(keyword, CITY);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.rgOrganizationsRow row in dt)
        {
            retval[i] = row.ORGNAME;
            i++;
        }

        return (retval);

    }
    [WebMethod]
    public string[] countKeywordRadiusEntries(string keyword)
    {
        Double MyRadius = Convert.ToDouble(Context.Request.Cookies["DHSradius"].Value);
        Double MyLat = Convert.ToDouble(Context.Request.Cookies["MyLat"].Value);
        Double MyLong = Convert.ToDouble(Context.Request.Cookies["MyLong"].Value);

        int i = 0;
        rgOrganizationsTableAdapter name = new rgOrganizationsTableAdapter();
        DHSDataSet.rgOrganizationsDataTable dt = name.CountKeywordResultsByRadius(MyLat, MyLong, false, MyRadius, keyword);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.rgOrganizationsRow row in dt)
        {
            retval[i] = row.ORGNAME;
            i++;
        }

        return (retval);

    }
    [WebMethod]
    public string[] countServiceRadiusEntries(string service)
    {
        Double MyRadius = Convert.ToDouble(Context.Request.Cookies["DHSradius"].Value);
        Double MyLat = Convert.ToDouble(Context.Request.Cookies["MyLat"].Value);
        Double MyLong = Convert.ToDouble(Context.Request.Cookies["MyLong"].Value);

        int i = 0;
        rgOrganizationsTableAdapter name = new rgOrganizationsTableAdapter();
        DHSDataSet.rgOrganizationsDataTable dt = name.CountServiceResultsByRadius(MyLat, MyLong, false, MyRadius, service);
        string[] retval = new string[dt.Count];
        foreach (DHSDataSet.rgOrganizationsRow row in dt)
        {
            retval[i] = row.ORGNAME;
            i++;
        }

        return (retval);

    }
}
