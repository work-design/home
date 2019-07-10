dir = ENV['PWD']

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

state_path "#{File.expand_path('tmp/sockets/puma.state', dir)}"

#plugin :tmp_restart