import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = (lat, lng) => {
   const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into

    //Affichage du depart et de l'arrivée
    const slngElement = document.getElementById('start_lng');
    const slatElement = document.getElementById('start_lat');
    const elngElement = document.getElementById('end_lng');
    const elatElement = document.getElementById('end_lat');

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [parseFloat(slatElement.value), parseFloat(slngElement.value)],
      zoom: 12
    });

    //Affichage du depart et de l'arrivée
    // set the bounds of the map
    // console.log([parseFloat(slatElement.value), parseFloat(slngElement.value)]);
    // console.log([parseFloat(elatElement.value), parseFloat(elngElement.value)]);
    // const bounds = [
    //   [parseFloat(slatElement.value), parseFloat(slngElement.value)],
    //   [parseFloat(elatElement.value), parseFloat(elngElement.value)]
    // ];
    // map.setMaxBounds(bounds);


    path = "https://api.mapbox.com/directions/v5/mapbox/driving/"
    coordinates = "#{way_start[0]},#{way_start[1]};#{way_end[0]},#{way_end[1]}"
    options = "?alternatives=true&geometries=geojson&overview=simplified&steps=false"
    token = "&access_token=#{ENV['MAPBOX_API_KEY']}"

    url = "#{path}#{coordinates}#{options}#{token}"
    json_serialized = URI.open(url).read
    JSON.parse(json_serialized)




  }
};

export { initMapbox };
