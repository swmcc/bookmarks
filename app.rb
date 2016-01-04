#!/usr/bin/env ruby

require_relative 'lib/links.rb'
require_relative 'lib/options.rb'

options = Options.parse(ARGV)

unless options['url'].empty? && options['title'].empty?
  Links.add_entry(options)
end

