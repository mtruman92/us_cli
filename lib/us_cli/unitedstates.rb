class UsCli::UnitedStates
  
  attr_accessor :state_name, :entry_date, :capital, :population, :size, :nick_name, :motto
  
  def initalize(state_name)
    @state_name = state_name
  end

  def entry_date
      @entry_date ||= doc.css("div.m-detail--body p")[1].text
    end
  
    def capital
      @capital ||= doc.css("div.m-detail--body p")[2].text
    end
  
    def population
      @population ||= doc.css("div.m-detail--body p")[3].text
    end
  
    def size
      @size ||= doc.css("div.m-detail--body p")[4].text
    end
  
    def nick_name
      @nick_name ||= doc.css("div.m-detail--body p")[5].text
    end
  
    def motto
      @motto ||= doc.css("div.m-detail--body p")[6].text
    end
    
  end