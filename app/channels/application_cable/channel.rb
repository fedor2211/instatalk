module ApplicationCable
  class Channel < ActionCable::Channel::Base
    REDIS_CONN_FOR_SUBS = ActionCable.server.pubsub.redis_connection_for_subscriptions
  end
end
