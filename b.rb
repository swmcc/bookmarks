#!/usr/bin/env ruby

require 'optparse'
require 'ostruct'
require 'pp'

class Options

  def self.parse(args)
    options = OpenStruct.new
    options.list = false 
    options.url = '' 
    options.title = ''

    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: l [options]'
      opts.separator ''
      opts.separator 'Specific options:'

      opts.on('-l', '--list', 'Show the whole file') do |l|
        Links.list_file()
      end

      opts.on('-u', '--url [STRING]', 'Add a url to the file') do |u|
	options.url = u 
      end 
      
      opts.on('-t', '--title [STRING]', 'Add a title to the file') do |t|
	options.title = t 
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

  def self.add_entry(args)
    File.open(LINK_FILE, 'a+') { |f| f.puts(self.format_for_display(args)) }
  end

  def self.format_for_display(args)
    "#{args['title']} - #{args['url']}"
  end
end

options = Options.parse(ARGV)

unless options['url'].empty? && options['title'].empty?
  Links.add_entry(options)
end

