require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative "./us_cli/version"

#module UsCli
  #class Error < StandardError; end
  # Your code goes here...
#end

require_relative './us_cli/cli'
require_relative './us_cli/scraper'
require_relative './us_cli/unitedstates'