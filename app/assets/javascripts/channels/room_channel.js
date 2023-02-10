import consumer from "./consumer"

document.addEventListener("turbo:load", () => {
  let messagesNode = document.getElementById("messages")
  if (messagesNode) {
    let roomId = messagesNode.getAttribute("data-room-id")
    consumer.subscriptions.create(
      {
        channel: "RoomChannel",
        roomId: roomId
      },
      {
        initialized() {
          this.install()
          console.log("subscription object initialized")
        },
        connected() {
          console.log("connected to room")
        },
        disconnected() {
          console.log("disconnected from channel")
        },
        received(data) {
          console.log(`Received message ${data["message"]}`)
          messagesNode.insertAdjacentHTML("beforeend", data["message"])
        },
        rejected() {
          console.error("subscription rejected by server")
        },
        install() {
          let messageInput = document.getElementById("message_input")
          document.addEventListener("keypress", (e) => {
            let message = messageInput.value
            if (e.key === "Enter" && message) {
              this.perform("speak", { message: message })
              messageInput.value = ""
              e.preventDefault()
            }
          })
        },
      }
    )
  }
})
