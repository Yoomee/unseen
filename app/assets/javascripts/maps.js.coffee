window.UserMap =
	init: ->
    mapOptions = {
      center: new google.maps.LatLng(UserMap.lat,UserMap.lng),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      streetViewControl: false,
      mapTypeControl: false,
      scrollwheel: false,
      zoom: 8
    }
    
    UserMap.map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    
    marker = new google.maps.Marker({
        position: new google.maps.LatLng(UserMap.lat, UserMap.lng),
        map: UserMap.map
    });
    
    
    
window.UserLocationMap =  
  init: (lat, lng, notDefault) ->
    mapOptions = {
      center: new google.maps.LatLng(lat,lng),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      streetViewControl: false,
      draggable: true,
      keyboardShortcuts:false
    }
    mapOptions.zoom = if notDefault then 12 else 8  
    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(lat, lng),
      map: map
    });

    google.maps.event.addListener map, 'center_changed', ->
      mapCenter = map.getCenter()
      marker.setPosition(mapCenter)
      UserLocationMap.update(mapCenter)

  update: (latLng) ->
    $('#user_lat').val(latLng.lat())
    $('#user_lng').val(latLng.lng())