import mapboxgl from '!mapbox-gl';

// fonction Ajouter markers départ et arrivée
const addStartMarker = (map, startMarker) => {
  startMarker.forEach((stMarker) => {
    //new mapboxgl.Marker({ "color": "#274640" })
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${stMarker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.backgroundColor = '#FFFFFF';
    element.style.borderRadius = '50%';
    element.style.width = '40px';
    element.style.height = '40px';

    //new mapboxgl.Marker({ "color": "#FBC42B" })
    new mapboxgl.Marker(element)
    .setLngLat([stMarker.lng, stMarker.lat])
    .addTo(map);
  });
};

// fonction Ajouter pensions trouvées

const addPoiToMap = (map, poiPensions) => {
  poiPensions.forEach((poiPension) => {
    const popup = new mapboxgl.Popup().setHTML(poiPension.info_window);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${poiPension.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.backgroundColor = '#FFFFFF';
    element.style.borderRadius = '50%';
    element.style.border = '1px';
    element.style.borderStyle = 'solid';
    element.style.borderColor = '#FFFFFF';
    element.style.width = '40px';
    element.style.height = '40px';

    //new mapboxgl.Marker({ "color": "#FDFBF2", "width": "260" })
    new mapboxgl.Marker(element)
    .setLngLat([poiPension.lng, poiPension.lat])
    .setPopup(popup)
    .addTo(map);
  });
};

const fitMapToMarkers = (map, startMarker) => {
  const bounds = new mapboxgl.LngLatBounds();
  startMarker.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 0 });
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
      style: 'mapbox://styles/tetreur/cl0megnmt00c315qlva4sg5em',
      //style: 'mapbox://styles/mapbox/streets-v10',
      center: [startMarker[0].lng, startMarker[0].lat],
      zoom: 10
    });

    // Appel de la fonction Ajouter markers départ et arrivée
    fitMapToMarkers(map, startMarker)
    addStartMarker(map, startMarker);

    // Construction de la map
    map.on('load', function() {
      map.resize();
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
          'line-color': '#274640',
          'line-width': 5,
          'line-opacity': 0.75
        }
      });

    })
    // Appel de la fonction Ajouter pensions trouvées
    const poiPensions = JSON.parse(mapElement.dataset.pensionway);
    console.log(poiPensions);
    if (Object.keys(poiPensions).length != 0) {
      global.map = map;
      addPoiToMap(map, poiPensions);
    }
    fitMapToMarkers(map, startMarker)
    // map.resize()
  };
}

export { initMapbox };
