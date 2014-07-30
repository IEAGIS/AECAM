function createCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    }
    else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name, "", -1);
}
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regexS = "[\\?&]" + name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(window.location.search);
    if (results == null)
        return "";
    else
        return decodeURIComponent(results[1].replace(/\+/g, " "));
}
String.prototype.toProperCase = function () {
    return this.replace(/\w\S*/g, function (txt) { return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase(); });
};

function setAddress() {
    //get the origin address
    if ($('#address').val() == '') {
        alert('Please enter an address');
        $('#address').focus();
        return false;
    }
    var radius = $('input[name=radiusValue]:checked').val();
    createCookie('DHSaddress', $('#address').val(), 10);
    if (radius == 'any') {
        eraseCookie("DHSradius");
    } else {
        createCookie('DHSradius', $('input[name=radiusValue]:checked').val(), 10);
    }

    return true;
}
//geocode the address of origin and store in a cookie
function geocodeAddress(address) {
    var geocoder = new google.maps.Geocoder();
    if (geocoder) {
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                lng = results[0].geometry.location.lng();
                lat = results[0].geometry.location.lat();
                createCookie('MyLat', lat, 10);
                createCookie('MyLong', lng, 10);
            } else {
                result = "Geocode was not successful for the following reason: " + status;
            }
        })
    }
}