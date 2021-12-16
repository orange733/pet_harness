// Initialize and add the map
function initMap(gps) {
  // The location of Uluru
  // const uluru = { lat: 35.197686, lng: 126.812749833 }
  // The map, centered at Uluru
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 15,
    center: gps,
  });
  // The marker, positioned at Uluru
  const marker = new google.maps.Marker({
    position: gps,
    map: map,
  });
}