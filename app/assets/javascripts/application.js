// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./channels/room_channel"
import "./channels/users_online_channel"

window.onpopstate = () => window.location.reload()
