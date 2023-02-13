class User < ApplicationRecord
  before_create :generate_nickname
  scope :online, -> { where(online: true) }

  def set_online!
    self.online = true
    save!
  end

  def set_offline!
    self.online = false
    save!
  end

  private

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end
end
