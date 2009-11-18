task :default => :spec
require 'spec/rake/spectask'
Spec::Rake::SpecTask.new {|t| t.spec_opts = ['--color']}

begin
  project = 'textfilter'
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = project
    gem.summary = "ActiveRecord/Rails filter text fields before assigning them"
    gem.email = "grosser.michael@gmail.com"
    gem.homepage = "http://github.com/grosser/#{project}"
    gem.authors = ["Michael Grosser"]
    gem.files += (FileList["{lib,spec}/**/*"] + FileList["VERSION"] + FileList["README.markdown"]).to_a.sort
    gem.add_dependency ['activerecord']
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end