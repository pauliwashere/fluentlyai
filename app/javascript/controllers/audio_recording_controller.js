import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio-recording"
export default class extends Controller {
  static targets = ["recordButton", "input"]

  connect() {
    this.recording = false;
  }

  startRecording() {
    navigator.mediaDevices.getUserMedia({ audio: true })
      .then(stream => {
        this.mediaRecorder = new MediaRecorder(stream);
        let audioChunks = [];

        this.mediaRecorder.addEventListener("dataavailable", event => {
          audioChunks.push(event.data);
        });

        this.mediaRecorder.start();
        this.recording = true;
        // this.recordButtonTarget.textContent = "Recording...";
        setTimeout(() => this.mediaRecorder.stop(), 10000); // Stop recording after 10 seconds

        this.mediaRecorder.addEventListener("stop", () => {
          // let audioBlob = new Blob(audioChunks, { type: this.mediaRecorder.mimeType });
          // console.log("Audio Blob MIME Type:", audioBlob.type);
          let audioBlob = new Blob(audioChunks, { type: "audio/mp3" });
          // console.log(audioChunks)
          // console.log("Audio Blob Type:", audioBlob.type);
          this.sendAudio(audioBlob);
        });
      })
      .catch(error => console.error("Error accessing microphone:", error));
  }

  stopRecording() {
    if (this.mediaRecorder) {
      this.mediaRecorder.stop();
      this.recording = false;
      // this.recordButtonTarget.textContent = "Record"; // Update button text

    }
  }

  sendAudio(audioBlob) {
    let formData = new FormData();
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    // formData.append("csrf", audioBlob)
    formData.append("audio", audioBlob);

    fetch("/process_audio", {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Accept": "text/plain" // Include CSRF token in request headers
      },
      body: formData
    })
    .then(response => response.text())
    .then(data => {
      console.log(data);
      const text = data;
      this.inputTarget.value = text;
      console.log(this.inputTarget.value)
      })
    .catch(error => console.error("Error processing audio:", error));
  }
}
