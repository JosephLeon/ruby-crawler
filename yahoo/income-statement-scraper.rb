require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "Enter stock ticker"
ticker = gets.chomp

BASE_YAHOO_URL = "http://finance.yahoo.com"
LIST_URL = "#{BASE_YAHOO_URL}/q/is?s=#{ticker}+Income+Statement&annual"
# http://finance.yahoo.com/q/is?s=MSFT+Income+Statement&annual

page = Nokogiri::HTML(open(LIST_URL))

cleaned_ticker = ticker.downcase

financial_data = page.css('.yfnc_tabledata1')

puts financial_data
