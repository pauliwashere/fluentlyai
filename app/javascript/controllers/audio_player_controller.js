import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bot"]

  connect() {
    const allAudioElements = document.querySelectorAll('audio');
    const lastAudioElement = allAudioElements[allAudioElements.length - 1];

    if (this.botTarget === lastAudioElement) {
      this.botTarget.play();
    }
  }

  replay() {
    this.botTarget.currentTime = 0
    this.botTarget.play()
  }
}
