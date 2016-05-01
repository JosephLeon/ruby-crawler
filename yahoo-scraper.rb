require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "Enter stock ticker"
ticker = gets.chomp

BASE_YAHOO_URL = "http://finance.yahoo.com"
LIST_URL = "#{BASE_YAHOO_URL}/q?s=#{ticker}"
puts LIST_URL

cleaned_ticker = ticker.downcase
stock_ticker_element = "#yfs_l84_#{cleaned_ticker}"
puts stock_ticker_element

page = Nokogiri::HTML(open(LIST_URL))
stock_price = page.css(stock_ticker_element)

puts stock_price