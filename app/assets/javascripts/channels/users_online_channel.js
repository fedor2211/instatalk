import consumer from "./consumer"

document.addEventListener("turbo:load", () => {
  consumer.subscriptions.create(
    {
      channel: "UsersOnlineChannel",
    },
    {
      initialized() {
        console.log("subscription to online users stream initialized")
      },
      connected() {
        console.log("connected to online users stream")
      },
      disconnected() {
        console.log("disconnected from online users stream")
      },
      received(data) {
        this.addOnlineUsersList(data["users"])
      },
      rejected() {
        console.error("subscription rejected by server")
      },
      addOnlineUsersList(usersList) {
        let usersOnlineNode = document.getElementById("users-online")
        if (usersOnlineNode) {
          let usersOnlineListNode = document.createElement("span")
          usersOnlineListNode.textContent = usersList.join(", ")
          usersOnlineNode.appendChild(usersOnlineListNode)
        }
      }
    }
  )
})
