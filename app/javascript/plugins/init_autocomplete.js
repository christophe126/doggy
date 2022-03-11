import places from 'places.js';

const initAutocomplete = () => {
  const addressStartInput = document.getElementById('user_search_start_address');
  const addressEndInput = document.getElementById('user_search_end_address');

  if (addressStartInput) {
    places({ container: addressStartInput, countries: ['fr'] });
  }
  if (addressEndInput) {
    places({ container: addressEndInput, countries: ['fr'] });
  }
};

export { initAutocomplete };
