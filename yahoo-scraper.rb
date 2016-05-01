# http://finance.yahoo.com/q?s=F

require 'rubygems'
require 'nokogiri'
require 'open-uri'

BASE_YAHOO_URL = "http://finance.yahoo.com"
LIST_URL = "#{BASE_YAHOO_URL}/q?s=F"

page = Nokogiri::HTML(open(LIST_URL))
stock_price = page.css('#yfs_l84_f')

puts page
puts stock_price