gem 'rails_com'
require 'rails_com/utils/deploy'
require 'optparse'

options = { env: 'staging' }
OptionParser.new do |opts|
  opts.on('-e ENV') do |v|
    options[:env] = v
  end
end.parse!

Deploy.exec_cmds(options[:env], skip_precompile: !ARGV.include?('enable_precompile'))
