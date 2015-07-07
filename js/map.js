// This example adds a image to the marker to indicate the position
var markerIcons = [ 'https://maps.gstatic.com/mapfiles/ms2/micons/green-dot.png',
    'https://maps.gstatic.com/mapfiles/ms2/micons/blue-dot.png',
    'https://maps.gstatic.com/mapfiles/ms2/micons/blue-dot.png',
    'https://maps.gstatic.com/mapfiles/ms2/micons/green-dot.png'];

var noPOIStyle =[
    {
        featureType: "poi",
        elementType: "labels",
        stylers: [
            { visibility: "off" }
        ]
    }
];

var markers = [];
var gettingNewMarkers = false;
var bounds;
var markerClusterer;
var zoom = 16;
var openingInfo = false;
var lastMoveWasZoomIn = false;

function getContnet(img, name, address, link, status) {
    return '<div id="locationContent" style="width:190px; height:300px; overflow:hidden;">'
        + '<div id="siteNotice"><a href="' + link + '"><img id="logo-top-left" style="width: 100%;" src="' + img + '" alt="'	+ name + '"  /></a>'
        + '<br>'
        + '<a href="' + link + '"><h3 id="firstHeading" class="firstHeading" style="color:#007dcc">'
        + name
        + '</h3></a>'
        + '<div id="bodyContent">'
        + '<p style="position:relative; margin-top:15px; color:#a6a8aa">'
        + address
        + '</br> <a style="position:relative; color:#007dcc" href="' + link + '">'
        + 'Find out more </a> </p> '
        + '<div style="width:190px; height:45px; "> <p style:"color:#c6c7c9;"> Status <b> '
        + status + ' </b> </p> </div></div></div>';
}

function bindInfoWindowAndAnimate(marker, content, infowindow, status) {
    google.maps.event.addListener(marker, 'click', function() {
        openingInfo = true;
        if (prev_marker != null) {
            prev_marker.setAnimation(null);
        }
        if (prev_infowindow != null) {
            prev_infowindow.close(map, marker);
        }
        prev_marker = marker;
        prev_infowindow = infowindow;
        infowindow.setContent(content);
        infowindow.open(map, marker);
        //marker.setAnimation(google.maps.Animation.BOUNCE);
    });
}

function addMarkers(map, points, animated) {
    var latlngbounds = new google.maps.LatLngBounds();

    for (var i = 0; i < points.length; i++) {
        var markerData = points[i];
        if (markerData['latitude'] == null || markerData['longitude'] == null) continue;
        var markerLatLng = new google.maps.LatLng(markerData['latitude'], markerData['longitude']);
        var marker = new google.maps.Marker({
            position : markerLatLng,
            map : map,
            icon : markerIcons[markerData['statusId']],
            draggable : false,
            //animation : google.maps.Animation.DROP,
            title : markerData['siteName']
        });
        if (animated){
            var contentHTML = getContnet(markerData['imageSiteLink'], markerData['siteName'], markerData['city'] + ", " + markerData['greaterCityLocator'],
                roterURL + "/?siteid=" + markerData['siteId'], markerData['status']);
            var infowindow = new google.maps.InfoWindow();

            bindInfoWindowAndAnimate(marker, contentHTML, infowindow, markerData['statusId']);
        }

        markers.push(marker);
    }
}

//Sets the map on all markers in the array.
function setAllMap(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }
}

//Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
    setAllMap(null);
}

//Deletes all markers in the array by removing references to them.
function deleteMarkers() {
    clearMarkers();
    markers = [];
}


function centerMap(map, points) {
    var latlngbounds = new google.maps.LatLngBounds();
    for (var i = 0; i < points.length; i++) {
        var markerData = points[i];
        if (markerData['latitude'] == null || markerData['longitude'] == null) continue;
        var markerLatLng = new google.maps.LatLng(markerData['latitude'], markerData['longitude']);
        latlngbounds.extend(markerLatLng);
    }
    map.setCenter(latlngbounds.getCenter());
    map.fitBounds(latlngbounds);
    bounds = latlngbounds;
    zoom = map.getZoom();
}

function addSimpleMarker(map, point){
    var geocoder = new google.maps.Geocoder();

    geocoder.geocode( { 'address': point}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location,
                icon: markerIcons[2]
            });
            markers.push(marker);
        }
    });

}

function initializeMapOnMapPage() {
    var mapOptions = {
        zoom : 15,
        minZoom: 8,
        maxZoom: 18,
        center : london,
        mapTypeControl : false,
        streetViewControl : false,
        panControl : false,
        styles: noPOIStyle,
        zoomControlOptions : {
            style : google.maps.ZoomControlStyle.SMALL,
            position : google.maps.ControlPosition.TOP_RIGHT
        }
    };

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    addMarkers(map, locations, true);

    getAllMarkers();
}

function initializeListMaps() {
    for (i = 0; i < locations.length; i++) {
        var markerData = locations[i];
        var mapOptions = {
            zoom: 16,
            minZoom: 8,
            maxZoom: 18,
            center: new google.maps.LatLng(markerData['latitude'], markerData['longitude']),
            styles: noPOIStyle,
            mapTypeControl : false,
            streetViewControl : false,
            panControl : false,
            scrollwheel: false,
            navigationControl: false,
            mapTypeControl: false,
            scaleControl: false,
            draggable: false,
            disableDoubleClickZoom: true,
            disableDefaultUI: true
        };

        var idName = "map-canvas-" + (i + 1);
        var map = new google.maps.Map(document.getElementById(idName), mapOptions);

        var marker = new google.maps.Marker({
            map: map,
            position: new google.maps.LatLng(markerData['latitude'], markerData['longitude']),
            icon: markerIcons[markerData['statusId']]
        });
    }
}

function initializeMap() {
    var mapOptions = {
        zoom : 16,
        minZoom: 8,
        maxZoom: 18,
        center : london,
        styles: noPOIStyle,
        mapTypeControl : false,
        streetViewControl : false,
        panControl : false,
        scrollwheel: false,
        navigationControl: false,
        mapTypeControl: false,
        scaleControl: false,
        draggable: false,
        disableDoubleClickZoom: true,
        disableDefaultUI: true
    };

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    addMarkers(map, locations, animated);
    if (animated)
        markerClusterer = new MarkerClusterer(map, markers);

    centerMap(map, locations);

    google.maps.event.addListener(map, 'click', function(args) {
        if (prev_marker != null) {
            prev_marker.setAnimation(null);
        }
        if (prev_infowindow != null) {
            prev_infowindow.close(map, prev_marker);
        }
    });

    window.setTimeout(function(){
        google.maps.event.addListener(map, 'bounds_changed', boundsChanged);
        if (is_map === true){
            var newBounds = map.getBounds();
            getNewMarkers(newBounds);
            bounds = newBounds;
        }
    }, 500);
}

function initializeBuildingUnknown() {
    var mapOptions = {
        zoom : 16,
        minZoom: 8,
        maxZoom: 18,
        center : london,
        styles: noPOIStyle,
        mapTypeControl : false,
        streetViewControl : false,
        panControl : false,
        scrollwheel: false,
        navigationControl: false,
        mapTypeControl: false,
        scaleControl: false,
        draggable: false,
        disableDoubleClickZoom: true,
        disableDefaultUI: true
    };

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    addSimpleMarker(map, postcode);
}

function moveMap(poi, zoom) {
    closeElastic($('#postcodeResultsExtender'), $('#postcodeResultsCloser'), $('#postcodeResults'));
    setLinksInMenu(poi);
    var geocoder = new google.maps.Geocoder();
    zoom = typeof zoom !== 'undefined' ? zoom : 16;
    geocoder.geocode( { 'address': poi + ", UK"}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            map.setZoom(zoom);
            changeHeaders(results[0].address_components[1].long_name, results[0].address_components[0].long_name);
        }
    });
}

function changeHeaders(city, poi){
    $('#menuBreadcrumbs a:last-child').html(city + ", " + poi);
    $('#menuTitle').html(city + ", " + poi);
}

function moveEnough (prevBounds, newBounds, zoom, newZoom){
    if (openingInfo){
        openingInfo = false;
        return false;
    }

    if (newZoom > zoom) {
        lastMoveWasZoomIn = true;
        return false;
    } else {
        if (newZoom < zoom) return true;
    }

    if (lastMoveWasZoomIn){
        lastMoveWasZoomIn = false;
        return false;
    }

    var distancEnough = 8;
    switch (newZoom){
        case 8: distancEnough = 260; break;
        case 9: distancEnough = 240; break;
        case 10: distancEnough = 180; break;
        case 11: distancEnough = 120; break;
        case 12: distancEnough = 80; break;
        case 13: distancEnough = 45; break;
        case 14: distancEnough = 35; break;
        case 15: distancEnough = 10; break;
        case 16: distancEnough = 6; break;
        default: distancEnough = 4;
    }

    var lat1 = newBounds.getNorthEast().lat();
    var lat2 = prevBounds.getNorthEast().lat();
    var lng1 = newBounds.getNorthEast().lng();
    var lng2 = prevBounds.getNorthEast().lng();

    var distanc =  Math.sqrt(Math.pow((lat1 - lat2), 2) + Math.pow((lng1 - lng2), 2));

    if ((distanc * 1000) > distancEnough){
        //alert(newZoom + " " + (distanc * 1000));
        return true;
    } else {
        return false;
    }
}

function boundsChanged () {
    var newBounds = map.getBounds();
    var oldZoom = zoom;
    zoom = map.getZoom();
    if (moveEnough(bounds, newBounds, oldZoom, zoom)){
        if (gettingNewMarkers) return;
        gettingNewMarkers = true;
        if ($("#map-loading").length > 0) {
            $('#map-loading-text').html("Loading <span>.</span><span>.</span><span>.</span><span>.</span><span>.</span>");
            $("#map-loading").css('z-index', 2).css('display', 'block');
        }
        getNewMarkers(newBounds);
        bounds = newBounds;
    }
}

function getNewMarkers(newBounds) {
    var topleftlat = newBounds.getNorthEast().lat();
    var topleftlng = newBounds.getSouthWest().lng();
    var btmrightlat = newBounds.getSouthWest().lat();
    var btmrightlng = newBounds.getNorthEast().lng();

    $.ajax({
        url: homeURL + "map-api/",
        type: 'POST',
        data: { topLatitude: topleftlat, topLongitude: topleftlng, btmLatitude: btmrightlat, btmLongitude: btmrightlng },
        dataType: "json"
    }).done(function( data ) {
        if (data.length > 500) {
            $('#map-loading-text').html("You loaded more then 500 pins, operations can be slow <span>.</span><span>.</span><span>.</span><span>.</span><span>.</span>");
        }
        locations = data;
        deleteMarkers();
        addMarkers(map, locations, animated);
        if (markerClusterer) {
            markerClusterer.clearMarkers();
        }
        //markerClusterer = new MarkerClusterer(map, markers);
        window.setTimeout(function(){
            gettingNewMarkers = false;
        }, 1000);
        if ($("#map-loading").length > 0) {
            $("#map-loading").css('z-index', -1).css('display', 'none');
        }
    });
}

function getAllMarkers(){
    $.ajax({
        url: homeURL + "map-api/",
        type: 'POST',
        data: { topLatitude: 82, topLongitude: -10, btmLatitude: 1.5, btmLongitude: 10 },
        dataType: "json"
    }).done(function( data ) {
        data = removeExitingPins(data, locations);
        addMarkers(map, data, true);
    });
}

function removeExitingPins(inPins, existPins) {
    var outPins = [];
    for (var i = 0; i < inPins.length; i++) {
        var found = false;
        for (var j = 0; j < existPins.length; j++){
            if ( inPins[i]['siteId'] == existPins[j]['siteId'] ){
                found = true;
            }
        }
        if (!found) outPins.push(inPins[i]);
    }
    return outPins;
}

function filterMarkers(filter){
    for (var i = 0; i < markers.length; i++) {
        if (filter == 'RI'){
            if (markers [i].getIcon() == 'https://maps.gstatic.com/mapfiles/ms2/micons/green-dot.png'){
                markers [i].setMap (map)
            }
            else {markers [i].setMap (null)
            }
        }
        else
        if (filter == 'LIVE'){
            if (markers [i].getIcon() == 'https://maps.gstatic.com/mapfiles/ms2/micons/blue-dot.png'){
                markers [i].setMap (map)
            }
            else {markers [i].setMap (null)
            }
        }
        else

        if (filter == 'ALL'){
            markers [i].setMap (map)
        }
    }
}
