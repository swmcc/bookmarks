require 'links.rb'

RSpec.describe "Links" do
  let(:links) do "codegangsta - https://codegangsta.io/
msh - http://hertzber.gs/
hoursintheday - https://medium.com/@itsmeduncan/you-only-have-so-many-hours-in-the-day-a8c004a21d72#.kk2gwrcu0
" 
  end

  before do
    stub_const("Links::LINK_FILE", 'spec/fixtures/links.txt')
  end

  it 'lists all the urls it should' do
    expect(Links.cat_file).to eq links 
  end

  it 'returns the correct url when searching' do
    expect(Links.search_file('msh').first.chomp).to eq 'msh - http://hertzber.gs/'
  end

  it 'returns the last n entries when tailing' do
    expect(Links.tail_file(1).chomp).to eq 'hoursintheday - https://medium.com/@itsmeduncan/you-only-have-so-many-hours-in-the-day-a8c004a21d72#.kk2gwrcu0'
  end

  it 'returns the correct timestamp' do 
    expect(Links.timestamp).to eq Time.now.strftime("%A %Y-%m-%d %H:%M") 
  end
end
