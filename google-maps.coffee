root = this
$ = root.jQuery
gm = root.google.maps

root.maps = do ->
  map = null
  renderer = null
  defaultOptions = 
    zoom: 11
    center: new gm.LatLng -37.8, 145
    mapTypeId: gm.MapTypeId.ROADMAP
    sensor: false

  initMap = (divId, options = defaultOptions) ->
    map = new gm.Map document.getElementById(divId), options
    gm.event.addDomListener window, resize, resizeMap
    renderer = new gm.DirectionsRenderer map: map
    map
  
  # Private

  resizeMap = ->
    center = map.getCenter
    gm.event.trigger map, 'resize'
    map.setCenter center 

  initMap: initMap