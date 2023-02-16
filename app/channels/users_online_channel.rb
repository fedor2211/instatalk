class UsersOnlineChannel < ApplicationCable::Channel
  REDIS_CONNECTION = ActionCable.server.pubsub.redis_connection_for_subscriptions

  def subscribed
    logger.info("user #{current_user.id} is online")
    REDIS_CONNECTION.hincrby("instatalk_users_connections", current_user.nickname, 1)
    stream_from "instatalk_online_users"
    UsersOnlineService.call
  end

  def unsubscribed
    user_connections = REDIS_CONNECTION.hincrby("instatalk_users_connections", current_user.nickname, -1)
    logger.info("user #{current_user.id} is offline") if user_connections <= 0
    UsersOnlineService.call
  end
end
