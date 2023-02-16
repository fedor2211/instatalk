class UsersOnlineService < ApplicationService
  REDIS_CONNECTION = UsersOnlineChannel::REDIS_CONNECTION

  def call
    Rails.logger.info("executing online users service")
    broadcast_online_users
  end

  private

  def broadcast_online_users
    online_users = REDIS_CONNECTION.hgetall("instatalk_users_connections")
                                   .filter_map { |key, value| key if value.to_i.positive? }
    ActionCable.server.broadcast("instatalk_online_users", { users: online_users })
    Rails.logger.info("broadcasting online users list #{online_users}")
  end
end
