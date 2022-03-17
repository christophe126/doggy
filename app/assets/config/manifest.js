//= link_tree ../images
//= link_directory ../stylesheets .css
// app/assets/config/manifest.json.erb
{
  "background_color": "white",
    "description": "Le Wagon is Europe's best coding bootcamp for creative people & entrepreneurs. Learn to code in 9 weeks with our fullstack coding bootcamp.""Nous vous aidons à trouver une solution d'hébergement pour vos animaux de compagnies sur la route des vacances, ou que vous alliez nous trouverons ou les garder.",
      "display": "fullscreen",
    "name": "Place for pets",
          "icons": [
    <% files = Dir.entries(Rails.root.join("app/assets/images/icons/")).select {| f | !File.directory ? f} %>
    <% files.each_with_index do | file, index | %>
      <% match = file.match(/.+-(?<size>\d{2,3}x\d{2,3}).png/) %>
  {
    "src": "<%= image_path "icons/#{ file } " %>",
      "sizes": "<%= match && match[:size] %>",
        "type": "image/png"
      }<%= "," unless(files.size - 1) == index %>
    <% end %>
  ]
}
