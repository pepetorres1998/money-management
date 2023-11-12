import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "startingInput"]

  close(event) {
    console.log("esc pressioned")
    console.log(this.formTarget)
    this.formTarget.classList.add("hidden")
  }

  connect() {
    this.startingInputTarget.focus()
    this.startingInputTarget.select()
  }
}
