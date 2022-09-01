import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="category-subscription"

export default class extends Controller {
  static values = { categoryId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "CategoryChannel", id: this.categoryIdValue },
      { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data) }
    )
    console.log(`Subscribe to the category with the id ${this.categoryIdValue}.`)
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
}
