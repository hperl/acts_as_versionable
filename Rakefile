require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the acts_as_versionable plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the acts_as_versionable plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ActsAsVersionable'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "acts_as_versionable"
    gem.summary = "Add support for versions to your model"
    gem.email = "henning.perl@gmail.com"
    gem.homepage = "http://github.com/hperl/acts_as_versionable"
    gem.authors = ["Pavel Y.", "Henning Perl"]
    gem.files = Dir["*", "{lib}/**/*"]
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end