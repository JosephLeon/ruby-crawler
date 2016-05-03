require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "Enter stock ticker"
ticker = gets.chomp

BASE_YAHOO_URL = "http://finance.yahoo.com"
LIST_URL = "#{BASE_YAHOO_URL}/q/is?s=#{ticker}+Income+Statement&annual"
MASTER_TABLE_SELECTOR = ".yfnc_tabledata1"
REVENUE_SELECTOR = ".yfnc_modtitle1"

page = Nokogiri::HTML(open(LIST_URL))

cleaned_ticker = ticker.downcase

financial_data = page.css(MASTER_TABLE_SELECTOR)

# Revenue
$revenue_data = {}
revenue_section = page.css(REVENUE_SELECTOR)
# $revenue_data["periods"] = revenue_section.css(".yfi-module-title").text

puts revenue_data
