class UsersOnlineChannel < ApplicationCable::Channel
  REDIS_USERS_CONNS_HASH = 'instatalk_users_connections'.freeze
  STREAM_NAME = 'instatalk_online_users'.freeze

  def subscribed
    logger.info("user #{current_user.id} is online")
    REDIS_CONN_FOR_SUBS.hincrby(REDIS_USERS_CONNS_HASH, current_user.nickname, 1)
    stream_from STREAM_NAME
    UsersOnlineService.call
  end

  def unsubscribed
    user_connections = REDIS_CONN_FOR_SUBS.hincrby(REDIS_USERS_CONNS_HASH, current_user.nickname, -1)
    logger.info("user #{current_user.id} is offline") if user_connections <= 0
    UsersOnlineService.call
  end
end
