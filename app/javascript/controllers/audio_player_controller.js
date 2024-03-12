import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio-player"
export default class extends Controller {
  static targets = ["bot"]

  connect() {
    console.log("Should play")
    this.botTarget.play()
  }
}
