import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editable-form"
export default class extends Controller {
  static targets = ["editButton"]

  edit() {
    this.editButtonTarget.click()
  }
}
