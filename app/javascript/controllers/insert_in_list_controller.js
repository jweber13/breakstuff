import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]

  connect() {
    // console.log(this.element)
    // console.log(this.itemsTarget)
    // console.log(this.formTarget)
    console.log("here")
  }

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then(data => {
        if (data.review_html) {
          this.itemsTarget.insertAdjacentHTML('beforeend', data.review_html)
        }
        this.formTarget.outerHTML = data.form_html
      })
  }

}
