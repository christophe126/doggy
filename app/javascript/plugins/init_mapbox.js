import mapboxgl from 'mapbox-gl';


const addStartMarker = (map, startMarker) => {
  new mapboxgl.Marker()
  .setLngLat([ startMarker.lng,startMarker.lat ])
  .addTo(map);
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
      zoom: 4
    });

    const startMarker = JSON.parse(mapElement.dataset.marker);
    // for each addStartMarker call the function
    addStartMarker(map, startMarker[0]);
    addStartMarker(map, startMarker[1]);

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
};
}

export { initMapbox };
