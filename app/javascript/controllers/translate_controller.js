import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  async translateMessage(event) {
    console.log('Translate button clicked')
    const messageId = event.target.dataset.messageId
    const translationDiv = event.target.nextElementSibling
    if (translationDiv.textContent) {
      translationDiv.classList.toggle('hide')
    } else {
      try {
        const response = await fetch(`/conversations/${messageId}/translate`, { method: 'GET' })
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`)
        }
        const data = await response.json()
        translationDiv.textContent = `"${data.translation}"`
      } catch (error) {
        console.log('Fetch error: ', error)
      }
    }
  }
}
