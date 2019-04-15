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
    self.help
    #self.menu  #exit or not go back
    #self.get_selection
    input = gets.chomp
    while input
      case input
        when 'y'  
          self.list
          self.get_selection 
          puts self.display_state
          self.help
           input = gets.chomp
          when 'n'
            self.exit_states
            break
          else 
            puts "Invalid Entry. Please Try Again"
            self.help
            next
          end
        end
      end
    #end
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
  puts "Hello, please choose a state:\n "
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
  end
end


def exit_states
  puts "Thank you for using The United States Facts portal, please come again!"
end 

def display_state
    puts ""
    puts "*************** #{state.name.upcase} ****************"
    puts ""
    puts "Date of Entry:    #{state.entry_date}"
    puts "Capital:          #{state.capital}"
    puts "Population:       #{state.population}"
    puts "Size:             #{state.size}"
    puts "Nickname(s):      #{state.nick_name}"
    puts "Motto:            #{state.motto}"
    puts ""
    puts "**************Description**************"
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
      end 
    end 
  end 
  
end
