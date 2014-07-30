<%@ Page Title="" Language="C#" MasterPageFile="~/DHS.master" AutoEventWireup="true" CodeFile="AECAMResults.aspx.cs" Inherits="AECAMResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript"src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="Scripts/utils.js"></script>   
    <script src="Scripts/AECAMResults.js" type="text/javascript"></script>
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
    <div id="top" style="font-weight:bold;color:Black;">Search Term: <span id="myAddress"></span></div>
    <div id="fleft">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="OBJECTID" 
            DataSourceID="ObjectDataSource1">           
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;height:40px;" id='<%# Eval("OBJECTID")%>'>
                    <td style="display:none">
                        <span class="ids"><asp:Label ID="OBJECTIDLabel" runat="server" Text='<%# Eval("OBJECTID")%>' /></span>                         
                    </td>
                    <td>
                        <a href='AECAMSearchDetail.aspx?searchArea=<%# dataset%>&currentFilter=<%# Eval("OBJECTID")%>'><span class="pin_names"><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></span></a>
                    </td>
                    <td><span class="pin_addresses"><asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("ARC_Addres") %>' />,                
                        <asp:Label ID="City_1Label" runat="server" Text='<%# Eval("ARC_City") %>' />, AR                 
                        <asp:Label ID="Zip_1Label" runat="server" Text='<%# Eval("ARC_Zip") %>' /></span>
                    </td>    
                    <td>
                        <asp:Label ID="FacilityTyLabel" runat="server" 
                            Text='<%# Eval("FacilityTy") %>' />
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
                        <td><a href='AECAMSearch.aspx'>Return to search</a></td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;height:40px;" id='<%# Eval("OBJECTID")%>'>
                     <td style="display:none">
                        <span class="ids"><asp:Label ID="OBJECTIDLabel" runat="server" Text='<%# Eval("OBJECTID")%>' /></span>
                    </td>
                    <td>
                        <a href='AECAMSearchDetail.aspx?searchArea=<%# dataset%>&currentFilter=<%# Eval("OBJECTID")%>'><span class="pin_names"><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></span></a>
                    </td>
                    <td><span class="pin_addresses"><asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("ARC_Addres") %>' />,                
                        <asp:Label ID="City_1Label" runat="server" Text='<%# Eval("ARC_City") %>' />, AR                 
                        <asp:Label ID="Zip_1Label" runat="server" Text='<%# Eval("ARC_Zip") %>' /></span>
                    </td>                   
                    <td>
                        <asp:Label ID="FacilityTyLabel" runat="server" 
                            Text='<%# Eval("FacilityTy") %>' />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="XLabel" runat="server" Text='<%# Eval("X") %>' CssClass="LAT" />
                    </td>
                    <td style="display:none">
                        <asp:Label ID="YLabel" runat="server" Text='<%# Eval("Y") %>' cssClass="LONG"/>
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
                                    <th id="Th4" runat="server" style="display:none">
                                        ID</th>
                                    <th><asp:LinkButton ID="LinkButton1" runat="server" CommandName="Sort"
                                        CommandArgument="Name" Text="Name" /></th>
                                    <th runat="server">
                                        Address</th> 
                                    <th id="Th3" runat="server">                                       
                                        Facility Type</th>    
                                    <th id="Th1" runat="server" style="display:none">
                                        X</th>
                                    <th id="Th2" runat="server" style="display:none">
                                        Y</th>
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
            OldValuesParameterFormatString="original_{0}" SelectMethod="" 
            TypeName="DHSDataSetTableAdapters.ABCTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ZIP" QueryStringField="currentFilter" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        Source: DHS Child Care Licensing Data
    </div>
    <div id="map_canvas"></div>
</asp:Content>

