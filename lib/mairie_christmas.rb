require 'rubygems'
require 'nokogiri' 
require 'open-uri'


def retrieveURLMairie(url)

urlMairie=[]
  page = Nokogiri::HTML(URI.open(url))
  listMairieUl = page.xpath('//*[@id="result-search"]//li')

  listMairieUl.each do |mairie|
    mairie= mairie.xpath('.//div[2]//a/@href')
    
    urlMairie.push(mairie)

  end

 return urlMairie
end

def retreiveEmailMairie

  nameMairie = []
  emailMairie = []
  urls = retrieveURLMairie("https://lannuaire.service-public.fr/recherche?whoWhat=Mairie&where=Val+D%27oise+95")

  # page = Nokogiri::HTML(URI.open("#{urls[0]}"))
  0.upto(urls.length-1) do |index|
    page = Nokogiri::HTML(URI.open("#{urls[index]}"))
    name = page.xpath('//h1[@id="titlePage"]').text.strip
    nameMairie.push(name)
    email = page.xpath('//a[@class="send-mail"]').text.strip
    emailMairie.push(email)
  end
combinedData = Hash[nameMairie.zip(emailMairie)]
end

puts retreiveEmailMairie


