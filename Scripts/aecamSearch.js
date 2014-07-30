
$(function () {
    //$('#search_spin').hide();
    $('#geo').hide();
    $('#ContentPlaceHolder1_DropDownCounty').val('');
    $('#filterCounty').hide();
    $('#filterCity').hide();
    $('#filterDistance').hide();
    $('.FilterCat').hide();

    //basically used to reset form if user clicks browser 'back' button instead of supplied link on page
    $('#radpar').attr('checked', 'checked');
    $('#AllSearchCat').val('kwSearch');

    //show / hide the proper sections when the user chooses search criterea
    $('#FilterCat').change(function () {
        $('#filterCounty').hide();
        $('#filterCity').hide();
        $('#filterDistance').hide();
        $('#filterResults').hide();
        $('#filterCount').html('');
        $('#ContentPlaceHolder1_DropDownCounty').val('');
        $('#ContentPlaceHolder1_DropDownCity').val('');
        if ($(this).val() == 'County') {
            $('#filterCounty').show();
        } else if ($(this).val() == 'City') {
            $('#filterCity').show();
        } else if ($(this).val() == 'Distance') {
            $('#filterDistance').show();
        }
    });
    $("#AllSearchVal").keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
            $('#All').click();
        }
    });

    $("#ABCsearchVal").keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
            $('#ABC').click();
        }
    });
    $("#CCFsearchVal").keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
            $('#CCF').click();
        }
    });
    $("#SNPsearchVal").keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
            $('#SNP').click();
        }
    });
    $("#HSsearchVal").keypress(function (event) {
        if (event.which == 13) {
            event.preventDefault();
            $('#HS').click();
        }
    });

    $('.searchParam').change(function () {
        //alert($(this).find(':input').val());
        var inputEl = $(this).parent().find(':input');
        if ($(this).val() == 'school') {
            inputEl.attr('class', 'schoolSearch');
        } else if ($(this).val() == 'city') {
            inputEl.attr('class', 'citySearch');
        } else {
            inputEl.removeClass();
            inputEl.unbind(autocomplete);
        }
    });

    //remove the 'SFPF' option if the user self identifies as a 'parent'
    $('#radpar').change(function () {
        $("#AllSearchCat").find("option[value='SFPF']").remove();
        $('#Div1').show();
        $("#sfpf").hide();
        $('.allProvSearch').change();
    });

    //add the 'SFPF' option if the user self identifies as a 'professional'
    $('#radpro').change(function () {
        $('#AllSearchCat').append('<option value="SFPF">SFPF/TIPS</option>');
    });

    //show the sfpf map if the user selects 'SFPF' search
    $('#AllSearchCat').change(function () {
        if ($(this).val() == 'SFPF') {
            $('#Div1').hide();
            $("#sfpf").show();
        } else {
            $('#Div1').show();
            $("#sfpf").hide();
        }
    });

    //give the user type ahead search capability depending on the type of search
    $('.allProvSearch').change(function () {
        $('.FilterCat').show();
        var inputEl = $('#AllSearchVal');
        inputEl.val('');
        if ($(this).val() == 'nameSearch') {
            inputEl.attr('class', 'nameSearch');
        } else if ($(this).val() == 'serviceSearch') {
            inputEl.attr('class', 'serviceSearch');
        } else if ($(this).val() == 'kwSearch') {
            inputEl.attr('class', 'kwSearch');
        } else {
            inputEl.removeClass();
        }
        $('#ContentPlaceHolder1_DropDownCounty').val('');
        $('#FilterCat').val('');
        $('.FilterCat').hide();
        $('#filterCounty').hide();
        $('#filterCity').hide();
        $('#filterDistance').hide();
        $('#filterResults').hide();
        $('#mainResults').hide();
        //$('#resultCount').hide();
        //$('#filterCount').hide();
    });
    //keyword search
    $(".kwSearch").live('focus', function () {
        $(this).autocomplete({
            source: function (request, response) {
                var partial = request.term;
                $.ajax({
                    url: 'WebService.asmx/keywordLookup',
                    data: "{ 'partial': '" + partial + "' }",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item,
                                value: item
                            }
                        }))
                    }
                });
            },
            minLength: 1
        })
    });

    //service search
    $(".serviceSearch").live('focus', function () {
        $(this).autocomplete({
            source: function (request, response) {
                var partial = request.term;
                $.ajax({
                    url: 'WebService.asmx/serviceLookup',
                    data: "{ 'partial': '" + partial + "' }",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item,
                                value: item
                            }
                        }))
                    }
                });
            },
            minLength: 1
        })
    });
    //name search
    $(".nameSearch").live('focus', function () {
        $(this).autocomplete({
            source: function (request, response) {
                var partial = request.term;
                $.ajax({
                    url: 'WebService.asmx/nameLookup',
                    data: "{ 'partial': '" + partial + "' }",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item,
                                value: item
                            }
                        }))
                    }
                });
            },
            minLength: 1
        })
    });
    //school search
    $(".schoolSearch").live('focus', function () {
        $(this).autocomplete({
            source: function (request, response) {
                var partial = request.term;
                $.ajax({
                    url: 'WebService.asmx/schoolLookup',
                    data: "{ 'partial': '" + partial + "' }",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item,
                                value: item
                            }
                        }))
                    }
                });
            },
            minLength: 1
        })
    });
    //city search
    $(".citySearch").live('focus', function () {
        $(this).autocomplete({
            source: function (request, response) {
                var partial = request.term;
                $.ajax({
                    url: 'WebService.asmx/cityLookup',
                    data: "{ 'partial': '" + partial + "' }",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataFilter: function (data) { return data; },
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item,
                                value: item
                            }
                        }))
                    }
                });
            },
            minLength: 1
        })
    });

    AddressEntered = readCookie('DHSaddress');
    if (AddressEntered != null) {
        $('#address').val(AddressEntered);
    }

    //initialize provider search lookup
    $('.allProvSearch').change();
    //initialize tabs
    $(".tab-set").tabs();
    $("#ABCsearchVal").focus();

    $("a[href$='#tabs-RES']").click(function () { $("#AllSearchVal").focus(); });
    $("a[href$='#tabs-HS']").click(function () { $("#HSsearchVal").focus(); });
    $("a[href$='#tabs-SNP']").click(function () { $("#SNPsearchVal").focus(); });
    $("a[href$='#tabs-CCF']").click(function () { $("#CCFsearchVal").focus(); });
    $("a[href$='#tabs-ABC']").click(function () { $("#ABCsearchVal").focus(); });
    $("a[href$='#tabs-BB']").click(function () { $("#BBsearchVal").focus(); });
});
function processSearch(btnID, searchCat) {
    var searchField = btnID + "searchVal";
    if ($("#" + searchField).val() == "") {
        alert("Please enter a search term.");
        $("#" + searchField).focus();
        return false;
    }
    window.location.href = "AECAMResults.aspx?searchArea=" + btnID + "&searchFilter=" + $("#" + searchField).val() + "&cat=" + searchCat + "&tab=tabs-" + btnID;
};

function processFilterSearch() {
    var searchFilter = $('#AllSearchVal').val();
    var searchArea = $('#AllSearchCat option:selected').text();
    var geoArea = $('#FilterCat').val();
    var geoFilter = '';

    switch (geoArea) {
        case "County":
            geoFilter = $('#ContentPlaceHolder1_DropDownCounty').val();
            break;
        case "City":
            geoFilter = $('#ContentPlaceHolder1_DropDownCity').val();
            break;
    }
    submitFilterSearch(searchArea.toLowerCase(), searchFilter, geoArea, geoFilter);
}

function showSection(secValue) {
    $(".srchSection").each(function () {
        $(this).hide();
    })
    $("#" + secValue).show();
    if (secValue == "keyword" || secValue == "services") {
        $('#limitSearch').show();
    }
}
function submitSearch(searchArea, currentFilter) {

    var searchType = $('input[name=profparent]:checked').val();

    //google analytics information
    _gaq.push(['_trackEvent', 'prof-parent', 'search', searchType]);
    _gaq.push(['_trackEvent', 'search', searchArea, currentFilter]);
    document.location.href = 'SearchResults.aspx?searchType=' + searchType + '&tab=tabs-RES&searchArea=' + searchArea + '&searchFilter=' + currentFilter;
}