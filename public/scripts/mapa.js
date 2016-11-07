function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
   center: {lat: -34.397, lng: 150.644},
   zoom: 15
 });
  var infoWindow = new google.maps.InfoWindow({map: map});

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
  	navigator.geolocation.getCurrentPosition(function(position) {
  		var pos = {
  			lat: position.coords.latitude,
  			lng: position.coords.longitude
  		};

  		var pos1 = {
  			lat: position.coords.latitude+0.004,
  			lng: position.coords.longitude+0.004
  		};
  		var pos2 = {
  			lat: position.coords.latitude-0.004,
  			lng: position.coords.longitude-0.004
  		};
  		var pos3 = {
  			lat: position.coords.latitude+0.004,
  			lng: position.coords.longitude-0.004
  		};
  		var pos4 = {
  			lat: position.coords.latitude-0.004,
  			lng: position.coords.longitude+0.004
  		};

  		var image = 'images/homemarker.png';
  		var image1 = 'images/barbershopmarker.png';

  		var marker1 = new google.maps.Marker({
  			position: pos1,
  			//icon: image1,
  			title:"Barbería 1"
  		});
  		var marker2 = new google.maps.Marker({
  			position: pos2,
  			//icon: image1,
  			title:"Barbería 2"
  		});
  		var marker3 = new google.maps.Marker({
  			position: pos3,
  			//icon: image1,
  			title:"Barbería 3"
  		});
  		var marker4 = new google.maps.Marker({
  			position: pos4,
  			//icon: image1,
  			title:"Barbería 4"
  		});
  		var home = new google.maps.Marker({
  			position: pos,
  			map: map,
  			icon: image,
  			title:"Esta es tu casa."
  		});

  		marker1.setMap(map);
  		marker2.setMap(map);
  		marker3.setMap(map);
  		marker4.setMap(map);
  		home.setMap(map);

  		map.setCenter(pos);

  		//infoWindow.setPosition(pos);
  		//infoWindow.setContent('Esta es tu casa.');
  	}, function() {
  		handleLocationError(true, infoWindow, map.getCenter());
  	});
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	infoWindow.setPosition(pos);
	infoWindow.setContent(browserHasGeolocation ?
		'Error: The Geolocation service failed.' :
		'Error: Your browser doesn\'t support geolocation.');
}