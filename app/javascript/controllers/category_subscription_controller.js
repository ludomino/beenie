import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="category-subscription"

export default class extends Controller {
  static values = { categoryId: Number, userId: Number, userName: String }
  static targets = ["messages", "sendername"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "CategoryChannel", id: this.categoryIdValue },


      { received: this.#processMessage.bind(this) }
    )
    console.log(`Subscribe to the category with the id ${this.categoryIdValue}.`)
    this.#scrollToBottom()
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  #processMessage(data) {
    const sender = this.userIdValue == data.user_id
    const msgElement = this.#buildHTML(data.html).firstElementChild
    if (!sender) {
      msgElement.classList.remove('sender')
      msgElement.querySelector('strong').innerText = data.username
      msgElement.querySelector('.message-infos').insertAdjacentHTML('afterbegin', `<img src="${data.user_photo_url}" class="avatar-bordered-small me-2">`)
    }
    this.#insertMessage(msgElement)
    this.#scrollToBottom()
  }



   #buildHTML(string) {
    const tmpDiv = document.createElement('div')
    tmpDiv.innerHTML = string

    return tmpDiv.firstElementChild
  }
  #insertMessage(element) {
    this.messagesTarget.appendChild(element)
  }

  #scrollToBottom() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
