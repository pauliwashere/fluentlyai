import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="conversation-window-scrolling"
export default class extends Controller {

  connect() {
    console.log("hello")
    // const chat = document.getElementById("chat");
    // chat.addEventListener("DOMNodeInserted", this.scroll);
    // this.scroll(chat)
    // this.window.addEventListener("turbo:load", () => {
    // console.log("New page loaded!");
    // window.addEventListener("turbo:render", () => {
    //   scrollDown();
    // window.addEventListener("load", this.scrollDown());
    // window.scrollTo(0, document.body.scrollHeight)
    // });
  }

  scroll(event) {
    // chat.scrollTop = chat.scrollHeight - chat.clientHeight;
    console.log("Woooho")
    event.preventDefault();
    // location.reload()
    window.scrollTo(0, document.body.scrollHeight)
    }
}
