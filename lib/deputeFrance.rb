require 'rubygems'
require 'nokogiri' 
require 'open-uri'

def retrieveListDeputeFrance(url)

  urlDeputes = []

  page = Nokogiri::HTML(URI.open(url))
  # ALL
  # listDepute=page.xpath('//div[@id="deputes-list"]//ul[@class="col3"]//li//a')
  # A only
  listDepute= page.xpath('//div[@id="deputes-list"]//div[1]//ul[@class="col3"]//li//a') 
  # liens
  hrefs=listDepute.xpath('./@href')
  
  0.upto(hrefs.length-1) do |i|
    urlDepute="https://www2.assemblee-nationale.fr#{hrefs[i]}"
  urlDeputes.push(urlDepute)
  end
  urlDeputes
end

# puts retrieveListDeputeFrance("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique#A")

def retreiveDeputeInfos
  deputeTitles = []
  deputeFirstNames=[]
  deputeLastNames=[]
  fullNameAndTitle = []

  urls=retrieveListDeputeFrance("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique#A")

# nom complets avec titre
0.upto(urls.length-1) do |index|
  page = Nokogiri::HTML(URI.open("#{urls[index]}"))
  fullname = page.xpath('//h1').text.strip
  fullNameAndTitle.push(fullname)
end


fullNameAndTitle
end

puts retreiveDeputeInfos
# puts "  ------------------------\n"
# puts "         Email   \n"
# puts "  ------------------------\n"

# email_mairie.each do |mail|
#   puts "\n-- #{mail[:email]} --\n"
# end