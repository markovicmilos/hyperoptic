var is_map = false;
var timestamp = 0;
var isBusiness = false;

if (!Date.now) {
    Date.now = function () {
        return new Date().getTime();
    }
}

function openSearch() {
    var src = ($('#search-icon').attr('src') === baseURL + '/images/search-icon.png')
        ? baseURL + '/images/search-blue-icon.png'
        : baseURL + '/images/search-icon.png';
    $('#search-icon').attr('src', src);
    $('#search-bar-top').toggle( "slow", function() {
        $(this).animate({
            zIndex:5,
            opacity:1,
            easing: "easeInOutCubic"
        }, 500);
    });
}

function setDropDownValue(dropdownId, valueDisplay, valueInInput){
    $("#"+dropdownId).html(valueDisplay);
    var input = $("#"+dropdownId+"Input");
    if (typeof valueInInput === "undefined") {
        input.val(valueDisplay);
    } else {
        input.val(valueInInput);
    }
    input.trigger('change');
    return false;
}

function onRILoad(percentage){
    $(".progress-bar-green").delay(1000).animate({
        width:percentage
    }, 300);
    $(".progress-h-active").mouseenter(function(){
        clearTimeout($(".progress-h-active").data('timeoutId'));
        $("#progress-hover").css({
            opacity:1,
            zIndex:5
        }, 300);
    }).mouseleave(function(){
        var progressHover = $(".progress-h-active"),
            timeoutId = setTimeout(function(){
                $("#progress-hover").delay(500).css({
                    opacity:0,
                    zIndex:-1
                }, 100);
            }, 1000);
        progressHover.data('timeoutId', timeoutId);

    });
    initPostcodeElasticOnBuildingPages('postcode');
    barScrlToTop(200);
}

function initPostcodeElasticOnBuildingPages(id) {
    var postcodeInput   = $('#' + id);
    var closer          = $('#' + id + 'ResultsCloser');
    var extender        = $('#' + id + 'ResultsExtender');
    var container       = $('#' + id + 'Results');
    postcodeInput.keyup(function() {
        if ($(this).val().length > 2){

            var dataToSend = { query: $(this).val(), is_link_js: true, timestamp: Date.now() };
            if (siteid != null) {
                dataToSend.siteid = siteid;
            } else {
                dataToSend.sitegroupid = sitegroupid;
            }

            $.ajax({
                url: homeURL + "elasticsearch/",
                type: 'POST',
                data: dataToSend
            }).done(function( data, status, xhr ) {
                if ( xhr.getResponseHeader('Timestamp') < timestamp ) return;
                timestamp = xhr.getResponseHeader('Timestamp');
                container.html( data );
                extender.css('display', 'block').css('z-index', 6);
                closer.css('display', 'block').css('z-index', 5);
                container.css('display', 'block').css('z-index', 10).animate({
                    opacity: 1,
                    easing: "easeInOutCubic"
                });
                closer.click(function() {
                    closeElastic(extender, closer, container);
                });
            });
        }
    });

    postcodeInput.focusin(function () {
        postcodeInput.val('');
        if( $('#go-disable-button').length ) {
            $('#go-disable-button').animate({
                opacity: 0,
                easing: "easeInOutCubic"
            }, 800);
        }
    });
    barScrlToTop(200);
}

function initPostcodeElasticSelectAddress() {
    var postcodeInput   = $('#postcode');
    var closer          = $("#postcodeResultsCloser");
    var extender        = $("#postcodeResultsExtender");
    var container       = $('#postcodeResults');

    postcodeInput.keyup(function() {
        if ($(this).val().length > 2){

            var dataToSend = { query: $(this).val(), isJustSelect: true, timestamp: Date.now() };

            $.ajax({
                url: homeURL + "elasticsearch/",
                type: 'POST',
                data: dataToSend
            }).done(function( data, status, xhr ) {
                if ( xhr.getResponseHeader('Timestamp') < timestamp ) return;
                timestamp = xhr.getResponseHeader('Timestamp');
                container.html( data );
                extender.css('display', 'block').css('z-index', 6);
                closer.css('display', 'block').css('z-index', 5);
                container.css('display', 'block').css('z-index', 10).animate({
                    opacity: 1,
                    easing: "easeInOutCubic"
                });
                closer.click(function() {
                    closeElastic(extender, closer, container);
                });
            });
        }
    });

    postcodeInput.focusin(function () {
        postcodeInput.val('');
    });
}

function closeElastic(extender, closer, container) {
    extender.css('display', 'none').css('z-index', -1);
    closer.css('display', 'none').css('z-index', -1);
    container.animate({
        opacity: 0,
        easing: "easeInOutCubic"
    });

    window.setTimeout(function(){
        container.css('z-index', -1);
        container.css('display', 'none');
    }, 500);
}

function selectPostCode(pafid, address, postcode){
    closeElastic($('#postcodeResultsExtender'), $('#postcodeResultsCloser'), $('#postcodeResults'));
    $('#postcode').val(address);
    $('#pafid').val(pafid).trigger('change');
    if( $('#addressInfo').length )
        $('#addressInfo').html(address);
    if( $('#postcodeInForm').length )
        $('#postcodeInForm').val(postcode);
}

function onGoClickedRI() {
    $('#postcode').attr('disabled','disabled');
    $('#register-ue').attr('disabled','disabled');
    var pafid = $('#pafid').val();
    if (pafid) {
        $.ajax({
            url: homeURL + "routing/",
            type: 'POST',
            data: {pafid: pafid, fromjs: true}
        }).done(function ( data ) {
            if (data != null) {
                if (data.indexOf("CANT") > -1) {
                    // Display it is live popup
                    $('#go-disable-button').animate({
                        opacity: 1,
                        easing: "easeInOutCubic"
                    }, 300);
                    $('#postcode').removeAttr('disabled');
                    $('#register-ue').removeAttr('disabled');
                } else {
                    if ((data.indexOf("register-interest") > -1 && !isBusiness) || (data.indexOf("business-interest") > -1 && isBusiness)) {
                        // Display register intrest form
                        $('#register-popup').toggleClass('register-popup-d-b');
                    } else {
                        // Redirect to live page
                        window.location.replace(data);
                    }
                }
            }
        });
    } else {
        $('#postcode').removeAttr('disabled');
        $('#register-ue').removeAttr('disabled');
        $('#postcode').val('');
        $('#go-disable-button-error').animate({
            opacity:1,
            easing: "easeInOutCubic"
        }, 300);
    }
	
	return false;
}


function onGoClickedLive() {
    $('#postcode').attr('disabled','disabled');
    $('#register-ue').attr('disabled','disabled');
    var pafid = $('#pafid').val();
    if (pafid) {
        $.ajax({
            url: homeURL + "routing/",
            type: 'POST',
            data: { pafid: pafid, fromjs: true }
        }).done(function( data ) {
            if (data != null){
                if (data.indexOf("CANT") > -1){
                    // Display it is live popup
                    $('#go-disable-button').animate({
                        opacity:1,
                        easing: "easeInOutCubic"
                    }, 300);
                    $('#postcode').removeAttr('disabled');
                    $('#register-ue').removeAttr('disabled');
                } else {
                    // Redirect
                    window.location.replace(data);
                }
            }
        });
    } else {
        $('#postcode').removeAttr('disabled');
        $('#register-ue').removeAttr('disabled');
        $('#postcode').val('');
        $('#go-disable-button-error').animate({
            opacity: 1,
            easing: "easeInOutCubic"
        }, 300);
    }
    return false;
}

function closeRIonRIPage() {
    $('#postcode').removeAttr('disabled');
    $('#register-ue').removeAttr('disabled');
    $('#register-popup').toggleClass('register-popup-d-b');
    $('#pafid').val('');
    $('#postcode').val('');
}

function postCodeChangeStart(){
    if ($('#go-disable-button-error').css("opacity") == 1){
        $('#go-disable-button-error').animate({
            opacity: 0,
            easing: "easeInOutCubic"
        }, 500);
    }
}

// Function for changing Select to Selected	text and changing color by adding class
function changingPacketText(chosenpackettxt) {
    $('.pack-text-op').each(function(index) {
        if ($(this).attr("id") == chosenpackettxt) {
            $(this).html("SELECTED");
            $(this).addClass('font-w-600 black-f-1')
        }
        else {
            $(this).html("SELECT");
            $(this).removeClass('font-w-600 black-f-1')
        }
    });
}

// Function for changing Image Unselected to Image Selected by adding/removing class
function changingPacketImg(chosenpacketimg) {
    $('.pack-i-op').each(function(index) {
        if ($(this).attr("id") == chosenpacketimg) {
            $(this).addClass('pack-i-s-op')
        }
        else {
            $(this).removeClass('pack-i-s-op')
        }
    });
}

function elasticInit(textBoxID, resultsContainerID){
    var container       = $("#"+resultsContainerID);
    var closer          = $("#"+resultsContainerID+"Closer");
    var extender        = $("#"+resultsContainerID+"Extender");
    var textBox         = $("#"+textBoxID);

    textBox.keyup(function() {
        var value = $( this ).val();
        if (value.length > 2){
            setLinksInMenu(value);
            $.ajax({
                url: homeURL + "elasticsearch/",
                type: 'POST',
                data: { query: value, is_link_js: is_map, timestamp: Date.now() }
            }).done(function( data, status, xhr ) {
                if ( xhr.getResponseHeader('Timestamp') < timestamp ) return;
                timestamp = xhr.getResponseHeader('Timestamp');
                container.html( data.replace("../building-unknown/", "../building-unknown/?q=" + value.toUpperCase()) );
                extender.css('display', 'block').css('z-index', 6);
                closer.css('display', 'block').css('z-index', 5);
                container.css('display', 'block').css('z-index', 10).animate({
                    opacity: 1,
                    easing: "easeInOutCubic"
                });
                closer.click(function() {

                    closeElastic(extender, closer, container);

                });
            });
        }
    });
    textBox.focusin(function () {
        textBox.val('');
    });
}

function setLinksInMenu(newValue){
    $(".link-into-view-by").each(function() {
        var url = $( this ).attr("href");
        if (url.lastIndexOf('=') == -1) return;
        url = url.substring(0, url.lastIndexOf('=') + 1) + newValue.toUpperCase();
        $( this ).attr("href", url);
    });
}

function classStartsWith(elements,str) {
    return elements.map( function(i,e) {
        var classes = e.className.split(' ');
        for (var i=0, j=classes.length; i < j; i++) {
            if (classes[i].substr(0, str.length).toLowerCase() == str.toLowerCase()) return e;
        }
    }).get();
}

function openModalWindow(windowName) {
    $('#' + windowName).modal('show');
}

function closeModalWindows(windowName){
    $('#' + windowName).modal('hide');
}

function submitReportProblem() {
    if ($('#reportProblemForm').valid()){
        $('#reportProblemButton').attr('disabled','disabled');
        $('#reportProblemInfoMessage').html("Message sent<br />Your message has been forwarded to our Customer service.");
        var subject = $('#reportProblemSubject').val();
        var name =  $('#reportProblemName').val();
        var email = $('#reportProblemEmail').val();
        var text =  $('#reportProblemMessage').val();
        var siteuid = $('#reportProblemSiteId').val();
        $.ajax({
            url: homeURL + "tell-us-api/",
            type: 'POST',
            data: { subject: subject,
                username: name,
                email: email,
                text: text,
                siteid: siteuid },
            dataType: "json"
        });
    }

    return false;
}

function getBill(billDate) {
    $.ajax({
        url: homeURL + "bill-api/",
        type: 'POST',
        data: { date: billDate, billDivId: 'modalBill' }
    }).done(function( data ) {
        $('#billPlaceHolder').html(data);
        openModalWindow('modalBill');
    });
}

// homepage
function updateChart(value){
    // Change speed title on dropdown button
    chartTitle = document.getElementById("yourSelectedSpeedTitle");
    chartTitle.innerHTML = value + " Mbps";
    resetBars();

    if(value == 10) {
        $("#speed-txt-info-1000").html("Download <b>135x faster</b> than the average UK’s standard broadband speeds.");
        $("#speed-txt-info-100").html("Download and watch a <b>4K movie (50GB) in less than 8 minutes</b> compared to waiting for 16 hours on the UK’s average standard broadband speed.");
        $("#speed-txt-info-20").html("Backup precious memories  <b>in seconds not 6 hours</b> on standard broadband packages.");
        $("#speed-txt-info-10").html("*Average standard ADSL broadband speeds are 4Mbps for downloads and 1.0Mbps for uploads, taken from Ofcom’s ‘UK fixed line broadband performance report, Published Oct-14’.");
    }
    if(value == 17) {
        $("#speed-txt-info-1000").html("Upload <b>1,000x faster</b> than standard broadband.");
        $("#speed-txt-info-100").html("Upload 500 photos to Facebook <b>in less than 30 seconds </b> on Hyperoptic 1Gb fibre broadband compared to over 6 hours on standard broadband packages.");
        $("#speed-txt-info-20").html("Download and play the latest video games  <b>(25GB) within minutes</b>, not 6 hours later. ");
        $("#speed-txt-info-10").html("*Average ADSL2+ above ‘up to’ 10Mbit/s or without a headline speed broadband speeds are 8.9Mbps for downloads and 1.0Mbps for uploads, taken from Ofcom’s ‘UK fixed line broadband performance report, Published Oct-14’.");
    }
    if(value == 38) {
        $("#speed-txt-info-1000").html("Download <b>135x faster</b> than the average UK’s standard broadband speeds.");
        $("#speed-txt-info-100").html("Download and watch a <b>4K movie (50GB) in less than 8 minutes</b> compared to waiting for 16 hours on the UK’s average standard broadband speed. ");
        $("#speed-txt-info-20").html("Backup precious memories  <b>in seconds not 6 hours</b> on standard broadband packages.");
        $("#speed-txt-info-10").html("*Average 'Up to 38Mbps broadband speeds are 34.8Mbps for downloads and 10.0Mbps for uploads, taken from Ofcom’s ‘UK fixed line broadband performance report, Published Oct-14’. ");
    }
    if(value == 76) {
        $("#speed-txt-info-1000").html("Upload <b>1,000x faster</b> than standard broadband.");
        $("#speed-txt-info-100").html("Upload 500 photos to Facebook <b>in less than 30 seconds </b> on Hyperoptic 1Gb fibre broadband compared to nearly 20 minutes on other providers fibre connections.");
        $("#speed-txt-info-20").html("Download and play the latest video games  <b>(25GB) within minutes</b>, not 6 hours later. ");
        $("#speed-txt-info-10").html("*Average 'Up to 76Mbps broadband speeds are 61.7Mbps for downloads and 19.0Mbps for uploads, taken from Ofcom’s ‘UK fixed line broadband performance report, Published Oct-14’.");
    }

    if($("#benchmarkTitle").text() == "Download HD movie (5.2GB)"){
        if(value == 10){
            $("#completed-time-1000").text("Completed: 47 seconds");
            $("#completed-time-100").text("Completed: 8 minutes");
            $("#completed-time-20").text("Completed: 39 minutes");
            $("#completed-time-selected").text("Completed: 2h 57 minutes");


            doAnimation("#speed-1000",4700, "progress-bar-c-blue");
            doAnimation("#speed-100",48000, "progress-bar-c-blue");
            doAnimation("#speed-20",234000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",1062000, "krajnja4");
        }

        if(value == 17){
            $("#completed-time-1000").text("Completed: 47 seconds");
            $("#completed-time-100").text("Completed: 8 minutes");
            $("#completed-time-20").text("Completed: 39 minutes");
            $("#completed-time-selected").text("Completed: 1h 20 minutes");

            doAnimation("#speed-1000",4700, "progress-bar-c-blue");
            doAnimation("#speed-100",48000, "progress-bar-c-blue");
            doAnimation("#speed-20",234000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",480000, "krajnja4");
        }
        if(value == 38){
            $("#completed-time-1000").text("Completed: 47 seconds");
            $("#completed-time-100").text("Completed: 8 minutes");
            $("#completed-time-20").text("Completed: 39 minutes");
            $("#completed-time-selected").text("Completed: 21 minutes");

            doAnimation("#speed-1000",4700, "progress-bar-c-blue");
            doAnimation("#speed-100",48000, "progress-bar-c-blue");
            doAnimation("#speed-20",234000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",126000, "krajnja4");
        }
        if(value == 76){
            $("#completed-time-1000").text("Completed: 47 seconds");
            $("#completed-time-100").text("Completed: 8 minutes");
            $("#completed-time-20").text("Completed: 39 minutes");
            $("#completed-time-selected").text("Completed: 12 minutes");

            doAnimation("#speed-1000",4700, "progress-bar-c-blue");
            doAnimation("#speed-100",48000, "progress-bar-c-blue");
            doAnimation("#speed-20",234000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",72000, "krajnja4");
        }
    } else if($("#benchmarkTitle").text() == "Download an Xbox game (25GB)"){
        if(value == 10){
            $("#completed-time-1000").text("Completed: 4 minutes");
            $("#completed-time-100").text("Completed: 38 minutes");
            $("#completed-time-20").text("Completed: 3h 7 minutes");
            $("#completed-time-selected").text("Completed: 14h 13 minutes");


            doAnimation("#speed-1000",24000, "progress-bar-c-blue");
            doAnimation("#speed-100",228000, "progress-bar-c-blue");
            doAnimation("#speed-20",1122000, "progress-bar-green");
            doAnimation("#your-selected-speed-bar",5118000, "krajnja4");
        }

        if(value == 17){
            $("#completed-time-1000").text("Completed: 4 minutes");
            $("#completed-time-100").text("Completed: 38 minutes");
            $("#completed-time-20").text("Completed: 3h 7 minutes");
            $("#completed-time-selected").text("Completed: 6h 24 minutes");


            doAnimation("#speed-1000",24000, "progress-bar-c-blue");
            doAnimation("#speed-100",228000, "progress-bar-c-blue");
            doAnimation("#speed-20",1122000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",2304000, "krajnja4");
        }
        if(value == 38){
            $("#completed-time-1000").text("Completed: 4 minutes");
            $("#completed-time-100").text("Completed: 38 minutes");
            $("#completed-time-20").text("Completed: 3h 7 minutes");
            $("#completed-time-selected").text("Completed: 1h 39 minute");


            doAnimation("#speed-1000",24000, "progress-bar-c-blue");
            doAnimation("#speed-100",228000, "progress-bar-c-blue");
            doAnimation("#speed-20",1122000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",594000, "krajnja4");
        }
        if(value == 76){
            $("#completed-time-1000").text("Completed: 4 minutes");
            $("#completed-time-100").text("Completed: 38 minutes");
            $("#completed-time-20").text("Completed: 3h 7 minutes");
            $("#completed-time-selected").text("Completed: 56 minutes");

            doAnimation("#speed-1000",24000, "progress-bar-c-blue");
            doAnimation("#speed-100",228000, "progress-bar-c-blue");
            doAnimation("#speed-20",1122000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",336000, "krajnja4");
        }
    } else if($("#benchmarkTitle").text() == "Upload a Video to YouTube (200MB)"){
        if(value == 10){
            $("#completed-time-1000").text("Completed: 2 seconds");
            $("#completed-time-100").text("Completed: 18 seconds");
            $("#completed-time-20").text("Completed: 30 minutes");
            $("#completed-time-selected").text("Completed: 60 minutes");

            doAnimation("#speed-1000",200, "progress-bar-c-blue");
            doAnimation("#speed-100",1800, "progress-bar-c-blue");
            doAnimation("#speed-20",180000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",360000, "krajnja4");
        }

        if(value == 17){
            $("#completed-time-1000").text("Completed: 2 seconds");
            $("#completed-time-100").text("Completed: 18 seconds");
            $("#completed-time-20").text("Completed: 30 minutes");
            $("#completed-time-selected").text("Completed: 30 minutes");

            doAnimation("#speed-1000",200, "progress-bar-c-blue");
            doAnimation("#speed-100",1800, "progress-bar-c-blue");
            doAnimation("#speed-20",180000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",180000, "krajnja4");
        }
        if(value == 38){
            $("#completed-time-1000").text("Completed: 2 seconds");
            $("#completed-time-100").text("Completed: 18 seconds");
            $("#completed-time-20").text("Completed: 30 minutes");
            $("#completed-time-selected").text("Completed: 3 minutes");

            doAnimation("#speed-1000",200, "progress-bar-c-blue");
            doAnimation("#speed-100",1800, "progress-bar-c-blue");
            doAnimation("#speed-20",180000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",18000, "krajnja4");
        }
        if(value == 76){
            $("#completed-time-1000").text("Completed: 2 seconds");
            $("#completed-time-100").text("Completed: 18 seconds");
            $("#completed-time-20").text("Completed: 30 minutes");
            $("#completed-time-selected").text("Completed: 2 minutes");

            doAnimation("#speed-1000",200, "progress-bar-c-blue");
            doAnimation("#speed-100",1800, "progress-bar-c-blue");
            doAnimation("#speed-20",180000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",12000, "krajnja4");
        }
    } else if($("#benchmarkTitle").text() == "Upload 500 High-Res photos (2.5GB )"){
        if(value == 10){
            $("#completed-time-1000").text("Completed: 23 seconds");
            $("#completed-time-100").text("Completed: 4 minutes");
            $("#completed-time-20").text("Completed: 6h 15 minutes");
            $("#completed-time-selected").text("Completed: 6h 15 minutes");

            doAnimation("#speed-1000",2300, "progress-bar-c-blue");
            doAnimation("#speed-100",24000, "progress-bar-c-blue");
            doAnimation("#speed-20",1530000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",1530000, "krajnja4");
        }

        if(value == 17){
            $("#completed-time-1000").text("Completed: 23 seconds");
            $("#completed-time-100").text("Completed: 4 minutes");
            $("#completed-time-20").text("Completed: 6h 15 minutes");
            $("#completed-time-selected").text("Completed: 6h 15 minutes");

            doAnimation("#speed-1000",2300, "progress-bar-c-blue");
            doAnimation("#speed-100",24000, "progress-bar-c-blue");
            doAnimation("#speed-20",1530000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",1530000, "krajnja4");
        }
        if(value == 38){
            $("#completed-time-1000").text("Completed: 23 seconds");
            $("#completed-time-100").text("Completed: 4 minutes");
            $("#completed-time-20").text("Completed: 6h 15 minutes");
            $("#completed-time-selected").text("Completed: 37 minutes");

            doAnimation("#speed-1000",2300, "progress-bar-c-blue");
            doAnimation("#speed-100",24000, "progress-bar-c-blue");
            doAnimation("#speed-20",1530000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",222000, "krajnja4");
        }
        if(value == 76){
            $("#completed-time-1000").text("Completed: 23 seconds");
            $("#completed-time-100").text("Completed: 4 minutes");
            $("#completed-time-20").text("Completed: 6h 15 minutes");
            $("#completed-time-selected").text("Completed: 19 minutes");

            doAnimation("#speed-1000",2300, "progress-bar-c-blue");
            doAnimation("#speed-100",24000, "progress-bar-c-blue");
            doAnimation("#speed-20",1530000, "progress-bar-c-blue");
            doAnimation("#your-selected-speed-bar",114000, "krajnja4");
        }
    }

}

function resetBars(){
    $("#speed-1000").stop();
    $("#speed-1000").css("width", "0px");
    $("#speed-1000").removeClass("progress-bar-c-blue");
    $("#speed-100").stop();
    $("#speed-100").css("width", "0px");
    $("#speed-100").removeClass("progress-bar-c-blue");
    $("#speed-20").stop();
    $("#speed-20").css("width", "0px");
    $("#speed-20").removeClass("progress-bar-c-blue");
    $("#your-selected-speed-bar").stop();
    $("#your-selected-speed-bar").css("width", "0px");
    $("#your-selected-speed-bar").removeClass("krajnja4");
}

function doAnimation(id, value, className){
    // $(".your-selected-speed-bar").animate({
    //	width:"0px"
    //}, 0);
    $(id).animate({
        width:"100%",
    }, value, function() {
        $(id).addClass(className)
    });
}

function getCurrentScroll() {
    return window.pageYOffset || document.documentElement.scrollTop;
}

function onLoadHomepages(moveSearch){
    //var moveSearch = 700;
    $('html, body').css('height', 'auto');
    $(window).scroll(function() {
        var scroll = getCurrentScroll();
        if ( scroll >= moveSearch ) {
            $('#animate-on-scroll-s-h').addClass('navbar-fixed-top');
        }
        else {
            $('#animate-on-scroll-s-h').removeClass('navbar-fixed-top');
        }
    });
}

function barScrlToTop(moveSearch){
    //var moveSearch = 700;
    $('html, body').css('height', 'auto');
    $(window).scroll(function() {
        var scroll = getCurrentScroll();
        if ( scroll >= moveSearch ) {
            $('#animate-on-scroll-s-b').addClass('navbar-fixed-top');
        }
        else {
            $('#animate-on-scroll-s-b').removeClass('navbar-fixed-top');
        }
    });
}


function addValidationToThisForm() {
    $( this ).closest('form').validate({ rules: {	email: "validEmail" } });
}
function addNewEmail() {
    if (countOfNames >= 5) return;
    var appendHTML="";
    appendHTML += "<div class=\"col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0\">";
    appendHTML += "<div class=\"input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 marg-top-fixed-10 pad-right-percent-0 pad-left-fixed-20 fp-padding-rl \" >";
    appendHTML += "<p class=\"font-13 gray-f-2 marg-top-0-l-768 dis-none header-rbp-links-l-768 dis-block-l-992  \">Name #" + countOfNames ;
    appendHTML += "<\/p>";
    appendHTML += "	<input id=\"name" + countOfNames + "\" name=\"name" + countOfNames + "\" type=\"text\" class=\"form-control input-ri\" placeholder=\"Friend’s name\" required=\"required\" \/>";
    appendHTML += "<\/div> ";
    appendHTML += "<div class=\"input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 marg-top-fixed-10\" >";
    appendHTML += "<p class=\"font-13 gray-f-2 marg-top-0-l-768 dis-none header-rbp-links-l-768 dis-block-l-992 \">Email #" + countOfNames ;
    appendHTML += "<\/p>";
    appendHTML += "	<input id=\"email" + countOfNames + "\" name=\"email" + countOfNames + "\" type=\"email\" class=\"form-control input-ri\" placeholder=\"Friend’s email address\" required=\"required\" \/>";
    appendHTML += "<\/div>";
    appendHTML += "<\/div>";

    $('#names').append(appendHTML);

    var emailName = "email" + countOfNames;
    countOfNames++;
}

function tellAFriend(){
    if (!$("#tellAFriendForm").valid()) return;
    $('#submitTellAFriend').attr('disabled','disabled');
    jsonData = {
        "csf": $('#csf').val(),
        "championEmail": {
            "name": $('#yourname').val(),
            "email": $('#youremail').val()
        },
        "sendToEmails": []
    };
    for (var i = 0; i < countOfNames; i++){
        var name = $('#name' + i).val();
        var email = $('#email' + i).val();
        if (name == "" || email == "") continue;
        var mailAndName = {
            "name": name,
            "email": email
        };
        jsonData.sendToEmails.push(mailAndName);
    }
    $.ajax({
        type: "POST",
        url: homeURL + "champion-api/",
        data: jsonData,
        success: function (data) {
            closeModalWindows('tellFriendModal');
            openModalWindow('modalTellAFriendThankYou');
        }
    });
    return false;
}

function isOKBecomeChampion () {
    if ($("#pafid").val() != ""){
        $("#championSubmit").removeAttr("disabled");
    } else {
        $("#championSubmit").attr("disabled","disabled");
    }
}

function becomeChampionInit() {
    $("#becomeChampionForm").validate({ rules: { email: "validEmail" } });
    $("#pafid").change(function() {
        isOKBecomeChampion();
    });
}

function becomeChampionSubmit() {
    if (!$("#becomeChampionForm").valid()) return;
    $("#championSubmit").attr("disabled","disabled");
    $dataToSend = {
        "fullname": $('#nameTitleInput').val() + " " + $('#championsFirstname').val() + " " + $('#championsLastname').val(),
        "email": $('#championsEmail').val(),
        "mobile": $('#championsMobile').val(),
        "phone": $('#championsPhone').val(),
        "pafId": $('#pafid').val(),
        "siteId": $('#siteid').val()
    };
    $.ajax({
        type: "POST",
        url: homeURL + "champion-api/",
        data: $dataToSend,
        success: function (data) {
            closeModalWindows('modalBecomeChampion');
            openModalWindow('modalBecomeChampionThankYou');
        }
    });
    return false;
}


function onPackageHoverOP(percentage){
    $(".progress-h-active").mouseenter(function(){
        clearTimeout($(".progress-h-active").data('timeoutId'));
        $("#progress-hover").css({
            opacity:1,
            zIndex:5
        }, 300);
    }).mouseleave(function(){
        var progressHover = $(".progress-h-active"),
            timeoutId = setTimeout(function(){
                $("#progress-hover").delay(500).css({
                    opacity:0,
                    zIndex:-1
                }, 100);
            }, 1000);
        progressHover.data('timeoutId', timeoutId);

    });
}