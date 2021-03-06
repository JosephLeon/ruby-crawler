require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "Enter stock ticker"
ticker = gets.chomp

BASE_YAHOO_URL = "http://finance.yahoo.com"
LIST_URL = "#{BASE_YAHOO_URL}/q?s=#{ticker}"
puts LIST_URL

page = Nokogiri::HTML(open(LIST_URL))

cleaned_ticker = ticker.downcase
stock_ticker_element = "#yfs_l84_#{cleaned_ticker}"

# Stock Quote
stock_quote = {}
stock_price = page.css(stock_ticker_element).text
stock_quote["stock_price"] = stock_price

# Get the two main tables of data.
tables = ['#table1', '#table2']
tables.each do |table|
	page.css(table).each do |row|
		row.css('tr').each do |tr|
			header = tr.css('th').text.gsub!(/[^0-9A-Za-z]/, '').downcase
			value = tr.css('td').text
			stock_quote["#{header}"] = value
		end
	end
end

puts stock_quote


# Stock News
news_list = []
news_elements = page.css("#yfi_headlines .bd ul")
news_elements.css('li').each do |e|
	news_list.push(e)
end

puts news_list.take(5)