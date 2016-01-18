require 'optparse'
require 'ostruct'

class Options

  def self.parse(args)
    options = OpenStruct.new
    options.list = false 
    options.url = '' 
    options.title = ''
    options.search = ''
    options.last = ''
    options.label = ''

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
      
      opts.on('-c', '--list [STRING]', 'Add a category to the file') do |t|
	options.category = t 
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
