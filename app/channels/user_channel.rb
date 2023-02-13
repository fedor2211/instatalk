class UserChannel < ApplicationCable::Channel
  def subscribed
    current_user.set_online!
    logger.info("user #{current_user.id} is online")
    stream_from 'global_online_users'
    OnlineUsersService.call
  end

  def unsubscribed
    current_user.set_offline!
    logger.info("user #{current_user.id} is offline")
    OnlineUsersService.call
  end
end
