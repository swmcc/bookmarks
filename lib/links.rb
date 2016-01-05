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
    "#{args['title']} - #{args['url']} - #{self.timestamp}"
  end

  def self.search_file(args)
    File.open(LINK_FILE) { |f| f.grep(/#{args}/i) }
  end

  def self.timestamp
    Time.now.strftime("%A %Y-%m-%d %H:%M")
  end

end
