gem 'rails_com'
require 'rails_com/utils/deploy'
require 'optparse'

options = { env: 'staging' }
OptionParser.new do |opts|
  opts.on('-e ENV') do |v|
    options[:env] = v
  end
end.parse!

if ARGV.include? 'enable_precompile'
  Deploy.works(options[:env], skip_precompile: false)
else
  Deploy.works(options[:env], skip_precompile: true)
end
