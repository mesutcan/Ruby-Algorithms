unless ARGV[0]
 puts "\n\nUsage is flashCards.rb <file>\n\n"
 exit
end

flash = []
card = Struct.new(:question,:answer)
# Use Struct to create our own data structure called card.
File.open(ARGV[0],"rb").each do |line| 
   if line =~ /(.*)\s{3,10}(.*)/
    flash << card.new($1.strip,$2.strip)
    end
end

flash.replace(flash.sort_by{rand})

until flash.empty?
  drill = flash.pop
   print "#{drill.question}?"
  guess = $stdin.gets.chomp
  
  if guess.downcase == drill.answer.downcase
    puts "\n\nCorrect -- The answer is: #{drill.answer}\n\n\n"
  else
    puts "\n\nWRONG -- The answers is :#{drill.answer}\n\n\n"
  end
end

# Flash card file inline is broken down line by line. Each flash card is added to an aray called flash. Once it reaches the end-of-file, the array flash has a complete collection of cards with questions and answers on them.


