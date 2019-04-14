#class UsCli::CLI

#attr_accessor :state_name, :greeting

  # def call
  #  greeting 
  #  list(states)
  #  USCli::Scraper
  #  details(states)
  #  exit_states
  #  run(states)
  # end
    
def help
  help = <<-HELP
  Welcome to United States Facts Portal. Please utilize the following commands:
  - help : displays this help message
  - list : displays a list of the United States that you can get more information on
  - details : displays details about the state you chose 
  - exit : exits the portal\n
HELP

end

states = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming \n "]

def greeting
  puts "Welcome to The United States Facts Portal! \n "
end

greeting 

def list(states)
  states.each_with_index {|s, index|
  puts "#{index+1}. #{s}"}&&"\n"
end
 
list(states) 

def details(states)
  puts "Hello, please choose a state:\n "
  input = gets.upcase.chomp
  if (1..50).to_a.include?(input.upcase.to_i) 
  puts "\n"
    puts "Hi, you've chosen #{states[input.to_i - 1].upcase}! \n"
    elsif states.include?"#{states[input.upcase.to_i - 1]}"
    puts "Hi, you've chosen #{input.upcase}! \n "
  elsif  input != (1..50) || input != "#{states}"
    puts "Invalid input, please try again! \n ".upcase
  end 
end 

details(states)

def exit_states
  puts "Thank you for using The United States Facts portal, please come again!"
end 

#def print_us(unitedstates)
#    puts ""
#    puts "----------- #{unitedstates.state_name} ------------"
#    puts ""
#    puts "Date of Entry:    #{unitedstates.entry_date}"
#    puts "Capital:          #{unitedstates.capital}"
#    puts "Population:       #{unitedstates.population}"
#    puts "Size:             #{unitedstates.size}"
#    puts "Nickname(s):      #{unitedstates.nick_name}"
#    puts "Motto:            #{unitedstates.motto}"
#    puts ""
#    puts "---------------Description--------------"
#    puts ""
#    puts "#{unitedstates.description}"
#    puts ""
#    
#  end
  
   #print_us(unitedstates)

def run(states)
  command = "" 
  while command  
  puts "\n " "Please enter a command. Options include: 
  
  - help : displays this help message
  - list : displays a list of the States that you can get more information on
  - exit : exits the portal\n "
 
    #puts "Invalid input, please try again"
    #puts details(states)
  command = gets.downcase.strip  
  
  case command 
    when 'list'
      list(states) && details(states)
    when 'help'
        help 
    when 'exit'
        exit_states
        break 
      else 
        puts "Invalid input, please try again!"
        
      end 
    end 
  
  end 
  run(states)
  
#end