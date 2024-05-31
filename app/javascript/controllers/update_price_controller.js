import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="update-price"
export default class extends Controller {
  connect() {
    console.log('update price')
  }
  setPrice(event) {
    console.log('set price')
  }
}
