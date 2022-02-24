import mapboxgl from 'mapbox-gl';

// fonction Ajouter markers départ et arrivée
const addStartMarker = (map, startMarker) => {
  startMarker.forEach((stMarker) => {
    new mapboxgl.Marker({ "color": "#FBC42B"})
    .setLngLat([stMarker.lng, stMarker.lat])
    .addTo(map);
  });
};

// fonction Ajouter pensions trouvées

const addPoiToMap = (map, poiPensions) => {
  poiPensions.forEach((poiPension) => {
    const popup = new mapboxgl.Popup().setHTML(poiPension.info_window);

    new mapboxgl.Marker({ "color": "#000000" })
      .setLngLat([poiPension.lng, poiPension.lat])
      .setPopup(popup)
      .addTo(map);
  });
};

//initialisation et construction de la map
const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {

    // Appel de la fonction Ajouter markers départ et arrivée
    const startMarker = JSON.parse(mapElement.dataset.marker);


    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [startMarker[0].lng, startMarker[0].lat],
      zoom: 10
    });

    // Appel de la fonction Ajouter markers départ et arrivée
    addStartMarker(map, startMarker);

    // Construction de la map
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
          'line-color': '#FBC42B',
          'line-width': 5,
          'line-opacity': 0.75
        }
      });
    })
    // Appel de la fonction Ajouter pensions trouvées
    const poiPensions = JSON.parse(mapElement.dataset.pensionway);
    if (Object.keys(poiPensions).length != 0 ){
      global.map = map;
      addPoiToMap(map, poiPensions);
    }

  };
}

export { initMapbox };
