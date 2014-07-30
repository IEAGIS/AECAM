<%@ Page Title="" Language="C#" Debug="true" MasterPageFile="~/DHS.master" AutoEventWireup="true" CodeFile="SearchResults.aspx.cs" Inherits="SearchResults" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript"src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="Scripts/utils.js"></script>
    <script src="Scripts/searchResults.js" type="text/javascript"></script>
    <script src="Scripts/searchFilter.js" type="text/javascript"></script>
    <!--script src="Scripts/simpleSearch.js" type="text/javascript"></script-->
    <script type="text/javascript">
        $(document).ready(function () {
            // hides the filter as soon as the DOM is ready
            //$('#filterVisible').hide();
            // shows the filter on clicking the link  
            /*$('#filterShow').click(function () {
                $('#filterVisible').show();
                $(this).hide();
                $('#filterHide').show();
            });
            $('#filterHide').click(function () {
                $('#filterVisible').hide();
                $(this).hide();
                $('#filterShow').show();
            });*/
        });
    
    </script>
    <style type="text/css">
        #map_canvas {
            height: 615px;
            width: 39%;
            float: left;
        }
        #fleft
        {
            width: 60%;
            float:left;
            /*height: 740px;*/
        }
        #top
        {
            width: 100%;
            /*float:left;
            height: 740px;*/
        }
        #dialog
        {
            width: 100%;
            /*float:left;
            height: 740px;*/
        }    
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="top" style="font-weight:bold;color:Black;">Search Term: <span id="myAddress">
        <br />
        </span>
        <span style="display:none;" id="searchType"></span><span style="display:none;" id="tab"></span>
        <!--br /><br /><a href="#" id="filterShow">Show Filter Options</a><a href="#" id="filterHide" style="display:none">Hide Filter Options</a -->
            <span id="filterVisible">
                <table>
                            <tr>
                                <td style="vertical-align:top; padding-top: 20px;">
                                    <span class="FilterCat"><strong>Filter By:</strong></span>
                                </td>  
                                <td style="text-align:left; vertical-align:top; padding-top: 20px;">
                                    <div class="FilterCat">
                                        <select id="FilterCat">
                                        <option value="">Do Not Filter</option>
                                        <option value="Distance">Distance</option>
                                        <option value="County">County</option>
                                        <option value="City">City</option>                              
                                    </select>
                                    </div>
                                </td>
                                <td>
                                    <div id="filterCounty" class="filterCounty" style="display:none;padding-top: 20px;">
                                        <asp:DropDownList ID="DropDownCounty" runat="server" 
                                        AppendDataBoundItems="True" onchange="filterSearch();return false;">
                                        <asp:ListItem Text="-- Select a County --" Value="" Selected="true"></asp:ListItem>
                                       </asp:DropDownList>
                                   </div>
                                   <div id="filterCity" class="filterCity" style="display:none;padding-top: 20px;">
                                        <asp:DropDownList ID="DropDownCity" runat="server" 
                                        AppendDataBoundItems="True" onchange="filterSearch();return false;">
                                        <asp:ListItem Text="-- Select a City --" Value="" Selected="true"></asp:ListItem>
                                       </asp:DropDownList>
                                   </div>
                                   <div id="filterDistance" class="filterDistance" style="display:none;padding-top: 20px;">
                                       <div style="float:left;" id="myAddressEntry" >                    
                                           Show results within <br /><br />
                                           <input id="5" type="radio" class="radRadio" name="radiusValue" value="5"/>5 Miles
                                           <input id="10" type="radio" class="radRadio" name="radiusValue" value="10"/>10 Miles
                                           <input id="15" type="radio" class="radRadio" name="radiusValue" value="15"/>15 Miles
                                           <input id="20" type="radio" class="radRadio" name="radiusValue" value="20"/>20 Miles
                                           <input id="any" type="radio" class="radRadio" name="radiusValue" checked="checked"  value="any"/>Any distance
                                           <br /><br />of my address. <input type="text" size="60" id="address" name="address" />
                        <button id="btnSetAddress" onclick="geocodeAddress($('#address').val());if(setAddress()){alert('Address set: ' + $('#address').val());}return false;">Set Address</button><br />
                        <br />(Ex. 2801 S University, Little Rock, AR 72204)<br /><br />
                                       </div>
                                       <div><button id="Button1" onclick="filterSearch();return false;">Search</button></div>
                                   </div>
                                </td>                   
                            </tr>
            </table>  
        </span>
    </div>
    <div id="fleft">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="orgID" 
            ConvertEmptyStringToNull="False" DataSourceID="ObjectDataSource5" 
            >
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;height:40px;" id='<%# Eval("orgID")%>'>
                    <td>
                        <a href='SearchDetail.aspx?searchType=<%# searchType %>&ID=<%# Eval("orgID")%>'><span class="pin_names"><asp:Label ID="ORGNAMELabel" runat="server" Text='<%# Eval("ORGNAME") %>' /></span></a>
                    </td>
                    <td style="display:none">
                        <span class="ids"><asp:Label ID="orgIDLabel" runat="server" Text='<%# Eval("orgID")%>' /></span>
                    </td>
                    <td style="display:none">
                        <asp:Label ID="CONTACTLabel" runat="server" Text='<%# Eval("CONTACT") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="PHONELabel" runat="server" Text='<%# Eval("PHONE") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="FAXLabel" runat="server" Text='<%# Eval("FAX") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' />
                    </td>
                    <td>
                        <span class="pin_addresses"><asp:Label ID="ADDR1Label" runat="server" Text='<%# Eval("ADDR1") %>' />,                
                        <asp:Label ID="CITYLabel" runat="server" Text='<%# Eval("CITY") %>' />, AR                 
                        <asp:Label ID="ZIPCODELabel" runat="server" Text='<%# Eval("ZIPCODE") %>' /></span>
                    </td>                    
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("COUNTY") %>' CssClass="county_name" />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="FIPSLabel" runat="server" Text='<%# Eval("FIPS") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="MADDRLabel" runat="server" Text='<%# Eval("MADDR") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="XLabel" runat="server" Text='<%# Eval("X") %>' CssClass="LAT" />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="YLabel" runat="server" Text='<%# Eval("Y") %>' cssClass="LONG"/>
                    </td>
                   
                </tr>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;height:40px;" id='<%# Eval("orgID")%>'>
                    <td>
                        <a href='SearchDetail.aspx?searchType=<%# searchType %>&ID=<%# Eval("orgID")%>'><span class="pin_names"><asp:Label ID="ORGNAMELabel" runat="server" Text='<%# Eval("ORGNAME") %>' /></span></a>
                    </td>
                    <td style="display:none">
                        <span class="ids"><asp:Label ID="orgIDLabel" runat="server" Text='<%# Eval("orgID")%>' /></span>
                    </td>
                    <td style="display:none">
                        <asp:Label ID="CONTACTLabel" runat="server" Text='<%# Eval("CONTACT") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="PHONELabel" runat="server" Text='<%# Eval("PHONE") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="FAXLabel" runat="server" Text='<%# Eval("FAX") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' />
                    </td>
                    <td>
                        <span class="pin_addresses"><asp:Label ID="ADDR1Label" runat="server" Text='<%# Eval("ADDR1") %>' />,                
                        <asp:Label ID="CITYLabel" runat="server" Text='<%# Eval("CITY") %>' />, AR                 
                        <asp:Label ID="ZIPCODELabel" runat="server" Text='<%# Eval("ZIPCODE") %>' /></span>
                    </td>
                    <td>
                        <asp:Label ID="COUNTYLabel" runat="server" Text='<%# Eval("COUNTY") %>' CssClass="county_name" />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="FIPSLabel" runat="server" Text='<%# Eval("FIPS") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="MADDRLabel" runat="server" Text='<%# Eval("MADDR") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="XLabel" runat="server" Text='<%# Eval("X") %>' cssClass="LAT"/>
                    </td>
                    <td style="display:none">
                        <asp:Label ID="YLabel" runat="server" Text='<%# Eval("Y") %>' cssClass="LONG"/>
                    </td>
                    <td style="display:none">
                        <asp:Label ID="SFPFLabel" runat="server" Text='<%# Eval("SFPF") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="DOMAINLabel" runat="server" Text='<%# Eval("DOMAIN") %>' />
                    </td>                  
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th><asp:LinkButton ID="lnkName" runat="server" CommandName="Sort"
                                        CommandArgument="ORGNAME" Text="ORGANIZATION" /></th>
                                    <th style="display:none" runat="server">
                                        orgID</th>
                                    <th runat="server" style="display:none">
                                        CONTACT</th>
                                    <th runat="server" style="display:none">
                                        PHONE</th>
                                    <th runat="server" style="display:none">
                                        FAX</th>
                                    <th runat="server" style="display:none">
                                        EMAIL</th>
                                    <th runat="server">
                                        ADDRESS</th>
                                    <th runat="server" style="display:none">
                                        CITY</th>
                                    <th runat="server" style="display:none">
                                        ZIPCODE</th>
                                   <th><asp:LinkButton ID="LinkButton1" runat="server" CommandName="Sort"
                                        CommandArgument="COUNTY" Text="COUNTY" /></th>
                                    <th runat="server" style="display:none">
                                        FIPS</th>
                                    <th runat="server" style="display:none">
                                        MADDR</th>
                                    <th runat="server" style="display:none">
                                        X</th>
                                    <th runat="server" style="display:none">
                                        Y</th>
                                    <th runat="server" style="display:none">
                                        SFPF</th>
                                    <th runat="server" style="display:none">
                                        DOMAIN</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="15">
                             <Fields>
                              <asp:TemplatePagerField>              
                                <PagerTemplate>
                                <b>
                                Page
                                <asp:Label runat="server" ID="CurrentPageLabel" 
                                  Text="<%# Container.TotalRowCount>0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>" />
                                of
                                <asp:Label runat="server" ID="TotalPagesLabel" 
                                  Text="<%# Math.Ceiling ((double)Container.TotalRowCount / Container.PageSize) %>" />
                                (
                                <asp:Label runat="server" ID="TotalItemsLabel" 
                                  Text="<%# Container.TotalRowCount%>" />
                                records)
                                <br />
                                </b>
                                </PagerTemplate>
                              </asp:TemplatePagerField>

                              <asp:NextPreviousPagerField
                                ButtonType="Button"
                                ShowFirstPageButton="true"
                                ShowNextPageButton="false"
                                ShowPreviousPageButton="false" />

                              <asp:NumericPagerField 
                                PreviousPageText="&lt; Prev 10"
                                NextPageText="Next 10 &gt;"
                                ButtonCount="10" />

                              <asp:NextPreviousPagerField
                                ButtonType="Button"
                                ShowLastPageButton="true"
                                ShowNextPageButton="false"
                                ShowPreviousPageButton="false" />
                            </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>                                       
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByRadius" 
            TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
            <SelectParameters>
                <asp:Parameter DefaultValue="0.00" Name="LatitudeA" Type="Double" />
                <asp:Parameter DefaultValue="0.00" Name="LongitudeA" Type="Double" />
                <asp:Parameter DefaultValue="false" Name="InKilometers" Type="Boolean" />
                <asp:Parameter DefaultValue="0.00" Name="Radius" Type="Double" />
            </SelectParameters>
        </asp:ObjectDataSource>
        Source: UAMS Family and Preventive Medicine / TIPS for Great Kids Program
</div>
<div id="map_canvas"></div>
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByCounty" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_orgID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="Pulaski" Name="COUNTY" 
                QueryStringField="currentFilter" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    &nbsp;<asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByFreetext" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="KEYWORD" QueryStringField="searchFilter" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByService" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="SERVICE" QueryStringField="searchFilter" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" 
        DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByDomain" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_orgID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="DOMAIN" QueryStringField="searchFilter" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" 
        DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByKeywordClose" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_orgID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:CookieParameter CookieName="MyLat" DefaultValue="" Name="LatitudeA" 
                Type="Double" />
            <asp:CookieParameter CookieName="MyLong" DefaultValue="" 
                Name="LongitudeA" Type="Double" />
            <asp:Parameter DefaultValue="false" Name="InKilometers" Type="Boolean" />
            <asp:CookieParameter CookieName="DHSradius" DefaultValue="" Name="Radius" 
                Type="Double" />
            <asp:QueryStringParameter DefaultValue="health" Name="Keyword" 
                QueryStringField="searchFilter" Type="String" />
        </SelectParameters>       
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByServiceClose" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:CookieParameter CookieName="MyLat" DefaultValue="0.00" Name="LatitudeA" 
                Type="Double" />
            <asp:CookieParameter CookieName="MyLong" DefaultValue="0.00" 
                Name="LongitudeA" Type="Double" />
            <asp:Parameter DefaultValue="false" Name="InKilometers" Type="Boolean" />
            <asp:CookieParameter CookieName="DHSradius" DefaultValue="" Name="Radius" 
                Type="Double" />
            <asp:QueryStringParameter Name="Service" QueryStringField="searchFilter" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" 
        DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBySFPF" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_orgID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="SFPF" QueryStringField="searchFilter" 
                Type="Int32" />
        </SelectParameters>       
    </asp:ObjectDataSource>    
    <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByKeywordsCounty" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="Keyword" 
                QueryStringField="searchFilter" Type="String" />
            <asp:QueryStringParameter DefaultValue="05119" Name="FIPS" 
                QueryStringField="geoFilter" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByServiceCounty" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="Service" QueryStringField="searchFilter" 
                Type="String" />
            <asp:QueryStringParameter Name="FIPS" QueryStringField="geoFilter" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByKeywordsCity" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="Keyword" QueryStringField="searchFilter" 
                Type="String" />
            <asp:QueryStringParameter DefaultValue="" Name="CITY" 
                QueryStringField="geoFilter" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource12" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByServiceCity" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="Service" QueryStringField="searchFilter" 
                Type="String" />
            <asp:QueryStringParameter DefaultValue="" Name="CITY" 
                QueryStringField="geoFilter" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource13" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="CountServiceResultsByRadius" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:CookieParameter CookieName="MyLat" Name="LatitudeA" Type="Double" />
            <asp:CookieParameter CookieName="MyLong" Name="LongitudeA" Type="Double" />
            <asp:Parameter DefaultValue="false" Name="InKilometers" Type="Boolean" />
            <asp:CookieParameter CookieName="DHSradius" DefaultValue="" Name="Radius" 
                Type="Double" />
            <asp:QueryStringParameter Name="Service" QueryStringField="searchFilter" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource14" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySFPFClose" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:CookieParameter CookieName="MyLat" DefaultValue="" Name="LatitudeA" 
                Type="Double" />
            <asp:CookieParameter CookieName="MyLong" DefaultValue="" Name="LongitudeA" 
                Type="Double" />
            <asp:Parameter DefaultValue="false" Name="InKilometers" Type="Boolean" />
            <asp:CookieParameter CookieName="DHSradius" DefaultValue="" Name="Radius" 
                Type="Double" />
            <asp:QueryStringParameter Name="SFPF" QueryStringField="searchFilter" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource15" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBySFPFCounty" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="SFPF" QueryStringField="searchFilter" 
                Type="String" />
            <asp:QueryStringParameter Name="FIPS" QueryStringField="geoFilter" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource16" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBySFPFCity" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="SFPF" QueryStringField="searchFilter" 
                Type="String" />
            <asp:QueryStringParameter Name="CITY" QueryStringField="geoFilter" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource17" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByDomainClose" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:CookieParameter CookieName="MyLat" DefaultValue="" Name="LatitudeA" 
                Type="Double" />
            <asp:CookieParameter CookieName="MyLong" DefaultValue="" Name="LongitudeA" 
                Type="Double" />
            <asp:Parameter DefaultValue="false" Name="InKilometers" Type="Boolean" />
            <asp:CookieParameter CookieName="DHSradius" DefaultValue="" Name="Radius" 
                Type="Double" />
            <asp:QueryStringParameter Name="DOMAIN" QueryStringField="searchFilter" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource18" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByDomainCounty" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DOMAIN" QueryStringField="searchFilter" 
                Type="String" />
            <asp:QueryStringParameter Name="FIPS" QueryStringField="geoFilter" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource19" runat="server" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByDomainCity" 
        TypeName="DHSDataSetTableAdapters.rgOrganizationsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DOMAIN" QueryStringField="searchFilter" 
                Type="String" />
            <asp:QueryStringParameter Name="CITY" QueryStringField="geoFilter" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

