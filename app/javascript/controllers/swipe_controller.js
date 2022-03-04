import { Controller } from "stimulus";

export default class extends Controller {

  connect() {
    console.log('swipe controller: connected')
  }
  static targets = ['mega', 'txt', 'formulus', 'formulusmaster']

  verticalSwipe(event) {

    console.log(event)

    this.megaTarget.classList.toggle('swiped-mega')
    this.txtTarget.classList.toggle('swiped-txt')
    this.formulusmasterTarget.classList.toggle('swiped-formulus-container')
    this.formulusTarget.classList.toggle('swiped-formulus')
  }
}
