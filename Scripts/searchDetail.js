//var map = null;
//var geocoder = null;
var origin;
var limage = 'Content/images/flag-red2-24x24.png';

function codeAddress() {
    //geocoder = new google.maps.Geocoder();
   // var address = readCookie('DHSaddress');
    //var LAT = $('.lat').html();
    //var LONG = $('.long').html();
    //var LAT = '<%= getLat() %>';
    //var LONG = '<%= getLon() %>';
    //alert(LAT);
    //alert(LONG);
    var latlng = new google.maps.LatLng(34.687428, -92.230225);
    var options = { zoom: 15, center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        overviewMapControl: true,
        overviewMapControlOptions: { opened: true }
    };
    window.origin = readCookie('DHSaddress');
    //dd
    //alert(origin);
    if (window.origin != null) {
        var directionsService = new google.maps.DirectionsService();
        var directionsDisplay = new google.maps.DirectionsRenderer();

        window.map = new google.maps.Map(document.getElementById
			    ("map_canvas"), options);


        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('panel'));

        var loc = new google.maps.LatLng(LONG, LAT);

        var request = {
            origin: window.origin,
            destination: loc,
            travelMode: google.maps.DirectionsTravelMode.DRIVING
        };

        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
        });
    } else {
        window.map = new google.maps.Map(document.getElementById
			    ("map_canvas"), options);
        // Create the shared infowindow with two DIV placeholders
        // One for a text string, the other for the StreetView panorama.
        var content = document.createElement("DIV");
        var title = document.createElement("DIV");
        content.appendChild(title);
        var streetview = document.createElement("DIV");
        streetview.style.width = "250px";
        streetview.style.height = "250px";
        content.appendChild(streetview);
        var infowindow = new google.maps.InfoWindow({
            content: content
        });

        var loc = new google.maps.LatLng(LONG, LAT);
        //alert(title);


        map.setCenter(loc);
        var marker = new google.maps.Marker({
            map: map,
            position: loc,
            title: $('.street_address').html(),
            icon: limage
        });
    }
    /*  var circle = new google.maps.Circle({
    map: map,
    radius: 280,
    fillColor: '#efefef',
    fillOpacity: 0.5,
    strokeColor: '#ff0000',
    strokeWeight: 2
    });
    //alert(circle);
    circle.bindTo('center', marker, 'position');*/


   /* google.maps.event.addListener(marker, "click", function () {
        openInfoWindow(marker);
    });*/
    // Handle the DOM ready event to create the StreetView panorama
    // as it can only be created once the DIV inside the infowindow is loaded in the DOM.
   /* var panorama = null;
    var pin = new google.maps.MVCObject();
    google.maps.event.addListenerOnce(infowindow, "domready", function () {
        panorama = new google.maps.StreetViewPanorama(streetview, {
            navigationControl: false,
            enableCloseButton: false,
            addressControl: false,
            linksControl: false,
            visible: true
        });
        panorama.bindTo("position", pin);
    });*/


    // Set the infowindow content and display it on marker click.
    // Use a 'pin' MVCObject as the order of the domready and marker click events is not garanteed.
    /*function openInfoWindow(marker) {
        title.innerHTML = marker.getTitle();
        pin.set("position", marker.getPosition());
        infowindow.open(map, marker);
    }*/


}

function codeUserAddress() {
    // var window.map;
    geocoder = new google.maps.Geocoder();
    address = "2001 S Summit St, Little Rock, AR 72202";
    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            //alert(results[1].geometry.location);
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: window.map,
                position: results[0].geometry.location,
                title: address
            });
            var circle = new google.maps.Circle({
                map: window.map,
                radius: 280,
                fillColor: '#efefef',
                fillOpacity: 0.5,
                strokeColor: '#ff0000',
                strokeWeight: 2
            });
            //alert(circle);
            circle.bindTo('center', marker, 'position');
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    })


}
$(function () {

    codeAddress();
    if(window.origin !=  null)
        $('#panel').dialog({ position: {
            my: 'top left',
            at: 'right',
            of: $('#map_canvas'),
            offset: "150 -50",
            collision: "fit"
        }, resizable: true, height: 650
    });
    $(".ui-icon").removeClass();     

}); 