import flatpickr from "flatpickr";

const initFlatpickr = () => {

  console.log("fghjkl");
  flatpickr(".datepicker", {
    allowInput: true
  });
};

export { initFlatpickr };