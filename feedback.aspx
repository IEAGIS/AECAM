<%@ Page Title="" Language="C#" MasterPageFile="~/DHS.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>
<%@ Import Namespace="System.Net.Mail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
    <link href="Content/Css/feedback.css" rel="stylesheet" type="text/css" />    
    <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
    <script src="Scripts/jquery-ui-1.8.11.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                    ctl00$ContentPlaceHolder1$rblist2: {
                        required: true
                    },
                    ctl00$ContentPlaceHolder1$p1f7c_4_other: {
                        required: "#ContentPlaceHolder1_rblist2_3:checked"
                    }
                }
            });
        });
    </script>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="previewribbondiv" class="previewribbon"></div>
<noscript>
<p style="font-size:16px;text-align:center;">
<span style="font-size:20px;"><b>Javascript is not enabled in your browser.</b></span><span>
<br/>This form will not function properly without Javascript enabled.<br/>Please enable Javascript and reload the form.</span>
</p>
</noscript>
<form method="post" action="" id="form">
    <div id="formcontent">
        <div id="sizedcontent">
            <div id="infoheader" class="headerclass pagemargins">
                <table width="100%">
                    <col width="100%"/>
                    <tr>
                        <td>
                            <span id="infoheadertext" class="completeheadertext">
                                <span>
                                    <span class="pspan trebuchet" style="text-align:center;font-size:28px;">
                                        <span class="ispan" style="color:#737373" xml:space="preserve">@msg@</span>
                                    </span>
                                </span>
                            </span>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="header" class="headerclass pagemargins" style="background-color:#FFCC00;">
                <table width="100%" cellpadding="0px" cellspacing="0px" border="0px">
                    <col width="100%"/>
                    <tr>
                        <td>
                            <div style="width:620px;">
                            <span>
                                <span class="pspan trebuchet" style="text-align:center;font-size:28px;">
                                    <span class="ispan" style="color:#737373" xml:space="preserve">AECAM Feedback Form</span>
                                 </span>
                            </span>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        <div id="pages" class="pagemargins">
            <div id="complete" class="formpage">
                <div id="confirmmsg"></div>
                <div class="null"></div>
            </div>
            <div id="page1" class="formpage" style="display:block;">
                <div class="formrow f1">
                    <div id="p1f1" class="field f1">
                        <div class="staticcontrol">
                            <span>
                                <span class="pspan trebuchet" style="text-align:center;font-size:14px;">
                                    <span class="ispan" style="font-style:italic;color:#595959" xml:space="preserve">Please send your feedback on the quality of this site.</span>
                                </span>
                            </span>
                        </div>
                        <div class="null"></div>
                    </div>
                    <div class="null"></div>
                </div>
                <div class="formrow f1">
                    <div id="p1f2" class="field f1">
                        <div class="caption capabove alignleft">
                            <label class="fieldlabel" for="p1f2c"><span><span class="pspan trebuchet" style="text-align:left;font-size:14px;">
                                <span class="ispan" style="font-weight:bold;color:#595959" xml:space="preserve">First Name</span><span class="requiredlabel">*</span></span></span></label>
                            <div class="null"></div>
                        </div>
                        <div class="control capabove">
                            <div>
                                <asp:TextBox runat="server" id="p1f2c" name="p1f2" class="fieldcontent required" style="width:300px;"/>
                                <div class="fielderror"></div>
                            </div>
                            <div class="null"></div>
                        </div>
                        <div class="null"></div>
                    </div>
                    <div class="null"></div>
                </div>
                <div class="formrow f1">
                    <div id="p1f3" class="field f1">
                        <div class="caption capabove alignleft">
                            <label class="fieldlabel" for="p1f3c"><span><span class="pspan trebuchet" style="text-align:left;font-size:14px;"><span class="ispan" style="font-weight:bold;color:#595959" xml:space="preserve">Last Name</span><span class="requiredlabel">*</span></span></span></label>
                            <div class="null"></div>
                        </div>
                        <div class="control capabove">
                            <div>
                                <asp:TextBox runat="server" id="p1f3c" name="p1f3" class="fieldcontent required" style="width:300px;"/>
                                <div class="fielderror"></div>
                            </div>
                            <div class="null"></div>
                        </div>
                        <div class="null"></div>
                    </div>
                    <div class="null"></div>
                </div>
                <div class="formrow f1">
                    <div id="p1f4" class="field f1">
                        <div class="caption capabove alignleft">
                            <label class="fieldlabel" for="p1f4c"><span><span class="pspan trebuchet" style="text-align:left;font-size:14px;"><span class="ispan" style="font-weight:bold;color:#595959" xml:space="preserve">E-mail address</span><span class="requiredlabel">*</span></span></span></label>
                            <div class="null"></div>
                        </div>
                        <div class="control capabove">
                            <div>
                                <asp:TextBox runat="server" id="p1f4c" name="p1f4" class="fieldcontent email required" style="width:300px;"/>
                                <div class="fielderror"></div>
                            </div>
                            <div class="null"></div>
                        </div>
                        <div class="null"></div>
                    </div>
                    <div class="null"></div>
                </div>
                <div class="formrow f1">
                    <div id="p1f5" class="field f1">
                        <div class="caption capabove alignleft">
                            <label class="fieldlabel" for="p1f5c"><span><span class="pspan trebuchet" style="text-align:left;font-size:14px;"><span class="ispan" style="font-weight:bold;color:#595959" xml:space="preserve">Phone Number</span></span></span></label>
                            <div class="null"></div>
                        </div>
                        <div class="control capabove">
                            <div>
                                <asp:TextBox runat="server" id="p1f5c" name="p1f5" class="fieldcontent" style="width:300px;"/>
                                <div class="fielderror"></div>
                            </div>
                            <div class="null"></div>
                        </div>
                        <div class="null"></div>
                    </div>
                    <div class="null"></div>
                </div>
                <div class="formrow f1">
                    <div id="p1f6" class="field f1">
                    <div class="caption capabove alignleft">
                        <div class="grouplabel">
                            <span>
                                <span class="pspan trebuchet" style="text-align:left;font-size:14px;">
                                    <span style="font-weight:bold;color:#595959" xml:space="preserve">Please provide your feedback on the quality of this online directory and mapping system:
                                    </span>
                                </span>
                             </span><div class="null"></div>
                        </div>
                    </div>
                    <div>
                    <div class="choicegroup stack">
                        <div class="choicefield choice">
                            <div class="choiceinput">                
                                <asp:RadioButtonList id="rblist0" class="required" runat="server">
                                    <asp:ListItem Text="Excellent" value="Excellent"></asp:ListItem>
                                    <asp:ListItem Text="Very Good" value="Very Good"></asp:ListItem>
                                    <asp:ListItem Text="Average" value="Good"></asp:ListItem>
                                    <asp:ListItem Text="Average" value="Average"></asp:ListItem>
                                    <asp:ListItem Text="Poor" value="Poor"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>                
                    </div>                
                    </div>
                    <div class="null"></div>
                </div>
                <div class="formrow f1">
                    <div id="p1f7" class="field f1">
                        <div class="caption capabove alignleft">
                            <div class="grouplabel">
                                <span>
                                    <span class="pspan trebuchet" style="text-align:left;font-size:14px;">
                                        <span class="ispan" style="font-weight:bold;color:#595959" xml:space="preserve">This feedback is specific to this site's...</span>
                                        <span class="requiredlabel">*</span>
                                    </span>
                                </span>
                                <div class="null"></div>
                            </div>
                            <div class="null"></div>
                        </div>
                        <div class="choicegroup stack">
                            <div class="choicefield choice">
                                <div class="choiceinput">
                                    <asp:RadioButtonList ID="rblist2" runat="server">
                                        <asp:ListItem Text="Features and Functionality" value="Features and Functionality"></asp:ListItem>
                                        <asp:ListItem Text="Data and Directory Listings" value="Data and Directory Listings"></asp:ListItem>
                                        <asp:ListItem Text="Layout and Design" value="Layout and Design"></asp:ListItem>
                                        <asp:ListItem Text="Other" value="Other"></asp:ListItem>
                                    </asp:RadioButtonList><asp:TextBox runat="server" Groupname="p1f7" id="p1f7c_4_other"/><br />
                                </div>
                            </div>
                       </div>
                    </div>
                </div>         
                <div class="formrow f1">
                    <div id="p1f9" class="field f1">
                        <div class="caption capabove alignleft">
                            <div class="grouplabel"><span><span class="pspan trebuchet" style="text-align:left;font-size:14px;"><span class="ispan" style="font-weight:bold;color:#595959" xml:space="preserve">Were you able to find what you were looking for?</span></span></span><div class="null"></div>
                            </div>
                            <div class="null"></div>
                        </div>
                        <img class="helpbutton pngfix" src="Content/images/help_icon.png" title="If you answer No, then please fill in the next items."><div class="control capabove">
                        <div>
                            <div class="choicegroup sbs">
                                <div class="choicefield choice">
                                    <div class="choiceinput">
                                        <asp:RadioButtonList ID="rblist4" runat="server">
                                            <asp:ListItem  Text="Yes" value="Yes"></asp:ListItem>
                                            <asp:ListItem  Text="No" value="No"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>

                                    <div class="null"></div>
                                </div>
                            <div class="fielderror"></div>
                            <div class="null"></div>
                        </div>
                        <div class="null"></div>
                        </div>
                        <div class="null"></div>
                    </div>
                    <div class="null"></div>
                </div>                            
                <div class="formrow f1">
                    <div id="p1f10" class="field f1">
                        <div class="caption capabove alignleft">
                            <label class="fieldlabel" for="p1f10c">
                                <span>
                                    <span class="pspan trebuchet" style="text-align:left;font-size:14px;">
                                        <span class="ispan" style="font-weight:bold;color:#595959" xml:space="preserve">Directory Listing data to add to our site (please be detailed):</span>
                                    </span>
                                </span>
                            </label>
                            <div class="null"></div>
                        </div>
                    <div class="control capabove">
                        <div>
                            <textarea runat="server" cols="60" rows="5" id="p1f10c" name="p1f10" class="fieldcontent"></textarea>
                            <div class="fielderror"></div>
                        </div>
                        <div class="null"></div>
                    </div>
                   </div>
                </div>
                <div class="formrow f1">
                    <div id="p1f11" class="field f1">
                        <div class="caption capabove alignleft">
                            <div class="grouplabel">
                                <span>
                                    <span class="pspan trebuchet" style="text-align:left;font-size:14px;">
                                        <span class="ispan" style="font-weight:bold;color:#595959" xml:space="preserve">Please tell us which section this new information belongs to:</span>
                                    </span>
                                </span>
                                <div class="null"></div>
                            </div>
                            <div class="null"></div>
                        </div>
                        <div class="control capabove">
                            <div>
                                <div class="choicegroup stack">
                                    <div class="choicefield choice">
                                        <div class="choiceinput">
                                            <asp:RadioButtonList ID="rblist3" runat="server">
                                                <asp:ListItem Text="Community Resources, Find ABC (Arkansas Better Chance)" value="Community Resources, Find ABC (Arkansas Better Chance)"></asp:ListItem>
                                                <asp:ListItem Text="Community Resources, Find Child Care Facilities" value="Community Resources, Find Child Care Facilities"></asp:ListItem>
                                                <asp:ListItem Text="Community Resources, Find Head Start Programs" value="Community Resources, Find Head Start Programs"></asp:ListItem>
                                                <asp:ListItem Text="Community Resources, Find Special Nutritional Programs" value="Community Resources, Find Special Nutritional Programs"></asp:ListItem>
                                                <asp:ListItem Text="Community Resources, Resources" value="Community Resources, Resources"></asp:ListItem>
                                                <asp:ListItem Text="Mapping feature" value="Mapping feature"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
               
                                    </div>               
                                    <div class="null"></div>
                                </div>
                                <div class="fielderror"></div>
                                <div class="null"></div>
                            </div>
                            <div class="null"></div>
                        </div>
                    <div class="null"></div>
                    </div>
                    <div class="null"></div>
                </div>
                <div class="formrow f1">
                    <div id="p1f12" class="field f1">
                        <div class="caption capabove alignleft">
                            <div class="grouplabel"><span><span class="pspan trebuchet" style="text-align:left;font-size:14px;"><span class="ispan" style="font-weight:bold;color:#595959" xml:space="preserve">Is this listing brand new or is this an update to an existing listing?</span></span></span><div class="null"></div>
                            </div>
                            <div class="null"></div>
                        </div>
                        <div class="control capabove">
                            <div class="choicegroup stack">
                                <asp:RadioButtonList ID="rblist1" runat="server">
                                    <asp:ListItem Text="New listing" Value="New listing"></asp:ListItem>
                                    <asp:ListItem Text="Update to an existing listing" Value="Update to an existing listing"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="null"></div>
                        </div>
                        <div class="fielderror"></div>
                        <div class="null"></div>
                    </div>
                    <div class="null"></div>
                </div>
                <div class="null"></div>
                </div>
                <div class="null"></div>
                </div>
                <div class="formrow f1">
                    <div id="p1f13" class="field f1">
                        <div class="staticcontrol">
                            <div class="hrcenter px1"></div>
                        </div>
                        <div class="null"></div>
                    </div>
                    <div class="null"></div>
                </div>
                <div class="formrow f1">
                    <div id="p1f14" class="field f1">
                        <div class="caption capabove alignleft">
                            <label class="fieldlabel" for="p1f14c"><span><span class="pspan trebuchet" style="text-align:left;font-size:14px;"><span class="ispan" style="font-weight:bold;color:#595959" xml:space="preserve">How could we make the site easier to use?</span></span></span></label>
                            <div class="null"></div>
                        </div>
                        <div class="control capabove">
                            <div>
                            <textarea runat="server" cols="60" rows="5" id="p1f14c" name="p1f14" class="fieldcontent"></textarea>
                            <div class="fielderror"></div>
                            </div>
                            <div class="null"></div>
                        </div>
                        <div class="null"></div>
                    </div>
                    <div class="null"></div>
                </div>
                <div class="formrow f1">
                    <div id="p1f15" class="field f1">
                        <div class="caption capabove alignleft">
                            <label class="fieldlabel" for="p1f15c"><span><span class="pspan trebuchet" style="text-align:left;font-size:14px;"><span class="ispan" style="font-weight:bold;color:#595959" xml:space="preserve">Do you have any other suggestions on what we can do to provide you with a better service?</span></span></span></label>
                            <div class="null"></div>
                        </div>
                        <div class="control capabove">
                            <div>
                                <textarea runat="server" cols="60" rows="5" id="p1f15c" name="p1f15" class="fieldcontent"></textarea>
                                <div class="fielderror"></div>
                            </div>
                            <div class="null"></div>
                        </div>
                        <div class="null"></div>
                    </div>
                    <div class="null"></div>
                </div>
                <div class="null"></div>
                </div>
                </div>
                <!--/div-->
        <div id="footer" class="footermargins" style="background-color:#FFCC00">
            <div class="navbtncontainer">
                <asp:Button runat="server" ID="Button1" Text="Submit" onclick="Button1_Click" />
		    <br />
            </div>
        </div>
    <div id="legal"><p></p></div>
    </div>
    </div>
</form>
<div class="jqmWindow" id="pleasewait"></div>
</asp:Content>

