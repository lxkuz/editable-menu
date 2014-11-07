set :output, "/home/deploy/Moscow_stairs/current/log/cron_log.log"

job_type :runner_with_rvm, "cd #{path.gsub(/\/[0-9]*$/, '/current')} && RAILS_ENV=production /home/deploy/.rvm/wrappers/ruby-2.1.3/bundle exec rails runner ':task' :output"

every 1.day do
  runner_with_rvm "Settings.increace_total_stairs_sold"
end

# Learn more: http://github.com/javan/whenever
