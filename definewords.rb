require "open-uri"

unless ARGV[0]
 puts "You must supply a word to define."
 puts "USAGE: ruby define.rb <word to define>"
 exit
end

word = ARGV[0].strip

url = "http://dictionary.reference.com/browse/#{word}"

begin 
 
 open(url) do |source|
  source.each_line do |x| 
    if x=~ /No results found/
    puts "\nPlease check spelling,no definition was found."
    exit
  end
    if x=~  /(1\.)<\/td><td valign="top">(.*)<\/td/
    puts "\n#{$1} #{$2}"
    exit
  end
end
   puts "Sorry, unable to find a definition."
end
rescue => e
   puts "An error occurred, please try again."
   puts e 
end 
#appending a word to the URL will automatically return the definition.

#open-uri lets us type open(), pass the URL to the method and retrieve a webpage.

#if the definition is found, the script will begin isolating exactly where the definition resides in the source code.


