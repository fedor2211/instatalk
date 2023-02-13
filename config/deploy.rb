# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "my_app_name"
set :repo_url, "git@github.com:fedor2211/instatalk.git"
set :branch, "main"
set :deploy_to, "/home/instatalk/app"

# Default value for :linked_files is []
append :linked_files, ".env.production", 'config/master.key', 'config/credentials/production.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
