import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio-player"
export default class extends Controller {

  connect() {
    // if (this.hasAudio) {
    //   this.audio.play();
    // }
    console.log(this.element)
  }

  // get hasAudio() {
  //   return this.data.has("audioUrl");
  // }

  // get audioUrl() {
  //   return this.data.get("audioUrl");
  // }

  // get audio() {
  //   return new Audio(this.audioUrl);
  // }
  fire() {
    this.element.audio.play();
  }   
 }
