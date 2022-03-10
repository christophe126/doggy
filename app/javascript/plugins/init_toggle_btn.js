const initToggleBtn = () => {
  const bookingsToCome = document.getElementById('bookings-toggle-left')
  const bookingsPassed = document.getElementById('bookings-toggle-right')
  const today = new Date();
  const dateLimite = document.querySelectorAll('#date-limite');

  console.log(dateLimite)

  // if (dateLimite < today) {
  //   console.log("A VENIR");
  // } else (dateLimite > today) {
  //   console.log("PASSEE");
  // }




}

export { initToggleBtn };