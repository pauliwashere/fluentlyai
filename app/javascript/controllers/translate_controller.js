import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  async translateMessage(event) {
    console.log('Translate button clicked')
    let target = event.target;
    // If the target is the icon, get the parent button
    if (target.tagName === 'I') {
      target = target.parentElement;
    }
    const messageId = target.dataset.messageId
    const translationDiv = target.nextElementSibling
    if (translationDiv && translationDiv.textContent) { // Added null check for translationDiv
      translationDiv.classList.toggle('hide')
    } else {
      try {
        const response = await fetch(`/conversations/${messageId}/translate`, { method: 'GET' })
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`)
        }
        const data = await response.json()
        if (translationDiv) { // Added null check for translationDiv
          translationDiv.textContent = `"${data.translation}"`
        }
      } catch (error) {
        console.log('Fetch error: ', error)
      }
    }
  }
}
