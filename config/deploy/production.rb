set :unicorn_rack_env, 'production'

set :user,       'deploy'
set :ip_machine, '178.62.155.127'

set :deploy_to,           "/home/#{ fetch(:user) }/#{ fetch(:application) }"
set :unicorn_config_path, "#{ fetch(:deploy_to) }/current/config/unicorn.rb"
set :unicorn_pid,         "#{ fetch(:deploy_to) }/shared/tmp/pids/unicorn.pid"
set :domain,              "#{ fetch(:user) }@#{ fetch(:ip_machine) }"

role :app, ["#{ fetch(:user) }@#{ fetch(:ip_machine) }"]
role :web, ["#{ fetch(:user) }@#{ fetch(:ip_machine) }"]
role :db,  ["#{ fetch(:user) }@#{ fetch(:ip_machine) }"]
