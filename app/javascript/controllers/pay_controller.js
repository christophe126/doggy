import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ['emailplaceholder', 'cardplaceholder', 'validplaceholder', 'CCVplaceholder', 'nameplaceholder', 'regionplaceholder' ]

  changemail() {
    const element = this.emailplaceholderTarget
    element.value = "C.Techer@pets.com"
  }

  changenumber() {
    const element = this.cardplaceholderTarget
    element.value = "XXXX XXXX XXXX XXXX"
  }

  changevalid() {
    const element = this.validplaceholderTarget
    element.value = "XX/XX"
  }

  changeCCV() {
    const element = this.CCVplaceholderTarget
    element.value = "XXX"
  }

  changename() {
    const element = this.nameplaceholderTarget
    element.value = "Christophe Techer"
  }

  changeregion() {
    const element = this.regionplaceholderTarget
    element.value = "Nouvelle-Aquitaine"
  }

}
