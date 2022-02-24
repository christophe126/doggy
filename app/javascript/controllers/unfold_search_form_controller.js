import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log("du travail, encore du travail");
    console.log(this.Target);
  }

  static targets = ['form']

  unfold(event) {
    console.log('lalala')
    this.formTarget.classList.add('unfolded')
  }
}
// this.formTarget.setAttribute('height', '450px')
