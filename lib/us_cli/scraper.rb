require "nokogiri"
require "open-uri"

BASE_PATH = "https://www.history.com/topics/us-states/"

path = BASE_PATH + "florida"

# Scrape details --------------------

file = open(path)
node = Nokogiri::HTML(file)

puts detail = node.css("div.m-detail--body p")[0].text

puts

puts dos = node.css("div.m-detail--body p")[1].text
puts capital = node.css("div.m-detail--body p")[2].text
puts pop = node.css("div.m-detail--body p")[3].text
puts size = node.css("div.m-detail--body p")[4].text
puts nick_name = node.css("div.m-detail--body p")[5].text
puts moto = node.css("div.m-detail--body p")[6].text

puts
puts "Here are the details:"
puts
facts = []

detail = node.css("div.m-detail--body ul").each do |fact|
  facts << fact.text
end

facts.each.with_index(1) {|fact, i| puts "#{i} #{fact}."}


#Chosing the state scrape

require "nokogiri"
require "open-uri"

path = "https://www.history.com/topics/us-states"
file = open(path)
node = Nokogiri::HTML(file)

states = []
node.css(".m-ellipsis--text").each do |state|
  states << state.text
end


p states