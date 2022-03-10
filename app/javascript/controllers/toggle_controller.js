import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "btnLeft", "btnRight" ]

  connect() {
    this.btnLeft.Target.textContent = 'Hello, Stimulus!'
  }
}
