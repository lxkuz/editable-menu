rails_env = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'production'
deploy_to  = "#{ ENV['HOME']}/Moscow_stairs"

listen "#{ deploy_to }/shared/tmp/sockets/unicorn.sock"
pid    "#{ deploy_to }/shared/tmp/pids/unicorn.pid"

stderr_path  'log/unicorn.stderr.log'
stdout_path  'log/unicorn.stdout.log'

worker_processes 4
timeout  360

preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"

  if old_pid != server.pid
     begin
       sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
       Process.kill(sig, File.read(old_pid).to_i)
     rescue Errno::ENOENT, Errno::ESRCH
     end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
