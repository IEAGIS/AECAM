<%@ Page Title="" Language="C#" MasterPageFile="~/DHS.master" AutoEventWireup="true" CodeFile="AECAMSearch.aspx.cs" Inherits="AECAMSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Community Resources</title>
    <link href="Content/Css/Themes/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript"src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script src="Scripts/jquery-ui-1.8.21.custom.min.js" type="text/javascript"></script>
    <script src="Scripts/utils.js" type="text/javascript"></script>
    <script src="Scripts/aecamSearch.js" type="text/javascript"></script>
    <script src="Scripts/jquery.maphilight.js" type="text/javascript"></script>
    <script src="Scripts/jquery.scrollTo-1.4.3.1-min.js" type="text/javascript"></script>
    <script type="text/javascript">
       
    </script>
    <style type="text/css">

        body {

	        margin-left: 0px;

	        margin-top: 0px;

	        margin-right: 0px;

	        margin-bottom: 0px;

	        background-color: #f9f9f9;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <map id="_Image-Maps_9201207260941477" name="Image-Maps_9201207260941477">
        <area shape="rect" coords="16,42,148,112" href="#" onclick="submitSearch('sfpf','1');" alt="Parental Resilience" title="Parental Resilience"    />
        <area shape="rect" coords="168,42,300,112" href="#" onclick="submitSearch('sfpf','2');" alt="Social Connections" title="Social Connections"    />
        <area shape="rect" coords="321,42,453,112" href="#" onclick="submitSearch('sfpf','3');" alt="Knowledge of Parent & Child Development" title="Knowledge of Parent & Child Development"    />
        <area shape="rect" coords="475,42,607,112" href="#" onclick="submitSearch('sfpf','4');" alt="Concrete Support in Times of Need" title="Concrete Support in Times of Need"    />
        <area shape="rect" coords="626,42,758,112" href="#" onclick="submitSearch('sfpf','5');" alt="Children's Social & Emotional Development" title="Children's Social & Emotional Development"    />
        <area shape="rect" coords="42,120,119,184" href="#" onclick="submitSearch('domain','12');" alt="Mental Health ~Parent~" title="Mental Health Parent"    />
        <area shape="rect" coords="196,121,273,185" href="#" onclick="submitSearch('domain','6');" alt="Friends, Family, & Community" title="Friends, Family, & Community"    />
        <area shape="rect" coords="347,120,424,184" href="#" onclick="submitSearch('domain','1');" alt="Health & Growth" title="Health & Growth"    />
        <area shape="rect" coords="502,121,579,185" href="#" onclick="submitSearch('domain','9');" alt="Parent Support" title="Parent Support"    />
        <area shape="rect" coords="652,119,732,183" href="#" onclick="submitSearch('domain','6');" alt="Social-Economic Development" title="Social-Economic Development"    />
        <area shape="rect" coords="40,196,120,266" href="#" onclick="submitSearch('domain','11');" alt="Protection from Drug & Alcohol Abuse" title="Protection from Drug & Alcohol Abuse"    />
        <area shape="rect" coords="196,194,277,267" href="#" onclick="submitSearch('domain','10');" alt="Family Relationships" title="Family Relationships"    />
        <area shape="rect" coords="346,194,425,263" href="#" onclick="submitSearch('domain','2');" alt="School Readiness" title="School Readiness"    />
        <area shape="rect" coords="652,194,733,263" href="#" onclick="submitSearch('domain','13');" alt="Mental Health ~Child~" title="Mental Health Child"    />
        <area shape="rect" coords="39,285,120,354" href="#" onclick="submitSearch('domain','8');" alt="Protection from Violence" title="Protection from Violence"    />
        <area shape="rect" coords="342,269,423,338" href="#" onclick="submitSearch('domain','4');" alt="Home Environment" title="Home Environment"    />
        <area shape="rect" coords="651,272,732,341" href="#" onclick="submitSearch('domain','3');" alt="Guidance & Discipline" title="Guidance & Discipline"    />
        <area shape="rect" coords="342,345,423,414" href="#" onclick="submitSearch('domain','5');" alt="Supervision" title="Supervision"    />
        <area shape="rect" coords="651,353,732,422" href="#" onclick="submitSearch('domain','7');" alt="Parenting Styles" title="Parenting Styles"    />
    </map>     
    <map id="Map" name="Map" class="map">
        <area alt="Benton County" href="#benton" coords="75,6,1,4,7,49,23,49,29,42,31,36,58,36,63,32,75,33" shape="poly" />
        <area alt="Carroll County" href="#carroll" coords="76,5,76,25,99,26,113,40,113,50,139,50,139,5" shape="poly" />
        <area alt="Boone County" href="#boone" coords="140,6,140,50,178,50,178,6" shape="poly" />
        <area alt="Marion County" href="#marion" coords="214,6,214,6,210,24,212,28,218,33,220,42,226,45,226,56,186,56,186,50,180,50,179,6" shape="poly" />
        <area alt=" Baxter County" href="#baxter" coords="215,6,211,25,217,32,221,41,227,43,227,68,237,66,236,56,246,56,246,50,244,42,249,41,249,6" shape="poly" />
        <area alt="Fulton County" href="#fulton" coords="250,6,251,34,306,33,307,22,316,22,317,6" shape="poly" />
        <area alt="Sharp County" href="#sharp" coords="318,5,321,5,322,8,325,13,334,18,334,34,328,37,327,75,319,75,294,69,294,65,293,61,297,57,296,34,307,34,308,23,318,22" shape="poly" />
        <area alt="Lawrence County" href="#lawrence" coords="329,75,329,38,334,36,356,49,362,44,387,43,377,61,376,75" shape="poly" />
        <area alt="Randolph County" href="#randolph" coords="322,5,326,12,336,16,335,35,356,47,363,43,382,42,381,28,385,27,386,15,379,14,380,5" shape="poly" />
        <area href="#" coords="379,64" shape="poly" />
        <area alt="Greene County" href="#greene" coords="377,63,422,64,440,37,429,36,428,31,383,30,383,42,388,43" shape="poly" />
        <area alt="Clay County" href="#clay" coords="382,5,381,14,387,15,386,29,430,30,430,34,440,36,450,30,452,19,445,2" shape="poly" />
        <area alt="Washington County" href="#washington" coords="7,49,23,49,33,36,60,36,63,33,72,34,67,84,70,89,48,87,14,87" shape="poly" />
        <area alt="Madison County" href="#madison" coords="76,26,73,34,68,83,72,89,116,89,120,75,124,63,122,51,113,50,111,39,99,27" shape="poly" />
        <area alt="Newton County" href="#newton" coords="117,88,117,96,173,96,173,50,123,50,125,62" shape="poly" />
        <area alt="Searcy County" href="#searcy" coords="173,51,185,51,185,57,225,56,226,88,205,88,204,96,174,96" shape="poly" />
        <area alt="Stone County" href="#stone" coords="227,69,226,97,285,98,279,92,281,78,264,73,254,71,259,60,252,51,246,53,246,56,237,56,237,67" shape="poly" />
        <area alt="Izard County" href="#izard" coords="250,33,250,39,246,41,248,51,252,50,261,59,255,70,285,77,293,68,293,59,297,55,297,34" shape="poly" />
        <area alt="Independence County" href="#independence" coords="278,91,282,77,288,77,293,69,316,76,344,75,335,88,332,101,329,103,328,118,288,118,286,99" shape="poly" />
        <area alt="Crawford County" href="#crawford" coords="14,88,49,87,73,91,67,95,66,100,57,103,57,111,61,112,57,126,45,130,38,144,32,143,26,132,21,134" shape="poly" />
        <area alt="Franklin County" href="#franklin" coords="74,89,91,89,92,134,87,133,81,131,81,140,70,141,70,151,56,155,56,128,64,112,59,111,59,103,67,102,68,96" shape="poly" />
        <area alt="Johnson County" href="#johnson" coords="93,89,117,89,117,96,154,95,154,111,148,111,148,126,141,124,140,143,131,142,126,132,108,136,93,133" shape="poly" />
        <area alt="Pope County" href="#pope" coords="155,97,156,112,149,113,149,128,143,126,142,142,143,153,148,148,168,168,184,162,184,116,187,116,188,97" shape="poly" />
        <area alt="Van Buren County" href="#vanburen" coords="185,127,185,117,189,117,189,96,205,96,207,89,225,89,225,99,240,99,240,137,221,137,219,127" shape="poly" />
        <area alt="Sebastian County" href="#sebastian" coords="21,137,26,133,33,145,39,144,45,131,56,127,55,157,47,165,40,168,38,182,29,185,24,180,17,186" shape="poly" />
        <area alt="Logan County" href="#logan" coords="47,165,49,172,59,171,59,176,91,174,91,162,117,163,125,155,143,154,141,144,131,144,126,132,109,138,93,134,81,133,81,141,71,141,72,151,56,155" shape="poly" />
        <area alt="Conway County" href="#conway" coords="167,172,169,169,185,162,185,128,219,128,219,148,217,154,216,159,220,163,217,171" shape="poly" />
        <area alt="Faulkner County" href="#faulkner" coords="220,138,221,149,217,158,222,163,211,182,222,191,222,200,230,190,245,190,247,181,258,180,255,139" shape="poly" />
        <area alt="Cleburne County" href="#cleburne" coords="240,137,241,98,285,98,287,128,282,130,280,139" shape="poly" />
        <area alt="Craighead County" href="#craighead" coords="379,64,423,65,427,61,433,61,433,96,362,97,361,76,378,76" shape="poly" />
        <area alt="Jackson County" href="#jackson" coords="345,77,361,75,361,140,341,140,340,128,308,128,309,119,330,119,331,102,337,87" shape="poly" />
        <area alt="Yell County" href="#yell" coords="93,163,91,211,129,213,131,209,142,210,140,199,165,173,166,168,146,149,143,156,126,156,117,164" shape="poly" />
        <area alt="Scott County" href="#scott" coords="91,174,92,212,77,214,77,219,71,220,67,215,30,214,32,210,17,210,16,187,25,181,27,186,38,183,40,169,48,166,49,172,58,172,62,176" shape="poly" />
        <area alt="Polk County" href="#polk" coords="67,215,66,255,36,255,38,273,14,273,16,211,29,211,29,216" shape="poly" />
        <area alt="Montgomery County" href="#montgomery" coords="68,221,68,255,130,256,130,214,93,213,79,215,78,220" shape="poly" />
        <area alt="Garland County" href="#garland" coords="130,211,147,209,174,210,177,227,183,226,182,231,191,231,189,236,193,236,193,241,182,241,181,247,177,248,177,255,131,254" shape="poly" />
        <area alt="Saline County" href="#saline" coords="163,199,164,209,175,209,177,225,184,225,184,230,191,230,192,234,193,240,199,241,198,244,203,246,202,250,208,252,214,246,229,247,231,243,246,241,245,232,236,231,234,227,227,225,226,220,216,219,214,211,205,211,205,201,197,199,194,206,189,203,187,198" shape="poly" />
        <area alt="Perry County" href="#perry" coords="144,208,161,209,163,198,188,198,191,203,193,204,196,200,194,192,204,192,205,188,217,190,212,184,215,172,166,173,141,199" shape="poly" />
        <area alt="Pulaski County" href="#pulaski" coords="196,193,195,198,204,199,206,209,214,210,216,218,227,219,227,224,236,230,244,231,247,241,266,242,266,227,257,226,261,218,261,181,249,181,247,181,244,191,231,190,222,200,222,191,215,185,216,191,207,189,202,193" shape="poly" />
        <area alt="Sevier County" href="#sevier" coords="13,274,52,275,53,306,63,318,64,324,58,324,54,322,48,322,40,318,35,318,20,303,14,303" shape="poly" />
        <area alt="Howard County" href="#howard" coords="38,256,38,274,52,273,54,304,62,315,65,322,76,322,78,276,71,275,70,256" shape="poly" />
        <area alt="Pike County" href="#pike" coords="71,255,72,274,79,274,78,295,88,295,120,307,124,304,132,306,132,298,128,296,125,276,119,275,124,268,123,269,127,256" shape="poly" />
        <area alt="Clark County" href="#clark" coords="127,258,126,270,121,273,120,275,127,277,129,295,134,300,133,307,140,310,143,319,157,324,158,329,164,326,167,328,175,324,182,321,176,303,179,301,181,284,169,282,166,274,143,267,134,268,134,260" shape="poly" />
        <area alt="Hot Spring County" href="#hotspring" coords="132,254,131,257,135,260,136,267,141,266,168,273,169,281,181,283,202,283,203,252,200,246,197,242,184,241,178,247,178,255" shape="poly" />
        <area alt="Dallas County" href="#dallas" coords="183,284,180,302,178,304,184,321,236,324,236,318,230,314,231,307,224,302,223,295,234,293,231,287,223,285" shape="poly" />
        <area alt="Little River County" href="#littleriver" coords="13,304,12,337,17,349,29,350,55,350,70,344,78,340,67,335,66,324,55,324,43,320,34,319,19,304" shape="poly" />
        <area alt="Hempstead County" href="#hempstead" coords="66,324,68,334,80,339,85,351,90,359,122,360,123,307,120,309,88,295,78,295,77,321" shape="poly" />
        <area alt="Nevada County" href="#nevada" coords="123,304,138,310,142,319,158,325,161,332,160,362,152,367,148,368,124,366" shape="poly" />
        <area alt="Ouachita County" href="#ouachita" coords="162,328,160,372,191,372,200,371,208,373,212,374,217,373,212,368,199,365,197,357,200,350,199,341,210,338,213,324,184,322" shape="poly" />
        <area alt="Miller County" href="#miller" coords="56,350,56,414,80,414,80,406,76,401,89,391,93,373,89,360,79,341" shape="poly" />
        <area alt="Lafayette County" href="#lafayette" coords="91,360,94,374,88,392,78,401,81,405,81,414,125,415,126,389,131,386,134,368,124,367,122,360" shape="poly" />
        <area alt="Columbia County" href="#columbia" coords="136,368,131,387,127,391,126,414,173,414,173,372,160,373,159,364,147,369" shape="poly" />
        <area alt="Union County" href="#union" coords="175,373,174,414,264,415,263,407,259,404,262,399,255,390,249,393,247,386,239,386,235,383,230,386,225,385,225,380,220,382,219,376,216,374,200,372" shape="poly" />
        <area alt="Ashley County" href="#ashley" coords="262,392,260,397,262,398,259,404,264,407,266,415,325,416,326,370,276,369,279,373,275,385" shape="poly" />
        <area alt="Bradley County" href="#bradley" coords="245,335,240,367,232,376,238,384,248,385,250,390,258,390,260,395,262,391,274,384,277,372,271,364,273,354,273,335" shape="poly" />
        <area alt="Calhoun County" href="#calhoun" coords="236,326,243,335,240,366,230,375,234,381,230,385,227,384,227,379,222,380,214,368,201,364,199,357,201,352,201,342,210,339,214,323" shape="poly" />
        <area alt="Drew County" href="#drew" coords="274,326,274,358,272,364,279,370,326,370,325,326" shape="poly" />
        <area alt="Cleveland County" href="#cleveland" coords="224,296,226,301,232,306,232,315,238,318,237,326,242,334,272,334,273,302,276,293,236,294" shape="poly" />
        <area alt="Desha County" href="#desha" coords="327,350,338,349,340,356,347,360,355,348,367,338,371,305,382,289,374,285,358,286,350,290,357,309,350,305,336,306,337,300,332,302,328,300,324,300,321,305,316,303,314,324,326,324" shape="poly" />
        <area alt="Lincoln County" href="#lincoln" coords="274,326,314,325,316,303,322,304,326,299,331,300,330,296,322,287,319,285,312,283,304,279,299,277,297,282,299,296,296,290,278,292,275,303" shape="poly" />
        <area alt="Grant County" href="#grant" coords="204,254,204,285,223,283,232,287,235,293,247,293,248,274,249,242,234,243,228,248,215,248" shape="poly" />
        <area alt="Jefferson County" href="#jefferson" coords="251,241,248,293,276,291,297,289,296,280,302,277,306,283,315,281,317,287,327,288,323,280,319,280,318,271,301,273,300,242" shape="poly" />
        <area alt="Arkansas County" href="#arkansas" coords="300,242,309,242,309,231,338,232,342,237,342,241,346,243,346,247,352,249,355,254,361,258,364,262,363,265,361,267,364,273,362,284,351,290,356,306,339,305,339,299,332,301,331,295,323,289,331,288,325,283,325,278,319,278,320,270,302,272" shape="poly" />
        <area alt="Lonoke County" href="#lonoke" coords="259,175,259,180,263,181,261,220,260,226,267,228,266,241,301,241,307,235,305,230,306,222,298,219,299,191,288,191,287,179,276,179,266,174" shape="poly" />
        <area alt="White County" href="#white" coords="257,139,259,175,266,173,275,178,288,179,302,173,304,180,309,178,309,169,322,170,322,159,329,158,327,148,322,147,322,142,328,133,328,128,308,129,307,119,287,119,288,129,283,130,282,140" shape="poly" />
        <area alt="Prarie County" href="#prarie" coords="288,181,288,189,300,191,299,217,307,221,307,225,304,233,301,241,309,240,308,231,330,231,327,228,321,228,324,222,330,220,328,200,333,195,330,194,332,176,320,178,321,172,310,170,310,179,306,182,302,173,291,179" shape="poly" />
        <area alt="Woodruff County" href="#woodruff" coords="328,130,340,128,340,141,361,140,361,181,344,180,342,185,339,184,337,194,332,192,333,176,322,177,323,161,330,159,328,149,323,146,324,143" shape="poly" />
        <area alt="Monroe County" href="#monroe" coords="333,195,331,199,328,204,332,218,325,223,323,226,331,231,337,232,342,237,342,241,348,243,347,247,353,250,355,254,362,259,368,259,367,244,363,242,364,211,354,209,356,197,355,193,352,189,349,189,351,181,344,181,344,186,339,187,338,193" shape="poly" />
        <area alt="Phillips County" href="#phillips" coords="362,257,365,262,363,268,363,272,363,285,376,283,383,287,413,248,418,230,410,221,364,220,363,240,369,242,369,258" shape="poly" />
        <area alt="Lee County" href="#lee" coords="356,192,355,211,364,211,365,221,411,221,419,228,424,203,424,191" shape="poly" />
        <area alt="St. Francis County" href="#stfrancis" coords="424,162,425,191,361,191,352,191,350,183,363,182,362,161" shape="poly" />
        <area href="#poinsett" coords="362,97,363,128,431,126,432,98" shape="poly" />
        <area alt="Cross County" href="#cross" coords="361,127,363,161,412,160,413,127" shape="poly" />
        <area alt="Crittenden County" href="#crittenden" coords="413,127,412,162,425,162,424,201,444,187,456,162,459,131,445,127" shape="poly" />
        <area alt="Mississippi County" href="#mississippi" coords="435,61,433,126,448,126,461,130,473,118,475,101,493,78,497,69,489,60" shape="poly" />
        <area alt="Chicot County" href="#chicot" coords="327,351,327,416,356,415,362,410,367,400,368,387,367,368,360,359,352,354,346,360,340,356,338,350" shape="poly" />
    </map>
    <h2>Search AECAM Data</h2>
    <div class="demo" style="height:auto">
        <div style="float:right; position:relative; top:-50px; z-index:500"><img alt="hands" class="outline" src="Content/images/Hand_Banner.png" /></div>
        <div style="padding-top: 1em;padding-right: 1.4em;padding-bottom: 1em;padding-left: 1.4em;">
            <label for="address">Show driving directions from My Address: </label><br /><input type="text" size="60" id="address" name="address" />
            <button onclick="geocodeAddress($('#address').val());setAddress();return false;">Set Address</button><br />
            <br />(Ex. 2801 S University, Little Rock, AR 72204)<br /><br />

            <font style="color:Gray; font-size:smaller" >Note: The address you provide is not recorded, it will only be used to provide distance related information.</font>                        
            <br /><br /><br />
        </div>
        <div>
            <!--ul class="tabs clearfix">
	            <li><a href="#tabs-ABC">Arkansas Better Chance</a></li>
	            <li><a href="#tabs-CCF">Child Care Facilities</a></li>
	            <li><a href="#tabs-SNP">Special Nutrition Programs</a></li>
                <li><a href="#tabs-HS">Head Start Facilities</a></li>
                <li><a href="#tabs-BB">Better Beginnings</a></li>
                <li><a href="#tabs-RES">Resources</a></li>
            </ul -->
	        <!--div id="tabs-ABC">
                <strong>The Arkansas Better Chance program is funded through an appropriation in the Arkansas Department of Education (ADE) Public School Fund budget. ADE contracts with the DHS Division of Child Care and Early Childhood Education to administer the program. The Division is responsible for all operational duties associated with ABC. The State Board of Education is the final authority for approval of rules and grants. The Division gives regular reports and updates to the State Board of Education, as well as an annual report to the Joint Legislative Committee on Education.</strong>
                <br /><br />
                <fieldset>
                <legend>Find Arkansas Better Chance Facilities</legend>
		        <p>
                    <strong>Search By:</strong> <select id="ABCsearchCat" class='searchParam'>
                        <option value="zip">Zip Code</option>
                        <option value="city">City</option>
                        <option value="house">House District</option>
                        <option value="senate">Senate District</option>
                        <option value="school">School District</option>
                    </select>&nbsp;&nbsp; 
                    <span class="ui-widget" style="height:100px" id="keyword"><input type="text" id="ABCsearchVal" name="ABCsearchVal"/>
                    &nbsp;&nbsp;<button id="ABC" onclick="processSearch(this.id,ABCsearchCat.value);return false;">Search</button></span>
                </p>      
                </fieldset>                 
                <p>
                    <br /><strong>Source:</strong> Arkansas Department of Human Services
                </p>
                    <hr /> 
                    <p><strong>Other Arkansas Better Chance Resources</strong>
                    <ul>
                        <li><a target="_new" href='http://humanservices.arkansas.gov/dccece/Pages/ArkansasBetterChance.aspx'>Arkansas Better Chance Program</a></li>
                    </ul>
                </p>   
	        </div>
	        <div id="tabs-CCF">  
                <strong>With 1,979 preschools and child development centers operating in the state of Arkansas, the right daycare option is waiting for you. Whether you prefer a larger preschool with an innovative early childhood curriculum or the cozy personalization of smaller daycare centers, there are Arkansas childcare centers to fit every preference and budget. Check out the Quick Search box below in order to search for childcare providers by zip code, city, house district, senate district or school district. You will be able to access information about scores of different childcare providers in your area, complete with a street map and driving directions to the providers' location. </strong>                        
		        <br /><br />
                <fieldset>
                <legend>Find Child Care Facilities</legend>
                <p>
                    <strong>Search By:</strong> <select id="CCFsearchCat" class='searchParam'>
                        <option value="zip">Zip Code</option>
                        <option value="city">City</option>
                        <option value="house">House District</option>
                        <option value="senate">Senate District</option>
                        <option value="school">School District</option>
                    </select>&nbsp;&nbsp; <input type="text" id="CCFsearchVal" name="CCFsearchVal" />
                    &nbsp;&nbsp;<button id="CCF" onclick="processSearch(this.id,CCFsearchCat.value);return false;">Search</button>
                </p>
                </fieldset>
                <!--center>
                    <p><iframe id="DHS" width="850px" scrolling="yes" height="770px" frameborder="0" style="border:0px #FFFFFF none;" src="https://dhs.arkansas.gov/dccece/cclas/FacilitySearch.aspx" name="DHS" marginwidth="0px" marginheight="0px">
                        </iframe>
                    </p> 
                </center--> 
                <!--p>
                    <br /><strong>Source:</strong> Arkansas Department of Human Services
                </p>                        
                <hr />
                <p><strong>Other Child Care Facilities Resources</strong>
                    <ul>
                        <li><a target="_new" href='https://dhs.arkansas.gov/dccece/cclas/FacilitySearch.aspx'>Better Beginnings site for Child Care Facilities</a></li>
                    </ul>
                </p>
	        </div>
	        <div id="tabs-SNP">
                <strong>The Special Nutrition Programs (SNP) provide reimbursement for well-balanced, nutritious meals served to individuals enrolled in the Child Care Food Program (CACFP), National School Lunch Program (NSLP), Special Milk Program (SMP), and the Summer Food Service Program (SFSP).  For additional information about a specific program, please use the links to the left.  In Arkansas these programs are administered by the Arkansas Department of Human Services, Division of Child Care and Early Childhood Education, Special Nutrition Programs.</strong>
		        <br /><br />
                <fieldset>
                <legend>Find Special Nutrition Programs</legend>
                    <p>
                        <strong>Search By:</strong> <select id="SNPsearchCat" class='searchParam'>
                            <option value="zip">Zip Code</option>
                            <option value="city">City</option>
                            <option value="house">House District</option>
                            <option value="senate">Senate District</option>
                            <option value="school">School District</option>
                        </select>&nbsp;&nbsp; <input type="text" id="SNPsearchVal" name="SNPsearchVal" />
                        &nbsp;&nbsp;<button id="SNP" onclick="processSearch(this.id,SNPsearchCat.value);return false;">Search</button>
                    </p> 
                </fieldset>
                <p>
                    <br /><strong>Source:</strong> Arkansas Department of Human Services
                </p>  
                                        <hr />                       
                <p><strong>Other Special Nutrition Program Resources</strong>
                    <ul>
                        <li>
                            <a target="_blank" href="https://dhs.arkansas.gov/dccece/snp/WelcomeSNPM.aspx">Arkansas Special Nutrition Program</a>
                        </li>
                    </ul>
                </p>                          
	        </div>
	        <div id="tabs-HS">
                <strong>The Arkansas Head Start Association promotes a high quality, comprehensive child development program for economically deprived children birth to 5 years of age, thus ensuring school and life successes. The Arkansas Head Start Association fosters an approach to program development utilizing broad-based linkages and community partnerships involving public, private and corporate sectors.</strong>
		        <br /><br />
                <fieldset>
                <legend>Find Arkansas Head Start Programs</legend>
                    <p>
                        <strong>Search By:</strong> <select id="HSsearchCat" class='searchParam'>
                            <option value="zip">Zip Code</option>
                            <option value="city">City</option>
                            <option value="house">House District</option>
                            <option value="senate">Senate District</option>
                            <option value="school">School District</option>
                        </select>&nbsp;&nbsp; <input type="text" id="HSsearchVal" name="HSsearchVal" />                            
                        &nbsp;&nbsp;<button id="HS" onclick="processSearch(this.id,HSsearchCat.value);return false;">Search</button>
                    </p> 
                </fieldset>                       
                <p>
                    <br /><strong>Source:</strong> Arkansas Department of Human Services
                </p> 
                <hr />
                <p><strong>Other Head Start Facilities Resources</strong>
                    <ul>
                        <li><a target="_new" href='http://arheadstart.org/index.php?option=com_weblinks&view=category&id=155'>Arkansas Head Start Association</a></li>
                    </ul>
                </p>                           
	        </div>
            <div id="tabs-BB">
                <strong>High quality child care and early childhood education sets the stage for how well our children learn, how they think of themselves and how they interact with their world. We as parents, child care providers, educators and citizens have a responsibility to make sure all of our children have the very best experiences they can. Better Beginnings, Arkansas’s Quality Rating Improvement System, has been developed to do just that. - See more at: http://www.arbetterbeginnings.com/#sthash.yR9dD2Vl.dpuf</strong>
		        <br /><br />
                <fieldset>
                <legend>Find Better Beginnings Programs</legend>
                    <p>
                        <strong>Search By:</strong> <select id="BBsearchCat" class='searchParam'>
                            <option value="zip">Zip Code</option>
                            <option value="city">City</option>
                            <option value="house">House District</option>
                            <option value="senate">Senate District</option>
                            <option value="school">School District</option>
                        </select>&nbsp;&nbsp; <input type="text" id="BBsearchVal" name="BBsearchVal" />                            
                        &nbsp;&nbsp;<button id="BB" onclick="processSearch(this.id,BBsearchCat.value);return false;">Search</button>
                    </p> 
                </fieldset>                       
                <p>
                    <br /><strong>Source:</strong> Arkansas Department of Human Services
                </p> 
                <hr />
                <p><strong>Other Better Beginnings Resources</strong>
                    <ul>
                        <li><a target="_new" href='http://www.arbetterbeginnings.com/'>Arkansas Better Beginnings</a></li>
                    </ul>
                </p>                           
	        </div -->
            <div id="tabs-RES">                
                <p><strong>Search Tips</strong></p>
                <ul>
                    <li>Typing food bank will result in hits on records that contain either food or bank or both.</li>
                    <li>Typing "food bank" using quotes around the text will only result in hits on records that contain the exact phrase (both words separated by a space).</li>
                    <li>Searches for phone numbers will also need to use quotes around the number being search.</li>                        
                </ul>                             
                <span style="padding-top: 1em;padding-right: 1.4em;padding-bottom: 1em;padding-left: 1.4em;">                        
                <table border="0" width="100%">
                    <tr>
                    <td><strong>Search As:</strong></td>
                    <td colspan="3">                                
                        <br /><br /><input id="radpar" type="radio"  name="profparent" checked="checked" value="parent"/>Parent
                        <input id="radpro" type="radio"  name="profparent" value="professional"/>Professional<br /><br />
                        <hr />
                    </td>
                    </tr>                       
                    <tr>
                        <td width="10%" style="vertical-align:top; padding-top: 20px;">
                            <strong>Search By:</strong>
                        </td>   
                        <td width="20%" style="padding-top: 20px;" valign="top">
                            <div>
                                <select id="AllSearchCat" class='allProvSearch'>
                                    <option value="kwSearch">Keyword</option>
                                    <option value="serviceSearch">Service</option>                                                                        
                                </select>
                            </div>
                        </td>
                        <td>
                            <div id="Div1" class="srchSectio" style="display:block;padding-top: 20px;">
                                <input type="text" size="60" id="AllSearchVal" name="HSsearchVal"/>                                      
                                &nbsp;&nbsp;<button id="All" onclick="if($('#AllSearchVal').val()==''){alert('Please enter a search term'); return false;}submitSearch($('#AllSearchCat').children('option:selected').text().toLowerCase(),$('#AllSearchVal').val());return false;">Search</button>
                            </div>
                            <div id="sfpf" style="display:none;padding-top: 20px;">
                                    <img alt="SFPF - Domain Map" class="sfpf" border="0" src="Content/images/TIPS2.png" usemap="#Image-Maps_9201207260941477"/>
                            </div>
                        </td>                                
                    </tr>                            
                    <tr><td colspan=3><br /><br />
                    <strong>Source:</strong> UAMS Family and Preventive Medicine / TIPS for Great Kids Program 
                    <hr />
                    <p><strong>Other Child Care Facilities Resources</strong>
                    <ul>
                        <li><a target="_new" href='http://reachoutandreadarkansas.org/'>Reach Out and Read Arkansas</a></li>
                        <li><a target="_new" href='http://www.arkansased.org/contact-us/education-service-cooperatives'>Education Service Cooperatives</a></li>
                        <li><a target="_new" href='http://humanservices.arkansas.gov/ddds/Pages/FirstConnectionsProgram.aspx'>First Connections - Arkansas Infant and Toddler Program</a></li>
                    </ul>
                    </p></td></tr>                            
                    </table>
            </div>                                                                   
        </div>
    </div>
</asp:Content>

