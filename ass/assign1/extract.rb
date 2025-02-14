#!/usr/bin/env ruby

def usage(message = nil)
  if message != nil
    puts message
    puts
  end

  puts 'USAGE: extract.rb PREFIX STAT COUNT...'
  exit 1
end

usage 'PREFIX not specified.' if ARGV.length < 1
usage 'STAT not specified.' if ARGV.length < 2
usage 'No COUNTs specified.' if ARGV.length < 3

prefix = ARGV[0]
stat = ARGV[1]
counts = ARGV[2..]

counts.each do |count|
  file = "#{prefix}#{count}/stats.txt"
  stats = [count]
  File.read(file).split("\n").each do |line|
    tokens = line.split(' ')
    stats << tokens[1] if tokens[0] == stat
  end
  puts stats.join(",")
end
