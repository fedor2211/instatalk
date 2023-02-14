module UserCache
  ONLINE_USERS_STORAGE = 'instatalk_online_users'.freeze

  def self.included(obj)
    obj.extend(ClassMethods)
  end

  module ClassMethods
    def online
      ActionCable.server.pubsub.redis_connection_for_subscriptions.smembers(ONLINE_USERS_STORAGE)
    end
  end

  def set_online!
    ActionCable.server.pubsub.redis_connection_for_subscriptions.sadd?(ONLINE_USERS_STORAGE, self.nickname)
  end

  def set_offline!
    ActionCable.server.pubsub.redis_connection_for_subscriptions.srem?(ONLINE_USERS_STORAGE, self.nickname)
  end
end
