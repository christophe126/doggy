import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "btn", "cards", "swipeList" ]

  switchView(e) {
    if (!e.currentTarget.classList.contains("active")) {
      this.btnTargets.forEach((btn) => {
        btn.classList.toggle("active");
      });
      this.cardsTargets.forEach((cards) => {
        cards.classList.toggle("hidden");
      });
    }
  }
}
