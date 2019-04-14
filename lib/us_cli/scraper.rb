class UsCli::Scraper 
  
  def initialize(url = "https://www.history.com/topics/us-states/")
    @url = url 
  end
  
  #path = url + "florida"
  
  def states 
    @doc = Nokogiri::HTML(open(@url))
    binding.pry
  end
  
  
  
end