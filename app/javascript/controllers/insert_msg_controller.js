import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-msg"
export default class extends Controller {
  static targets = ["form", "input", "conversation"]

  connect() {

  }

  insertMsg(event) {
    event.preventDefault();
    this.formTarget.disabled = true;

    fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.conversationTarget.outerHTML = data
        this.inputTarget.value = ""
        var objDiv = document.getElementById("chat");
        objDiv.scrollTop = objDiv.scrollHeight;
      });
    this.formTarget.disabled = false;
  }

}
