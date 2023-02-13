module UserCache
  ONLINE_USERS_STORAGE = 'instatalk_online_users'.freeze

  def self.included(obj)
    obj.extend(ClassMethods)
  end

  module ClassMethods
    def online
      Rails.cache.redis.smembers(ONLINE_USERS_STORAGE)
    end
  end

  def set_online!
    Rails.cache.redis.sadd?(ONLINE_USERS_STORAGE, self.nickname)
  end

  def set_offline!
    Rails.cache.redis.srem?(ONLINE_USERS_STORAGE, self.nickname)
  end
end
