$(document).on('ready', function(){

		// var map = L.map('mapid').setView([51.505, -0.09], 13);
    var map = L.map('mapid').locate({setView: true, maxZoom: 13});

		L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoiZGVkbGVzIiwiYSI6ImNpb2F4M2YyZDAzbmV2NmtxN2gwdTY2emsifQ.GZNiG1pIdjPYL30MKDaNoQ', {
			maxZoom: 18,
			attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
				'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
				'Imagery © <a href="http://mapbox.com">Mapbox</a>',
			id: 'mapbox.streets-basic'
		}).addTo(map);

    // L.control.locate().addTo(map);
		var popup = L.popup();

    // puts a marker and a circle around your current location
    function onLocationFound(e) {
        var radius = e.accuracy / 2;
        L.marker(e.latlng).addTo(map)
            .bindPopup("You are here.").openPopup();
            // .bindPopup("You are within " + radius + " meters from this point").openPopup();
        L.circle(e.latlng, radius).addTo(map);
    }
    // error if location isn't found
    function onLocationError(e) {
        alert(e.message);
    }

    map.on('locationfound', onLocationFound);
    map.on('locationerror', onLocationError);

    // displays your current lat/long when you click the map
		function onMapClick(e) {
			popup
				.setLatLng(e.latlng)
				.setContent("You clicked the map at " + e.latlng.toString())
				.openOn(map);
		}
		map.on('click', onMapClick);



    // custom Markers
    var schoolMarker = L.AwesomeMarkers.icon({
      icon: 'building-o',
      prefix: 'fa',
      markerColor: 'purple',
      iconColor: '#6b1d5c'
    });
    L.marker([43.74295, -79.27315], {icon: schoolMarker}).addTo(map);

    // Font-Awesome markers
    // L.marker([51.941196,4.512291], {icon: L.AwesomeMarkers.icon({icon: 'street-view', markerColor: 'red', prefix: 'fa'}) }).addTo(map);
    // L.marker([51.927913,4.521303], {icon: L.AwesomeMarkers.icon({icon: 'coffee', markerColor: 'orange', prefix: 'fa', iconColor: 'black'}) }).addTo(map);
    // L.marker([51.936063,4.502077], {icon: L.AwesomeMarkers.icon({icon: 'cog',  prefix: 'fa', markerColor: 'purple', iconColor: '#6b1d5c' }) }).addTo(map);
});
