import mapboxgl from 'mapbox-gl';


const addStartMarker = (map, startMarker) => {
  new mapboxgl.Marker()
  .setLngLat([ startMarker.lng,startMarker.lat ])
  .addTo(map);
};

const addEndMarker = (map, endMarker) => {
  new mapboxgl.Marker()
  .setLngLat([ endMarker.lng,endMarker.lat ])
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
      zoom: 6
    });

    const startMarker = JSON.parse(mapElement.dataset.marker);
    console.log(startMarker)
    addStartMarker(map, startMarker);

    const endMarker = JSON.parse(mapElement.dataset.marker);
    console.log(endMarker)
    addEndMarker(map, endMarker);
  };
};

export { initMapbox };
