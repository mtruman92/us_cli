class UsCli::UnitedStates
  
  attr_accessor :name, :url, :detail, :entry_date, :capital, :population, :size, :nick_name, :motto, :facts
  
  BASE_URL = "https://www.history.com/topics/us-states/"
  
  def initialize(name)
    @name = name
    @url = BASE_URL + name
    @facts = []
  end
  
    
end

