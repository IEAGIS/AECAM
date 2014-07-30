/***************************
searchFilter.js

Filter search results on SearchResults.aspx page

Filter by county, city or distance from an origin address

******************************/
$(function () {
    $('#FilterCat').change(function () {
        //hide all filter sections
        $('#filterCounty').hide();
        $('#filterCity').hide();
        $('#filterDistance').hide();
        
        //empty the county and city select lists
        $('#ContentPlaceHolder1_DropDownCounty').val('');
        $('#ContentPlaceHolder1_DropDownCity').val('');
        
        //show the requested filter
        filterText = $(this).val(); //requested filter - County, City or State        
        $('#filter' + filterText).show(); //show the requested filter div    
    });
});

function filterSearch(searchArea, searchFilter, geoArea, geoFilter) {
    //alert(currentFilter);
    var searchArea = $('#sA').html();                   //keyword or service
    var searchType = getParameterByName('searchType');  //parent or professional for statics and for SFPF/TIPS search option
    var geoArea = $('#FilterCat').val();                //county or city
    var searchFilter = $('#sV').html();                 //search term
    var county;                                         //county name, because the map is searched by FIPS code

    //if the distance filter is selected make sure there is an origin address
    if (geoArea=='Distance') {
        var sa = setAddress();
        if (!sa) { return false; }

    }
    switch (geoArea) {
        case "County":
            geoFilter = $('#ContentPlaceHolder1_DropDownCounty').val();                 //FIPS code
            county = $("#ContentPlaceHolder1_DropDownCounty option:selected").text();   //county name
            document.location.href = 'SearchResults.aspx?searchType=' + searchType + '&tab=tabs-RES&searchArea=' + searchArea + '&searchFilter=' + searchFilter + '&geoArea=' + geoArea + '&geoFilter=' + geoFilter + '&county=' + county;
            exit;
        case "City":
            geoFilter = $('#ContentPlaceHolder1_DropDownCity').val();                   //city name
            break;
        case "":
            //this shouldn't happen but just in case send the user back to where they came from
            document.location.href = 'SearchResults.aspx?searchType=' + searchType + '&tab=tabs-RES&searchArea=' + searchArea + '&searchFilter=' + searchFilter;
            exit;
    }
    //city and distance use the same url, county and empty exit in switch statement
    document.location.href = 'SearchResults.aspx?searchType=' + searchType + '&tab=tabs-RES&searchArea=' + searchArea + '&searchFilter=' + searchFilter + '&geoArea=' + geoArea + '&geoFilter=' + geoFilter;
}