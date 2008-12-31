require 'rubygems'
require 'spec'

desc 'Default: run spec.'
task :default => :spec

desc "Run all specs in spec directory"
task :spec do |t|
  options = "--colour --format progress --loadby --reverse"
  files = FileList['spec/**/*_spec.rb']
  system("spec #{options} #{files}")
end

require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('concat_rpc', '0.1.0') do |p|
  p.description    = "Api for 20Sec Concat - Contact managing"
  p.url            = "http://github.com/grosser/concat_rpc"
  p.author         = "Michael Grosser"
  p.email          = "grosser.michael@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*", "spec/credentials", "nbproject/*"]
  p.dependencies   = ['activesupport']
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

task :refresh_gemspec do
  puts "updating..."
  `rake manifest`
  `rake build_gemspec`
end