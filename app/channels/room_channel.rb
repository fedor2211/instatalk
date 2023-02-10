class RoomChannel < ApplicationCable::Channel
  def subscribed
    logger.info "subscribed to channel, RoomId - [#{params[:roomId]}]"
    @room = Room.find(params[:roomId])
    stream_from "room_channel_#{@room.id}"
    speak({ message: '* * * joined the room * * *' })
  end

  def unsubscribed
    logger.info 'unsubscribed from channel'
    speak({ message: '* * * left the room * * *' })
  end

  def speak(data)
    data = data.map { |k, v| [k.to_sym, v] }.to_h
    logger.info "RoomChannel, speak: #{data.inspect}"
    MessageService.call(
      body: data[:message],
      user: current_user,
      room: @room
    )
  end
end
