require 'http'
require 'json'
require 'dotenv'
require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'net/http'

Dotenv.load

# puts ENV["TEST_KEY"]
# puts ENV["TEST_URL"]

def apiRequest
  url = ENV["DARK_TRADER_URL"]
  api_key = ENV["DARK_KEY"]
  headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer #{api_key}",
  }
  data ={
    "id" => "1",
    "slug" => "bitcoin",
    "symbol" => "BTC"
  }

  response = HTTP.get(url, headers: headers, json: data)
  response_body = response.body.to_s

  puts response_body
end

apiRequest