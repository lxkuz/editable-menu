# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'Moscow_stairs'
set :rails_env,   'production'

set :repo_url,       'git@github.com:tataronrails/Moscow_stairs.git'
set :use_sudo,       false
set :pty,            true
set :bundle_without, [:development]
set :keep_releases,  5

set :rvm_type, :user
set :rvm_ruby_version, '2.1.3@default'

set :scm,    :git
set :branch, 'master'

set :linked_files, %w(config/database.yml config/secrets.yml)
set :linked_dirs,  %w{log tmp/sockets tmp/pids tmp/queue}

set :format, :pretty
set :ssh_options, {
    user: 'deploy' ,
    forward_agent: false,
    auth_methods: %w(publickey password) }

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:legacy_restart'
  end
end
