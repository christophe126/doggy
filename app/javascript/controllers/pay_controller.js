import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ['emailplaceholder', 'cardplaceholder', 'validplaceholder', 'CCVplaceholder', 'nameplaceholder', 'regionplaceholder' ]

  changemail() {
    const element = this.emailplaceholderTarget
    element.value = "C.Techer@pets.com"
    this.cardplaceholderTarget.value = "3457 2789 6035 5437"
    this.validplaceholderTarget.value = "03/22"
    this.CCVplaceholderTarget.value = "567"
    this.nameplaceholderTarget.value = "Christophe Techer"
    this.regionplaceholderTarget.value = "Nouvelle-Aquitaine"

  }
}
