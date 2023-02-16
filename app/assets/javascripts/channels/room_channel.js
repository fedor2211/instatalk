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
          this.addNewMessage(data["message"])
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
        addNewMessage(messageData) {
          let newMessageNode = document.createElement("div")
          newMessageNode.classList.add("row", "message", "mt-1")

          let nicknameNode = document.createElement("div")
          nicknameNode.classList.add("col-2", "font-weight-bold", "text-info")
          nicknameNode.innerText = messageData["nickname"]

          let contentNode = document.createElement("div")
          contentNode.classList.add("col-10")

          let createdAtNode = document.createElement("div")
          createdAtNode.classList.add("float-right", "small", "badge", "badge-light")
          createdAtNode.innerText = messageData["created_at"]

          let messageBodyNode = document.createElement("div")
          messageBodyNode.innerText = messageData["body"]

          contentNode.appendChild(createdAtNode)
          contentNode.appendChild(messageBodyNode)
          newMessageNode.appendChild(nicknameNode)
          newMessageNode.appendChild(contentNode)
          messagesNode.appendChild(newMessageNode)
        }
      }
    )
  }
})
