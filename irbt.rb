# coding: utf-8
# An IRB + full_clone test bed

require 'irb'
$force_alias_read_line_module = true
require 'mini_readline'

puts "Starting an IRB console with full_clone loaded."

if ARGV[0] == 'local'
  require_relative 'lib/full_clone'
  puts "full_clone loaded locally: #{FullClone::VERSION}"

  ARGV.shift
else
  require 'full_clone'
  puts "full_clone loaded from gem: #{FullClone::VERSION}"
end

IRB.start
