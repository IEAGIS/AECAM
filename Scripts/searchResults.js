var map = null;
var geocoder = null;
var place_id = [];
var place_address = [];
var place_name = [];
var LAT = [];
var LONG = [];
var highlightOn = '#ffff00';
var highlightOff = '#ffffff';
var simage = 'Content/images/flag-red2-16x16.png';
var limage = 'Content/images/flag-red2-24x24.png';
var markers = [];
var linkid = "";
var lastlinkid = "";
var loc;
var bkgrndColor;
var bounds;
var title;
var content;
var pin
var infowindow;
var sfpf = [];
var domains = [];
var removeFilter;

sfpf[1] = "Parental Resilience";
sfpf[2] = "Social Connections";
sfpf[3] = "Knowledge of Parent & Child Development";
sfpf[4] = "Concrete Support in Times of Need";
sfpf[5] = "Children's Social & Emotional Development";

domains[1] = "Health and Growth";
domains[2] = "School Readiness";
domains[3] = "Guidance and Discipline";
domains[4] = "Home Environment";
domains[5] = "Supervision";
domains[6] = "Family, Friends, and Community";
domains[7] = "Parenting Styles";
domains[8] = "Domestic Violence";
domains[9] = "Parent Support";
domains[10] = "Family Relationships";
domains[11] = "Substance Abuse";
domains[12] = "Mental Health (parent)"
domains[13] = "Mental Health (child)"

//show hide the filter search options
function showSection(secValue) {
    $(".srchSection").each(function () {
        $(this).hide();
    })
    $("#" + secValue).show();
    if (secValue == "keyword" || secValue == "services") {
        $('#limitSearch').show();
    }
}


function myclick(num) {
    google.maps.event.trigger(markers[num], "click");
}
function onLinkOver(num, link) {
    markers[num].setIcon(limage);
    bkgrndColor = $('#' + link).css('backgroundColor');
    $('#' + link).css('backgroundColor', highlightOn);
}

function onLinkOut(num, link) {
    markers[num].setIcon(simage);
    $('#' + link).css('backgroundColor', bkgrndColor);
}
function bindRows(j, linkid) {
    $('#' + linkid).mouseover(function () {
        onLinkOver(j, linkid);
    });
    $('#' + linkid).click(function () {
        myclick(j);
    });
    $('#' + linkid).mouseout(function () {
        onLinkOut(j, linkid);
    });
}
function addMarkers(place, address, LONGx, LATy, linkid,j) {

    loc = new google.maps.LatLng(LONGx, LATy);         
    var marker = new google.maps.Marker({
        map: window.map,
        icon: simage,
        position: window.loc,
        title: place,
        link: linkid
    });
    markers.push(marker);
    google.maps.event.addListener(marker, 'mouseover', function () {
        this.setIcon(limage);
        onLinkOver(j, linkid);
    });
    google.maps.event.addListener(marker, 'mouseout', function () {
        this.setIcon(simage);
        onLinkOut(j, linkid);       
    });
    google.maps.event.addListener(marker, "click", function () {
        //openInfoWindow(marker);
        window.location.href = 'SearchDetail.aspx?ID=' + linkid;
    });

    window.bounds.extend(new google.maps.LatLng(marker.position.lat(), marker.position.lng()));
    window.map.fitBounds(window.bounds);

}
// Set the infowindow content and display it on marker click.
// Use a 'pin' MVCObject as the order of the domready and marker click events is not garanteed.
function openInfoWindow(marker) {
    window.title.innerHTML = marker.getTitle();
    window.pin.set("position", marker.getPosition());
    window.infowindow.open(map, marker);
}

function initialize() {
    var tableHeight = $('#ContentPlaceHolder1_ListView1_itemPlaceholderContainer').height();
    if(tableHeight < 350){tableHeight=550;}

    $('#map_canvas').height(tableHeight);
    geocoder = new google.maps.Geocoder();
    // Create the map 

    // No need to specify zoom and center as we fit the map further down.
    window.map = new google.maps.Map(document.getElementById("map_canvas"), {
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        streetViewControl: false,
        overviewMapControl: true,
        overviewMapControlOptions: { opened: true }
    });

    // Create the shared infowindow with two DIV placeholders
    // One for a text string, the other for the StreetView panorama.
    /*window.content = document.createElement("DIV");
    window.title = document.createElement("DIV");
    content.appendChild(title);
    var streetview = document.createElement("DIV");
    streetview.style.width = "250px";
    streetview.style.height = "250px";
    window.content.appendChild(streetview);
    window.infowindow = new google.maps.InfoWindow({
        content: window.content
    });*/

    window.bounds = new google.maps.LatLngBounds();

    var i = 0;
    $('.LAT').each(function () {
        //alert($(this).text());
        LAT[i++] = $(this).text();
    });

    i = 0;
    $('.LONG').each(function () {
        LONG[i++] = $(this).text();
    });

    i = 0;
    $('.pin_addresses').each(function () {
        place_address[i++] = $(this).text();
    });

     i = 0;
     $('.pin_names').each(function () {
         place_name[i++] = $(this).text();
     });

     i = 0;
     $('.ids').each(function () {
         place_id[i++] = $(this).text();
     });

    // Create the markers
     for (var j = 0; j < place_name.length; j++) {
         linkid = place_id[j];
         bindRows(j, linkid);
         addMarkers(place_name[j],place_address[j],LONG[j],LAT[j],linkid,j);
     }

     

    // Handle the DOM ready event to create the StreetView panorama
    // as it can only be created once the DIV inside the infowindow is loaded in the DOM.
    var panorama = null;
    window.pin = new google.maps.MVCObject();
    /*google.maps.event.addListenerOnce(infowindow, "domready", function () {
        panorama = new google.maps.StreetViewPanorama(streetview, {
            navigationControl: false,
            enableCloseButton: false,
            addressControl: false,
            linksControl: false,
            visible: true
        });
        panorama.bindTo("position", pin);
    });   */ 
    
}
function codeUserAddress() {
    bounds = new google.maps.LatLngBounds();
    var address = readCookie('DHSaddress');
    var radius = readCookie('DHSradius') * 1609.34; //convert miles to meters
    var radiusTxt = readCookie('DHSradius') == null ? 'Any distance ' : 'approx. ' + readCookie('DHSradius') + ' mile radius ';
    searchRadiusTxt = '<br/>Search Radius: <font style="color:red">' + radiusTxt + '</font> from <font style="color:red">' + address + '</font>.';
    if (address != null) {
        $('#myAddress').append(searchRadiusTxt);
        $('#myAddress').append(removeFilter);
    }
   // $("#myAddress").html(address);
    window.geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            //alert(results[1].geometry.location);
            window.map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: window.map,
                position: results[0].geometry.location,
                title: address
            });
            window.bounds.extend(new google.maps.LatLng(marker.position.lat(), marker.position.lng()));
           // window.map.fitBounds(window.bounds);
            window.map.setCenter(results[0].geometry.location);
            var circle = new google.maps.Circle({
                map: window.map,
                radius: radius,
                fillColor: '#efefef',
                fillOpacity: 0.5,
                strokeColor: '#ff0000',
                strokeWeight: 2
            });

            circle.bindTo('center', marker, 'position');
            window.map.fitBounds(circle.getBounds());
        } else {
            //alert("Geocode was not successful for the following reason: " + status);
        }
    })
}
$(function () {
    var searchArea;
    var searchVal;
    var displayVal;

    $('#FilterCat').val('');

    $("#address").keypress(function (event) {
        if (event.which == 13) { //enter key
            event.preventDefault();
            $('#Button1').click();
        }
    });

    area = getParameterByName('searchArea');
    tempVal = getParameterByName('searchFilter');
    tempType = getParameterByName('searchType');
    tempTab = getParameterByName('tab');
    removeFilter = '  <a href="SearchResults.aspx?searchType=' + tempType + '&tab=' + tempTab + '&searchArea=' + area + '&searchFilter=' + tempVal + '">RemoveFilter</a>';
    switch (area) {
        case "domain":
            searchVal = tempVal; // $('.domainLabel').html();
            displayVal = domains[searchVal];
            searchArea = "Domains";
            break;
        case "sfpf":
            searchVal = tempVal; //$('.sfpfLabel').html();
            displayVal = sfpf[searchVal];
            searchArea = "SFPF";
            break;
        case "service":
            searchVal = tempVal.toProperCase();
            displayVal = searchVal;
            searchArea = area.toProperCase();
            break;
        case "keyword":
            searchVal = tempVal.toProperCase();
            displayVal = searchVal;
            searchArea = area.toProperCase();
            break;
        case "county":
            searchVal = tempVal.toProperCase();
            displayVal = searchVal;
            searchArea = area.toProperCase();
            break;
        default: break;
    }


    //alert($('tr', '#ContentPlaceHolder1_ListView1_itemPlaceholderContainer').size());

    headerMsg = '\'<font style="color:red"><span id=sA>' + area + '</span>\'</font> search for term <font style="color:red">\'<span id=sV style="display:none">' + searchVal + '</span>' + displayVal + '\'</font>.&nbsp;&nbsp;';
    var a = document.createElement('a');
    a.title = "Return to Search";
    a.innerHTML = a.title;
    a.href = "AECAMSearch.aspx#tabs-RES";
    $('#myAddress').html(headerMsg);
    $('#myAddress').append(a);

    $('#searchType').html(tempType);
    $('#tab').html(tempTab);
    initialize();
    if ((window.location.search.indexOf('keyword') != "-1" || window.location.search.indexOf('service') != "-1" || window.location.search.indexOf('sfpf') != "-1" || window.location.search.indexOf('domain') != "-1") && window.location.search.indexOf('Distance') != "-1") {
        codeUserAddress();
    } else {
        if (window.location.search.indexOf('geoArea') != "-1") {
            searchType = getParameterByName('geoArea');
            if (searchType == "County") {
                //searchTerm = getParameterByName('geoFilter');
                searchTerm = getParameterByName('county');
            } else {
                searchTerm = getParameterByName('geoFilter');
            }
            geography = '<br/>Search Area: <font style="color:red"><span id=sT>' + searchType + '</span></font> search for <font style="color:red"><span id=sTe>' + searchTerm + '</span></font>.';
            $('#myAddress').append(geography);
            $('#myAddress').append(removeFilter);
        }
    }

    SearchRadius = readCookie('DHSradius');
    if (SearchRadius == null) {
        SearchRadius = 'any';
    } else {
        $('#' + SearchRadius).attr('checked', true);
    }
    AddressEntered = readCookie('DHSaddress');
    if (AddressEntered != null) {
        $('#address').val(AddressEntered);
    }
    //$("#dialog").dialog({ buttons: { "Ok": function() { $(this).dialog("close"); } } });
});
