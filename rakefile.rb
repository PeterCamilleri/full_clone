require 'rake/testtask'
require "bundler/gem_tasks"

#Run the unit test suite.
Rake::TestTask.new do |t|
  #List out all the test files.
  t.test_files = ["test/deep_clone_tests.rb",
                  "test/object_tests.rb",
                  "test/array_tests.rb",
                  "test/hash_tests.rb",
                  "test/struct_tests.rb"]
  t.verbose    = false
end

desc "Run a scan for smelly code!"
task :reek do |t|
  `reek --no-color lib > reek.txt`
end

desc "Run an IRB Session with full_clone loaded."
task :console do
  system "ruby irbt.rb local"
end

desc "What version of full_clone is this?"
task :vers do |t|
  puts
  puts "full_clone version = #{FullClone::VERSION}"
end
