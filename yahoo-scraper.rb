# http://finance.yahoo.com/q?s=F

require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "Enter stock ticker"
ticker = gets.chomp

BASE_YAHOO_URL = "http://finance.yahoo.com"
LIST_URL = "#{BASE_YAHOO_URL}/q?s=#{ticker}"
puts LIST_URL

stock_ticker_element = '#yfs_184_' + ticker.downcase
puts stock_ticker_element
page = Nokogiri::HTML(open(LIST_URL))
# stock_price = page.css('#yfs_l84_#{ticker}')
# stock_price = page.css('#yfs_l84_f')
stock_price = page.css(stock_ticker_element)

# puts page
puts stock_price