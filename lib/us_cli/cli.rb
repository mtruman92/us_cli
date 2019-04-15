class UsCli::CLI

attr_accessor :state

STATES = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming" ]

  def call
    self.greeting 
    self.list
    self.get_selection #set the state to a State object
    self.display_state
    self.run
    self.invalid
    self.exit_states
    #self.again?
  end

  def greeting
    puts "\n "
    puts "Welcome to The United States Facts Portal! \n "
  end
  
  def list
    STATES.each_with_index {|s, index|
    puts "#{index+1}. #{s}"}&&"\n"
  end
  
  def get_selection
       puts "\n" "Hello, please choose a state by its corresponding number:\n "
        input = gets.upcase.chomp
     if (1..50).include?(input.to_i)
        selection = STATES[input.to_i - 1]
       puts "\n"
       puts "Hi, you've chosen #{selection.upcase}! \n"
        @state = UsCli::UnitedStates.new(selection.downcase)
        UsCli::Scraper.scrape_state(state)
     else 
        puts self.invalid 
    end
  end
  
  def display_state
       puts ""
       puts "************************** #{state.name.upcase} *****************************"
       puts ""
       puts "#{state.entry_date}" "\n "
       puts "#{state.capital}" "\n "
       puts "#{state.population}" "\n "
       puts "#{state.size}" "\n "
       puts "#{state.nick_name}" "\n "
       puts "#{state.motto}" "\n "
       puts "******************************INTERESTING FACTS********************************" "\n "
       puts "#{state.facts}" "\n "
       puts "**********************************DESCRIPTION**********************************"
       puts ""
       puts "#{state.detail}"
       puts ""
       puts "Would you like to see information about another state? Press 'y' for yes or 'n' for no."
   end
  
  def run
    input = gets.upcase.chomp
    case input
    when 'Y' 
      call
    when 'N'
        exit_states
    when !'Y' || !'N'
     invalid
     end
  end
  
  def invalid
    puts "\n " "This is an invalid entry. Please try again! \n" 
    call
  end

  def exit_states
    puts "Thank you for using The United States Facts portal, please come again!"
    exit
  end 

end