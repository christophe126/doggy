// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "controllers"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
<<<<<<< HEAD
import { initFlatpickr } from '../plugins/init_flatpickr';
=======
// import { initToggleBtn } from '../plugins/init_toggle_btn';
import  twilioInit  from '../plugins/twilio.js';
>>>>>>> d25af4234e0a2c0442ecf3c851492d7958fb6e57

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAutocomplete();
<<<<<<< HEAD
  initFlatpickr();
=======
  // initToggleBtn();
  if (document.querySelector('.twilio-video')) {
    twilioInit();
  }
>>>>>>> d25af4234e0a2c0442ecf3c851492d7958fb6e57
})
