require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

PKG_FILES = FileList[
  '[a-zA-Z]*',
  'app/**/*',
  'lib/**/*',
  'tasks/**/*',
  'test/**/*'
]

begin
  GEM = "acts_as_static_controller"
  AUTHOR = "Vlad Alive"
  EMAIL = "vladalive@gmail.com"
  SUMMARY = "Rails Plugin: Creates StaticPages Controller to serve static pages."
  HOMEPAGE = "http://github.com/vladalive/acts_as_static_controller"
  
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = GEM
    s.summary = SUMMARY
    s.email = EMAIL
    s.homepage = HOMEPAGE
    s.description = SUMMARY
    s.authors = [AUTHOR]
    
    s.require_path = 'lib'
    s.files = PKG_FILES.to_a
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

desc 'Generate documentation for the acts_as_static_controller plugin.'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'crack'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Test the acts_as_static_controller plugin.'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = false
end
