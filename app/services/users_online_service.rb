class UsersOnlineService < ApplicationService
  REDIS_CONN_FOR_SUBS = ActionCable.server.pubsub.redis_connection_for_subscriptions
  REDIS_USERS_CONNS_HASH = 'instatalk_users_connections'.freeze
  STREAM_NAME = 'instatalk_online_users'.freeze

  def call
    broadcast_online_users
  end

  private

  def broadcast_online_users
    ActionCable.server.broadcast(
      STREAM_NAME,
      { users: render_online_users }
    )
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
