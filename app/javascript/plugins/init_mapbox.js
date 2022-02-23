import mapboxgl from 'mapbox-gl';


const addStartMarker = (map, startMarker) => {
  console.log(startMarker);
  startMarker.forEach((stMarker) => {
    new mapboxgl.Marker()
    .setLngLat([stMarker.lng, stMarker.lat])
    .addTo(map);
  });
};



const addPoiToMap = (map, poiPensions) => {
  poiPensions.forEach((poiPension) => {
    const popup = new mapboxgl.Popup().setHTML(poiPension.info_window);

    new mapboxgl.Marker()
      .setLngLat([poiPension.lng, poiPension.lat])
      .setPopup(popup)
      .addTo(map);
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    // import start point coordinates

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [2.3522219, 48.856614],
      zoom: 12
    });

    const startMarker = JSON.parse(mapElement.dataset.marker);
    // for each addStartMarker call the function
    addStartMarker(map, startMarker);

    map.on('load', function() {
      const route = JSON.parse(mapElement.dataset.route)
      const geojson = {
        type: 'Feature',
        properties: {},
        geometry: {
          type: 'LineString',
          coordinates: route
        }
      };
      map.addLayer({
        id: 'route',
        type: 'line',
        source: {
          type: 'geojson',
          data: route
        },
        layout: {
          'line-join': 'round',
          'line-cap': 'round'
        },
        paint: {
          'line-color': '#3887be',
          'line-width': 5,
          'line-opacity': 0.75
        }
      });
    })
    //add poi on may
    const poiPensions = JSON.parse(mapElement.dataset.pensionway);
    global.map = map;
    addPoiToMap(map, poiPensions);
  };
}

export { initMapbox };
