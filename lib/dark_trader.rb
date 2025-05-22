require 'http'
require 'json'
require 'dotenv'
require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'net/http'

Dotenv.load

def retrieve_dataXpath(url)

  devisesFinal = []
  pricesFinal = []
  devisesScraped = []
  rows = []
  page = Nokogiri::HTML(URI.open(url))
  rows = page.xpath('//tbody//tr')
  columnName = rows.xpath ('//td[3]')
  names = columnName.xpath('//div//a//span//div//div//div//p')
  prices = rows.xpath('//td[4]//div//span')

  names.each do |name|
    devisesScraped.push(name)
  end
  devisesScraped.each do |text|
    devisesFinal.push(text.text.strip)
  end
  prices.each do |price|
 pricesFinal.push(price.text.strip)
  end

  combinedData = Hash[devisesFinal.zip(pricesFinal)]

end

puts retrieve_dataXpath("https://coinmarketcap.com/")

# puts ENV["TEST_KEY"]
# puts ENV["TEST_URL"]

# def apiRequest
#   url = ENV["DARK_TRADER_URL"]
#   api_key = ENV["DARK_KEY"]
#   headers = {
#     "Content-Type" => "application/json",
#     "Authorization" => "Bearer #{api_key}",
#   }
#   data ={
#     "id" => "1",
#     "slug" => "bitcoin",
#     "symbol" => "BTC"
#   }

#   response = HTTP.get(url, headers: headers, json: data)

#   puts response
# end

# apiRequest


