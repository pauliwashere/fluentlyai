import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio-recording"
export default class extends Controller {
  static targets = ["recordButton"]

  connect() {
  }

  startRecording() {
    navigator.mediaDevices.getUserMedia({ audio: true })
      .then(stream => {
        this.mediaRecorder = new MediaRecorder(stream);
        let audioChunks = [];

        this.mediaRecorder.addEventListener("dataavailable", event => {
          audioChunks.push(event.data);
        });

        this.mediaRecorder.addEventListener("stop", () => {
          let audioBlob = new Blob(audioChunks, { type: "audio/mp3" });
          this.sendAudio(audioBlob);
        });

        this.mediaRecorder.start();
        setTimeout(() => this.mediaRecorder.stop(), 5000); // Stop recording after 5 seconds
      })
      .catch(error => console.error("Error accessing microphone:", error));
  }

  sendAudio(audioBlob) {
    let formData = new FormData();
    formData.append("audio", audioBlob);

    fetch("/audio/process_audio", {
      method: "POST",
      body: formData
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.error("Error processing audio:", error));
  }
}
