class UsCli::Scraper

require "nokogiri"
require "open-uri"

def self.scrape_state(state)
  file = open(state.url)
  doc = Nokogiri::HTML(file)
  
  state.detail = doc.css("div.m-detail--body p")[0].text
  state.entry_date = doc.css("div.m-detail--body p")[1].text
  state.capital = doc.css("div.m-detail--body p")[2].text
  state.population = doc.css("div.m-detail--body p")[3].text
  state.size = doc.css("div.m-detail--body p")[4].text
  state.nick_name = doc.css("div.m-detail--body p")[5].text
  state.motto = doc.css("div.m-detail--body p")[6].text

  doc.css("div.m-detail--body ul").each do |fact|
    state.facts << fact.text
    end
  end
end

