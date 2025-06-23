#!/usr/bin/env ruby

require_relative 'lib/word_count'

# Simple command-line interface for the word count program
if ARGV.empty?
  puts "Usage: ruby wc.rb <filename>"
  exit 1
end

filename = ARGV[0]

begin
  wc = WordCount.new(filename)
  puts wc.to_s
rescue Errno::ENOENT
  puts "wc: #{filename}: No such file or directory"
  exit 1
rescue => e
  puts "Error: #{e.message}"
  exit 1
end 