using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AECAMSearchDetail : System.Web.UI.Page
{
    public string lat;
    public string lon;
    protected void Page_Load(object sender, EventArgs e)
    {        
        string param = Request.QueryString["currentFilter"];
        string dataset = Request.QueryString["searchArea"];
        switch (dataset)
        {

            case "ABC":
                ObjectDataSource1.TypeName = "DHSDataSetTableAdapters.ABCSitesTableAdapter";
                break;
            case "CCF":
                ObjectDataSource1.TypeName = "DHSDataSetTableAdapters.CFTableAdapter";
                break;
            case "SNP":
                ObjectDataSource1.TypeName = "DHSDataSetTableAdapters.SNPSitesTableAdapter";
                break;
            case "HS":
                ObjectDataSource1.TypeName = "DHSDataSetTableAdapters.HSTableAdapter";
                break;
            case "BB":
                ObjectDataSource1.TypeName = "DHSDataSetTableAdapters.BBTableAdapter";
                break;
        }

        ObjectDataSource1.SelectMethod = "GetDataByID";
        ObjectDataSource1.SelectParameters.Clear();
        ObjectDataSource1.SelectParameters.Add("SiteId", param.ToString());

        lon = DetailsView1.Rows[5].Cells[1].Text;
        lat = DetailsView1.Rows[4].Cells[1].Text;
        DetailsView1.Fields[4].Visible = false;
        DetailsView1.Fields[5].Visible = false;

    }
    public string getLat()
    {

        return lat;
    }
    public string getLon()
    {
        return lon;
    }
}