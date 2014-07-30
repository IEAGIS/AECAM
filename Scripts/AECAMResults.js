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
var tmpArea;

/// <reference path="../Content/social-sm.png" />

function myclick(num) {
    google.maps.event.trigger(markers[num], "click");
}

function onLinkOver(num, link) {
    markers[num].setIcon(limage);
    bkgrndColor = $('#'+link).css('backgroundColor');
    $('#'+link).css('backgroundColor',highlightOn);
}

function onLinkOut(num, link) {
    markers[num].setIcon(simage);
    $('#'+link).css('backgroundColor',bkgrndColor);
}
function bindRows(j, linkid) {
    $('#' + linkid).mouseover(function () {
        //$(this).css('backgroundColor', '#E1EBF4');
        onLinkOver(j, linkid);
    });
    $('#' + linkid).click(function () {
        //alert(j);
        myclick(j);
    });
    $('#' + linkid).mouseout(function () {
        // $(this).css('backgroundColor', '#FFFFFF');
        onLinkOut(j, linkid);
    });
}
function addMarkers(place, address, LONGx, LATy, linkid,j) {

    loc = new google.maps.LatLng(LONGx, LATy);
    //alert(results[1].geometry.location);           
    var marker = new google.maps.Marker({
        map: window.map,
        icon: simage,
        position: window.loc,
        title: place,
        link: linkid
    });

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
        window.location.href = 'AECAMSearchDetail.aspx?searchArea='+ tmpArea + '&currentFilter=' + linkid;
    });
    markers.push(marker);
    window.bounds.extend(new google.maps.LatLng(marker.position.lat(), marker.position.lng()));
    window.map.fitBounds(window.bounds);

}
// Set the infowindow content and display it on marker click.
// Use a 'pin' MVCObject as the order of the domready and marker click events is not garanteed.
/*function openInfoWindow(marker) {
    window.title.innerHTML = marker.getTitle();
    window.pin.set("position", marker.getPosition());
    window.infowindow.open(map, marker);
}*/

function initialize() {
    var tableHeight = $('#ContentPlaceHolder1_ListView1_itemPlaceholderContainer').height();
    if (tableHeight < 350) { tableHeight = 350; }

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
    window.content = document.createElement("DIV");
    window.title = document.createElement("DIV");
    content.appendChild(title);
    var streetview = document.createElement("DIV");
    streetview.style.width = "250px";
    streetview.style.height = "250px";
    window.content.appendChild(streetview);
    window.infowindow = new google.maps.InfoWindow({
        content: window.content
    });

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
    });*/    
    
}
function codeUserAddress() {
    var address = readCookie('DHSaddress');
    var radius = readCookie('DHSradius') * 1609.34; //convert miles to meters
    var radiusTxt = readCookie('DHSradius') == null ? 'Any distance ' : 'approx. ' + readCookie('DHSradius') + ' mile radius ';
    searchRadiusTxt = '<br/>Search Radius: <font style="color:blue">' + radiusTxt + '</font> from <font style="color:blue">' + address + '</font>.';
    if (address != null) {
        $('#myAddress').append(searchRadiusTxt);
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
            //alert(circle);
            /*circle.bindTo('center', marker, 'position');
            var circle = new google.maps.Circle({
                map: window.map,
                radius: 16186.9,
                fillColor: '#efefef',
                fillOpacity: 0.5,
                strokeColor: '#000000',
                strokeWeight: 2
            });*/
            //alert(circle);


            circle.bindTo('center', marker, 'position');
            window.map.fitBounds(circle.bounds);
        } else {
            //alert("Geocode was not successful for the following reason: " + status);
        }
    })
}
$(function () {
    var searchVal;
    var searchArea;
    tmpArea = getParameterByName('searchArea');
    searchVal = getParameterByName('searchFilter');
    tmpCat = getParameterByName('cat');
    returnLink = getParameterByName('tab');
    switch (tmpArea) {
        case "ABC":
            searchArea = "Arkansas Better Chance"
            break;
        case "CCF":
            searchArea = "ChildCare Facilities"
            break;
        case "SNP":
            searchArea = "Special Nutrition Programs"
            break;
        case "HS":
            searchArea = "Head Start Programs"
            break;
        case "BB":
            searchArea = "Better Beginnings Programs"
            break;
    }

    switch (tmpCat) {
        case "zip":
            searchCat = "zip code";           
            break;
        case "city":
            searchCat = "city";
            break;
        case "house":
            searchCat = "house district";
            break;
        case "senate":
            searchCat = "senate district";
            break;
        case "school":
            searchCat = "school district";
            break;
    }

    var a = document.createElement('a');
    a.title = "Return to AECAM Search";
    a.innerHTML = a.title;
    a.href = "AECAMSearch.aspx#" + returnLink;


    headerMsg = '\'<font style="color:red">' + searchArea + '\'</font> ' + searchCat + ' search for <font style="color:red">\'' + searchVal + '\'</font>.&nbsp;&nbsp;' ;
    //document.write(a);
    $('#myAddress').html(headerMsg);
    $('#myAddress').append(a);
    initialize();    
}); 