import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "btn", "cards","swipeListFuture", "swipeListPast" ]

  switchView(e) {

    if (!e.currentTarget.classList.contains("active")) {
      this.btnTargets.forEach((btn) => {
        btn.classList.toggle("active");
      });
    
      this.cardsTargets.forEach((cards) => {
        cards.classList.toggle("hidden");
      });
      
    // this.swipeListPastTarget.classList.toggle('swiped-list-right');
    // this.swipeListFutureTarget.classList.toggle('swiped-list-left');
   } 
  }
};
