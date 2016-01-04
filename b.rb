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
        Links.list_file()
      end

      opts.on('-a', '--add', 'Add an entry to the file') do |a|
	options.add << a 
        Links.add_url(a)
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
    puts self.read_file
  end

  def self.add_url(args)
    puts args
  end
end

Options.parse(ARGV)
