class UsCli::CLI

attr_accessor :state

STATES = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming" ]

def call
  #input = gets.chomp
  #while input
    self.greeting 
    self.list
    self.get_selection #set the state to a State object
    self.display_state
    self.again?
  end
  
def again?
    puts "Would you like more information about another state? Press 'y' for YES or 'n' for NO"
    input = gets.strip.downcase
    input != 'n' || input == 'no' ? call : exit_states 
  end  
#end
 
    
def help
 # help = <<- help
  puts "Would you like more information about another state? Press 'y' for YES or 'n' for NO"
end

def greeting
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
  elsif STATES.include?"#{STATES[input.upcase.to_i - 1]}"
    puts "Hi, you've chosen #{input.upcase}! \n "
  elsif  input != (001..050) || input != "#{STATES}"
    puts "Invalid input, please try again! \n ".upcase
    self.help
  end
end


def exit_states
  puts "Thank you for using The United States Facts portal, please come again!"
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
    
  end
  
def menu
  command = "" 
  while command  
  puts "\n " "Please enter a command. Options include: 
  
  - help : displays this help message
  - list : displays a list of the States that you can get more information on
  - restart : starts the portal to select a new state
  - exit : exits the portal\n "
 
  command = gets.downcase.strip  
  
  case command 
    when 'list'
        list 
    when 'help'
        menu 
    when 'restart'
      list
    when 'exit'
        exit_states
        break 
      else 
        puts "Invalid input, please try again!"
        #self.help
      end 
    end 
  end 
  
end
