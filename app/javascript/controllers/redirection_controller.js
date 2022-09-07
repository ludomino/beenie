import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="redirection"
export default class extends Controller {
  static values = {
    url: String
  }
  connect() {
  }
  next() {
    window.open(this.urlValue, '_blank').focus();
  }
}
