import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "startingInput", "cancelButton", "submitButton"]

  close() {
    if (this.formTarget.id === "form_monthly_expense") {
      this.formTarget.classList.add("hidden")
    } else {
      this.cancelButtonTarget.click()
      this.submitButtonTarget.click()
    }
  }

  connect() {
    this.startingInputTarget.focus()
    this.startingInputTarget.select()
  }
}
