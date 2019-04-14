class UsCli::Scraper

require "nokogiri"
require "open-uri"

BASE_PATH = "https://www.history.com/topics/us-states/"

path = BASE_PATH + "#{@state_name}"

# Scrape details --------------------

file = open(path)
doc = Nokogiri::HTML(file)

puts detail = doc.css("div.m-detail--body p")[0].text

puts

puts entry_date = doc.css("div.m-detail--body p")[1].text
puts capital = doc.css("div.m-detail--body p")[2].text
puts population = doc.css("div.m-detail--body p")[3].text
puts size = doc.css("div.m-detail--body p")[4].text
puts nick_name = doc.css("div.m-detail--body p")[5].text
puts moto = doc.css("div.m-detail--body p")[6].text

puts
puts "Here are the details:"
puts
facts = []

detail = doc.css("div.m-detail--body ul").each do |fact|
  facts << fact.text
end

facts.each.with_index(1) {|fact, i| puts "#{i} #{fact}."}


#Chosing the state scrape

require "nokogiri"
require "open-uri"

path = "https://www.history.com/topics/us-states"
file = open(path)
doc = Nokogiri::HTML(file)

states = []
doc.css(".m-ellipsis--text").each do |state|
  states << state.text
end

def print_us(unitedstates)
    puts ""
    puts "----------- #{unitedstates.state_name} ------------"
    puts ""
    puts "Date of Entry:    #{unitedstates.entry_date}"
    puts "Capital:          #{unitedstates.capital}"
    puts "Population:       #{unitedstates.population}"
    puts "Size:             #{unitedstates.size}"
    puts "Nickname(s):      #{unitedstates.nick_name}"
    puts "Motto:            #{unitedstates.motto}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{unitedstates.description}"
    puts ""
  end

end

p states