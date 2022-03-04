import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    //console.log("du travail, encore du travail");
  }

  static targets = ['form', 'txt', 'mega' ]

  unfold(event) {
    console.log(event)
    //this.formTarget.classList.add('unfolded')
    if (
      this.formTarget.classList.value === "" ||
      this.formTarget.classList.value === "folded"
     ) {
      this.formTarget.classList.remove('folded')
      this.formTarget.classList.add('unfolded')
    } else {
      this.formTarget.classList.remove('unfolded')
      this.formTarget.classList.add('folded')
    }
  }
}
