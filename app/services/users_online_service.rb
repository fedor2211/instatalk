class UsersOnlineService < ApplicationService
  REDIS_CONN_FOR_SUBS = ApplicationCable::Channel::REDIS_CONN_FOR_SUBS
  REDIS_USERS_CONNS_HASH = 'instatalk_users_connections'.freeze
  STREAM_NAME = 'instatalk_online_users'.freeze

  def call
    Rails.logger.info("executing online users service")
    broadcast_online_users
  end

  private

  def broadcast_online_users
    online_users = render_online_users
    ActionCable.server.broadcast(
      STREAM_NAME,
      { users: online_users }
    )
    Rails.logger.info("broadcasting online users list #{online_users}")
  end

  def render_online_users
    users_online = REDIS_CONN_FOR_SUBS.hgetall(REDIS_USERS_CONNS_HASH)
                                      .filter_map { |key, value| key if value.to_i.positive? }
    ApplicationController.render(
      partial: 'users/online',
      locals: { users: users_online }
    )
  end
end
