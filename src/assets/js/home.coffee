$ ->
  $.loadSlice= (index)->
    $item = $('#mainNav li:eq('+index+')')
    if $item.index() != -1
      $.get($item.children('a').attr('href'),(data)->
        $data = $('<div/>').html(data)
        $('#slices').append($data.find('.ajax'))
        $.loadSlice($item.index()+1)
      )
    else
      $.replaceMenuLinks()
      $.initGmap()
      $('html').addClass('loaded')
      sm = new gc.slice.SliceManager({ selector: '#slices .slice', contentsSelector: '#contents .content', bulletContainer: '#mainNav li' })
    return @

  $.replaceMenuLinks= ->
    $item = $('#mainNav a').each(->
      $(this).attr( 'href', $(this).attr('href')
        .replace('/', '/#')
        .replace('.html', '') )
    )
    return @


  $.initGmap = ->
    styles = [{
      "featureType": "landscape",
      "stylers": [{ "visibility": "simplified" },
      { "color": "#59394c" }]
    },{
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [{ "color": "#402c3c" }]
    },{
      "featureType": "road",
      "elementType": "labels",
      "stylers": [{ "weight": 0.1 },
      { "color": "#dfc2d3" }]
    },{
      "featureType": "poi",
      "elementType": "labels.icon",
      "stylers": [{ "visibility": "off" }]
    },{
      "featureType": "poi",
      "elementType": "labels.text",
      "stylers": [{ "color": "#dfc2d3" },
      { "weight": 0.1 }]
    },{
      "featureType": "transit",
      "elementType": "labels.text",
      "stylers": [{ "color": "#fbfbfb" },
      { "weight": 0.6 }]
    },{
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [{ "color": "#313637" }]
    },{
      "elementType": "geometry"  }]

    styledMap = new google.maps.StyledMapType(styles,
      {name: "Styled Map"}
      );
    myLatlng = new google.maps.LatLng(50.4843946, 2.9424579);
    mapOptions = {
      center: myLatlng,
      zoom: 16,
      disableDefaultUI: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };


    map = new google.maps.Map(document.getElementById("GMap"),
      mapOptions);
    myMarkerImage = new google.maps.MarkerImage('assets/img/marker.png');
    myMarker = new google.maps.Marker({
    # // Coordonnées du cabinet
    position: myLatlng,
    map: map,
    icon: myMarkerImage,
    title: "Sandrine P."
    });

    myWindowOptions = {
      content: '<h3>Sandrine Piechota</h3>'+ '<H4>Ostéopathe</h4>'
    };

    # // Création de la fenêtre
    myInfoWindow = new google.maps.InfoWindow(myWindowOptions);
    google.maps.event.addListener(myMarker, 'click', ->
      myInfoWindow.open(map,myMarker);
    );

    map.mapTypes.set('map_style', styledMap);
    map.setMapTypeId('map_style');

  $(window).load ->
    $.loadSlice(1)
    