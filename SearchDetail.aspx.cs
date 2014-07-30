using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchDetail : System.Web.UI.Page
{
    public string lat;
    public string lon;
    protected void Page_Load(object sender, EventArgs e)
    {
        lon = DetailsView1.Rows[13].Cells[1].Text;
        lat = DetailsView1.Rows[12].Cells[1].Text;
        string searchType = Request.QueryString["searchType"];
        if (searchType == "parent")
        {
            DetailsView1.Fields[11].Visible = false;
            DetailsView1.Fields[12].Visible = false;
            DetailsView1.Fields[13].Visible = false;            
        }
    }
    public string getLat()
    {
        
        return lat;
    }
    public string getLon()
    {
        return lon;
    }
    protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}