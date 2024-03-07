import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

import AudioPlayerController from "./controllers/audio_player_controller.js"
Stimulus.register("audio-player", AudioPlayerController)
