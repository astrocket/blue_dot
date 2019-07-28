import { Controller } from "stimulus";
import api from 'utils/api';
import helpers from 'utils/helpers';

export default class extends Controller {
  static targets = [ "" ];

  // https://nominatim.openstreetmap.org/search?format=json&city=Paris&country=France
  setPolygon = (city) => {
    api.get(`https://nominatim.openstreetmap.org/search.php?q=${city}&polygon_geojson=1&viewbox=&format=geojson`)
        .then((response) => {
          const { features } = response.data;
          features.forEach((feature) => {
            if (feature.geometry.type === "Polygon") {
              const formattedFeature = {
                type: "Feature",
                properties: {
                  name: city
                },
                geometry: feature.geometry
              };
              L.geoJSON(formattedFeature, {
                fillColor: "#ffcd00",
                color: "#ffcd00",
              }).addTo(this.map)
            }
          });
        }).catch((err) => console.log(err, city));
  };

  prepareMap = (latlng) => {
    this.map = L.map('mapContainer', {
      worldCopyJump: true
    }).setView(latlng, 3);

    L.tileLayer('https://api.tiles.mapbox.com/styles/v1/{username}/{id}/tiles/{tileSize}/{z}/{x}/{y}?access_token={accessToken}', {
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      minZoom: 3,
      maxZoom: 6,
      username: 'astrocket',
      id: 'cjyn2ft7129l21cny920m241n',
      accessToken: 'pk.eyJ1IjoiYXN0cm9ja2V0IiwiYSI6ImNqeW4yMXB5NzBwZTMzYm50cjV1NGphYWkifQ.djR2koLnkaQdj9qALMlJUg'
    }).addTo(this.map);
  };

  connect() {
    navigator.geolocation.getCurrentPosition((location) => {
      const latlng = new L.LatLng(location.coords.latitude, location.coords.longitude);
      this.prepareMap(latlng);
    }, () => {
      this.prepareMap([37.5663, 126.9997]);
    });

    ["Vladivostok, Russia",
      "Seoul, Korea", "Busan, Korea", "Jeju, Korea",
      "Hanoi, Vietnam", "Vung Tau, Vietnam", "Muine, Vietnam", "Danang, Vietnam",
      "Guam", "Sydney, Australia",
        "Kentucky, USA", "Virginia, USA", "California, USA",
      "Toronto, Canada", "Vancouver, Canada", "Yellowknife, Canada",
        "Tokyo, Japan", "Fukuoka, Japan", "Bangkok", "Beijing", "Singapore", "Phuket",
        "Da Lat", "Kuala Lumpur", "Bali, Indonesia", "Cancun, Mexico",
        "Ulaanbaatar, Mongolia"
    ].forEach((city) => {
      this.setPolygon(city);
    });
  }
}