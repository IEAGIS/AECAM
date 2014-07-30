<%@ Page Title="" Language="C#" MasterPageFile="~/DHS.master" AutoEventWireup="true" CodeFile="AECAMSearchDetail.aspx.cs" Inherits="AECAMSearchDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript"src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script src="Scripts/searchDetail.js" type="text/javascript"></script>
    <script src="Scripts/utils.js" type="text/javascript"></script>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-32593907-1']);
        _gaq.push(['_setDomainName', 'none']);
        _gaq.push(['_setAllowLinker', true]);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>    
    <script type="text/javascript">
            var LAT = '<%= getLat() %>';
            var LONG = '<%= getLon() %>';
    </script>
    <style type="text/css">
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
    }
    .lat{
        height:100%;
    }
    #map_canvas {
      height: 100%;
    }

      #map_canvas {
        height: 750px;
       /* margin-top:25px;*/
      }
    fieldset
    {
        width: 50%;
        float:left; 
        height: 740px; 
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <fieldset>
Organization Details<br />
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    DataKeyNames="OBJECTID" DataSourceID="ObjectDataSource1" Height="20px" 
    Width="500px" CellPadding="4" ForeColor="#333333" GridLines="None" >
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
    <EditRowStyle BackColor="#999999" />
    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="Name" HeaderText="Organization" 
            SortExpression="ORGNAME" ItemStyle-CssClass="street_address">
<ItemStyle CssClass="street_address"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="FacilityTy" HeaderText="Facility Type" 
            SortExpression="FacilityTy" />
        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
        <asp:TemplateField HeaderText="City, State Zip">
            <ItemTemplate>
            <asp:Label ID="Label2" runat="server"
                  Text='<%# Eval("City") %>'></asp:Label> <asp:Label ID="Label1" runat="server"
                  Text='<%# Eval("State")%>'></asp:Label>  <asp:Label ID="Label3" runat="server"
                  Text='<%# Eval("Zip") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="House_Dist" HeaderText="State House District" SortExpression="House_Dist" />
        <asp:HyperLinkField HeaderText="State Representative" Target="_new" DataNavigateUrlFields="House_Web" DataNavigateUrlFormatString="{0}" DataTextField="House_Rep" />  
        <asp:BoundField DataField="Senate_Dis" HeaderText="State Senate District" SortExpression="Senate_Dis" />
        <asp:HyperLinkField HeaderText="State Senator" Target="_new" DataNavigateUrlFields="Senate_Web" DataNavigateUrlFormatString="{0}" DataTextField="Senator" />  
        <asp:BoundField DataField="Cong_Distr" HeaderText="US Congressional District" SortExpression="Cong_Distr" />
        <asp:HyperLinkField HeaderText="US Representative" Target="_new" DataNavigateUrlFields="Cong_Web" DataNavigateUrlFormatString="{0}" DataTextField="Cong_Rep" />  
        <asp:BoundField DataField="School_Dis" HeaderText="School District" SortExpression="School_Dis" />        
        <asp:BoundField DataField="X" HeaderText="Latitude" SortExpression="X" 
            ReadOnly="True" ItemStyle-CssClass="lat">
        <HeaderStyle Wrap="False" />

<ItemStyle CssClass="lat"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Y" HeaderText="Longitude" SortExpression="Y" 
            ItemStyle-CssClass="long">        
<ItemStyle CssClass="long"></ItemStyle>
        </asp:BoundField>
    </Fields>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
</asp:DetailsView>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByID" 
    TypeName="DHSDataSetTableAdapters.ABCTableAdapter">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="2" Name="OBJECTID" QueryStringField="ID" 
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<br />
Source: DHS Child Care Licensing Data
</fieldset>

<div id="map_canvas"></div>
<div id="panel" style="position:relative;overflow:auto;height:350px"></div>

</asp:Content>

