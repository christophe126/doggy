import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    //console.log("du travail, encore du travail");
  }

  static targets = ['form', 'nbpensionresult', 'pensionresult', 'mapdisplay', 'pensionresultlist' ]

  unfold(event) {
    //console.log(event)
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

  showDivListPension(event) {
    // on masque le formulaire
    this.formTarget.classList.add('mask_div')
    // on masque la carte
    this.mapdisplayTarget.classList.add('mask_div')
    // on masque la div avec le nb de resultat
    this.nbpensionresultTarget.classList.add('mask_div')
    // on affiche la div voir la carte
    this.pensionresultTarget.classList.remove('mask_div')
    this.pensionresultTarget.classList.add('display_div')
    // on affiche la div liste des pensions
    this.pensionresultlistTarget.classList.remove('mask_div')
    this.pensionresultlistTarget.classList.add('display_div')
  }

  hideDivListPension(event) {

    //On masque la div liste des pensions
    this.pensionresultlistTarget.classList.remove('display_div')
    //On masque la div liste voir la carte
    this.pensionresultTarget.classList.remove('display_div')
    // on affiche la div nb de resultat
    this.nbpensionresultTarget.classList.remove('mask_div')
    // on affiche la map
    this.mapdisplayTarget.classList.remove('mask_div')
    // on affiche le formulaire
    this.formTarget.classList.remove('mask_div')
  }

}
// this.formTarget.setAttribute('height', '450px')
