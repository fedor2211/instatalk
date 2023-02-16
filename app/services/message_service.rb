class MessageService < ApplicationService
  def initialize(params)
    @body = params[:body]
    @user = params[:user]
    @room = params[:room]
  end

  def call
    create_message!
    broadcast_message
  end

  private

  def create_message!
    @message = Message.create(body: @body, room: @room, user: @user)
  end

  def broadcast_message
    ActionCable.server.broadcast(
      "room_channel_#{@room.id}",
      {
        message: {
          body: @message.body,
          nickname: @message.user.nickname,
          created_at: @message.created_at
        }
      }
    )
  end
end
