using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AECAMResults : System.Web.UI.Page
{
    public string dataset;
    protected void Page_Load(object sender, EventArgs e)
    {
        string param = Request.QueryString["searchFilter"];
        dataset = Request.QueryString["searchArea"];
       
        switch (dataset)
        {

            case "ABC":
                ObjectDataSource1.TypeName = "DHSDataSetTableAdapters.ABCSitesTableAdapter";
                break;
            case "CCF":
                ObjectDataSource1.TypeName = "DHSDataSetTableAdapters.CFTableAdapter";
                break;
            case "SNP":
                ObjectDataSource1.TypeName = "DHSDataSetTableAdapters.SNPTableAdapter";
                break;
            case "HS":
                ObjectDataSource1.TypeName = "DHSDataSetTableAdapters.HSTableAdapter";
                break;
            case "BB":
                ObjectDataSource1.TypeName = "DHSDataSetTableAdapters.BBTableAdapter";
                break;
        }


        string filter = Request.QueryString["cat"];
        switch (filter)
        {

            case "zip":
                ObjectDataSource1.SelectMethod = "GetDataByZip";
                ObjectDataSource1.SelectParameters.Clear();
                ObjectDataSource1.SelectParameters.Add("Zip", param.ToString());
                break;
            case "city":
                ObjectDataSource1.SelectMethod = "GetDataByCity";
                ObjectDataSource1.SelectParameters.Clear();
                ObjectDataSource1.SelectParameters.Add("City", param.ToString());
                break;
            case "house":
                ObjectDataSource1.SelectMethod = "GetDataByHouse";
                ObjectDataSource1.SelectParameters.Clear();
                ObjectDataSource1.SelectParameters.Add("House", param.ToString());
                break;
            case "senate":
                ObjectDataSource1.SelectMethod = "GetDataBySenate";
                ObjectDataSource1.SelectParameters.Clear();
                ObjectDataSource1.SelectParameters.Add("Senate", param.ToString());
                break;
            case "school":
                ObjectDataSource1.SelectMethod = "GetDataBySchool";
                ObjectDataSource1.SelectParameters.Clear();
                ObjectDataSource1.SelectParameters.Add("School", param.ToString());
                break;
        }

       //Page.DataBind();
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        Page.DataBind();

    }
}