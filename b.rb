#!/usr/bin/env ruby

require 'optparse'
require 'ostruct'

class Options

  def self.parse(args)
    options = OpenStruct.new
    options.list = false 
    options.add = [] 

    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: l [options]'
      opts.separator ''
      opts.separator 'Specific options:'

      opts.on('-l', '--list', 'Show the whole file') do |l|
        options.list = l 
        puts Links.list_file()
	exit
      end

      opts.on('-a', '--add', 'Add an entry to the file') do |a|
        puts a
	options.add << a 
      end 

      opts.on_tail('-h', '--help', 'Show this message') do
	puts opts
	exit
      end
    end

    opt_parser.parse!(args)
    options
  end
end

class Links
  LINK_FILE = '/Users/swm/Dropbox/links.txt'

  def self.read_file
    File.open(LINK_FILE).read
  end

  def self.list_file
    self.read_file
  end

  def self.add_url(args)
    puts args
  end
end

Options.parse(ARGV)
