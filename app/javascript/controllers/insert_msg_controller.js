import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-msg"
export default class extends Controller {
  static targets = ["form", "input", "conversation"]

  connect() {
    console.log("hello")
  }

  scroll(event) {
    event.preventDefault();
    console.log("Woooho")

    fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.conversationTarget.outerHTML = data
        this.inputTarget.value = ""
      })
  }

}
