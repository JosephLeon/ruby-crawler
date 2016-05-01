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

stock_quote = {}

page = Nokogiri::HTML(open(LIST_URL))
stock_price = page.css(stock_ticker_element).text
stock_quote["stock_price"] = stock_price

# Get data from id table1, contains
table1 = page.css('#table1')
table1.each do |row|
	# puts row
	row.css('tr').each do |tr|
		header = tr.css('th').text.gsub!(/[^0-9A-Za-z]/, '').downcase
		value = tr.css('td').text
		stock_quote["#{header}"] = value
	end
end

puts stock_quote