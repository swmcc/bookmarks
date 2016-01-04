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
    options.search = ''
    options.last = ''

    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage: l [options]'
      opts.separator ''
      opts.separator 'Specific options:'

      opts.on('-l', '--list', 'Show the whole file') do |l|
        puts Links.cat_file()
      end

      opts.on('-u', '--url [STRING]', 'Add a url to the file') do |u|
	options.url = u 
      end 
      
      opts.on('-t', '--title [STRING]', 'Add a title to the file') do |t|
	options.title = t 
      end 
      
      opts.on('-s', '--search [STRING]', 'Search for a string') do |s|
        puts Links.search_file(s)
      end 

      opts.on('-n', '--tail [INTEGER]', 'Show the last n bookmarks') do |n|
        puts Links.tail_file(n)
      end 

    end

    opt_parser.parse!(args)
    options
  end
end

class Links
  LINK_FILE = '/Users/swm/Dropbox/links.txt'

  def self.tail_file(args)
    `tail -n #{args} #{LINK_FILE}`
  end

  def self.cat_file
    File.open(LINK_FILE).read
  end

  def self.add_entry(args)
    File.open(LINK_FILE, 'a+') { |f| f.puts(self.format_for_display(args)) }
  end

  def self.format_for_display(args)
    "#{args['title']} - #{args['url']}"
  end

  def self.search_file(args)
    File.open(LINK_FILE) { |f| f.grep(/#{args}/i) }
  end
end

options = Options.parse(ARGV)

unless options['url'].empty? && options['title'].empty?
  Links.add_entry(options)
end

