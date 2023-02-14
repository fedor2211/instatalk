class OnlineUsersService < ApplicationService
  def call
    broadcast_online_users
  end

  private

  def broadcast_online_users
    ActionCable.server.broadcast(
      'instatalk_online_users',
      { users: render_online_users }
    )
  end

  def render_online_users
    ApplicationController.renderer.render(
      partial: 'users/online',
      locals: { users: User.online }
    )
  end
end
