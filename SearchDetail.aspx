<%@ Page Title="" Language="C#" MasterPageFile="~/DHS.master" AutoEventWireup="true" CodeFile="SearchDetail.aspx.cs" Inherits="SearchDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        var LAT = '<%= getLat() %>';
        var LONG = '<%= getLon() %>';
    </script>
    <script type="text/javascript"src="//maps.google.com/maps/api/js?sensor=false"></script>
    <script src="Scripts/searchDetail.js" type="text/javascript"></script>
    <script src="Scripts/utils.js" type="text/javascript"></script>
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
    DataKeyNames="orgID" DataSourceID="ObjectDataSource1" Height="20px" 
    Width="500px" CellPadding="4" ForeColor="#333333" GridLines="None" 
        onpageindexchanging="DetailsView1_PageIndexChanging" 
        >
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
    <EditRowStyle BackColor="#999999" />
    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="ORGNAME" HeaderText="Organization" 
            SortExpression="ORGNAME" ItemStyle-CssClass="street_address"/>
        <asp:BoundField DataField="CONTACT" HeaderText="Contact" 
            SortExpression="CONTACT" />
        <asp:BoundField DataField="PHONE" HeaderText="Phone" SortExpression="PHONE" />
        <asp:BoundField DataField="FAX" HeaderText="Fax" SortExpression="FAX" />
        <asp:HyperLinkField HeaderText="Website" Target="_new" DataNavigateUrlFields="WEBSITE" DataNavigateUrlFormatString="//{0}" DataTextField="WEBSITE" />  
        <asp:BoundField DataField="EMAIL" DataFormatString="&lt;a href=mailto:{0}&gt;{0}&lt;/a&gt;" HtmlEncodeFormatString="false" HeaderText="email" SortExpression="EMAIL" />
        <asp:BoundField DataField="MADDR" HeaderText="Mailing Address" 
            SortExpression="MADDR" />
        <asp:BoundField DataField="ADDR1" HeaderText="Street Address" 
            SortExpression="ADDR1" />
        <asp:BoundField DataField="CITY" HeaderText="City" SortExpression="CITY" />
        <asp:BoundField DataField="ZIPCODE" HeaderText="Zip Code" 
            SortExpression="ZIPCODE" />
        <asp:BoundField DataField="COUNTY" HeaderText="County" 
            SortExpression="COUNTY" />
        <asp:BoundField DataField="FIPS" HeaderText="FIPS" SortExpression="FIPS" />
        <asp:BoundField DataField="X" HeaderText="Latitude" SortExpression="X" 
            ReadOnly="True" ItemStyle-CssClass="lat" >
        <HeaderStyle Wrap="False" />
        </asp:BoundField>
        <asp:BoundField DataField="Y" HeaderText="Longitude" SortExpression="Y" 
            ItemStyle-CssClass="long"/>
        <asp:BoundField DataField="SFPFName" HeaderText="SFPF" 
            SortExpression="SFPFName" />
        <asp:BoundField DataField="DOMAINName" HeaderText="Domain" 
            SortExpression="DOMAIN" />
    </Fields>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
</asp:DetailsView>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByID" 
    TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter" 
        onselecting="ObjectDataSource1_Selecting">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="2" Name="orgID" QueryStringField="ID" 
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<br />
Services Provided
<div style=" padding : 4px; width : 95%; height : 120px; overflow : auto; ">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
        <HeaderTemplate>
            <table border=0 width='100%'>
         </HeaderTemplate>
        <ItemTemplate>
        <tr style="background-color:Gainsboro;color:Black">
        <td><!-- a href='SearchResults.aspx?searchArea=service&searchFilter=<%# Eval("service") %>'--><%# Eval("service") %><!--/a--></td>
        </tr>
        </ItemTemplate>
        <FooterTemplate>
        </table>
        </FooterTemplate>
        
        </asp:Repeater>
</div>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetServicesByOrg" 
        TypeName="DHSDataSetTableAdapters.rgServicesProvidedTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="2" Name="ORGID" QueryStringField="ID" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <br />
    Counties Served
    <div style=" padding : 4px; width : 95%; height : 40px; overflow : auto; ">
     <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource3">
        <HeaderTemplate>
            <table border="0" width='100%'>
         </HeaderTemplate>
        <ItemTemplate>
        <tr style="background-color:Gainsboro;color:Black">
        <td><%# Eval("countyName") %></td>
        </tr>
        </ItemTemplate>
        <FooterTemplate>
        </table>
        </FooterTemplate>
        
        </asp:Repeater>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByOrgID" 
        TypeName="DHSDataSetTableAdapters.rgCountiesServedTableAdapter" 
        UpdateMethod="Update">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="2" Name="orgID" QueryStringField="ID" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    Source: UAMS Family and Preventive Medicine
</fieldset>
<div id="map_canvas"></div>
<div id="panel" style="overflow:auto;height:350px"></div>

</asp:Content>

