# frozen_string_literal: true

require 'open3'
require 'optparse'
require 'pathname'

module Deploy
  MOVED_DIRS = [
    'log',
    'tmp',
    'storage',
    'node_modules'
  ]
  SHARED_DIRS = [
    'public/packs',
    'vendor/bundle'
  ].freeze
  SHARED_FILES = [
    'config/database.yml',
    'config/credentials/staging.key',
    'config/credentials/production.key'
  ].freeze
  INIT_DIRS = [
    'tmp/sockets',
    'tmp/pids',
    'config/credentials'
  ].freeze
  extend self

  def restart

  end

  def github_hmac(data)
    OpenSSL::HMAC.hexdigest('sha1', RailsCom.config.github_hmac_key, data)
  end

  def init_shared_paths(root = Pathname.pwd.join('../shared'))
    dirs = []
    dirs += SHARED_DIRS.map { |dir| root.join(dir) }
    dirs += INIT_DIRS.map { |dir| root.join(dir) }
    FileUtils.mkdir_p dirs

    SHARED_FILES.map do |path|
      `touch #{root.join(path)}`
    end
  end

  def ln_shared_paths(root = Pathname.pwd)
    cmds = []
    cmds << 'bundle config set --local deployment true'
    cmds << 'bundle config set --local path vendor/bundle'
    cmds << 'bundle config set --local without development test'
    cmds += MOVED_DIRS.map do |path|
      "rm -rf #{root.join(path)}"
    end
    cmds += (MOVED_DIRS + SHARED_DIRS).map do |path|
      "ln -Tsfv #{root.join('../shared', path)} #{root.join(path)}"
    end
    cmds += SHARED_FILES.map do |path|
      "ln -Tsfv #{root.join('../shared', path)} #{root.join(path)}"
    end
    cmds.each do |cmd|
      exec_cmd(cmd)
    end
  end

  def exec_cmds(env, added_cmds: [], **options)
    cmds = []
    cmds << 'git pull'
    cmds << 'bundle install'
    cmds << "RAILS_ENV=#{env} bundle exec rake db:migrate"
    cmds << 'bundle exec pumactl restart'
    cmds += Array(added_cmds)
    cmds.each do |cmd|
      exec_cmd(cmd)
    end
  end

  def exec_cmd(cmd)
    Open3.popen2e(cmd) do |_, output, thread|
      puts "=====> #{cmd} (PID: #{thread.pid})"
      output.each_line do |line|
        puts line
      end
    end
  end

end

options = { env: 'staging' }
OptionParser.new do |opts|
  opts.on('-e ENV') do |v|
    options[:env] = v
  end
end.parse!

if $0 == __FILE__
  Deploy.exec_cmds(options[:env], added_cmds: 'systemctl --user restart sidekiq_work')
end
