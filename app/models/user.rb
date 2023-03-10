class User < ApplicationRecord
  before_create :generate_nickname

  private

  def generate_nickname
    loop do
      self.nickname = Faker::Name.first_name.downcase
      break unless User.where(nickname: self.nickname).exists?
    end
  end
end
