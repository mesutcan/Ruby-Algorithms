puts 'What is the name and path of the file?'
filename = gets.chomp
text = String.new
File.open(filename) { |f| text = f.read }

#matches anything that isn't alphabetical character
words = text.split(/[^a-zA-Z]/)

freqs = Hash.new(o)
#key will be a unique word and it's value is the # of times it occurs in the text.
words.each{|word| freqs[word] +=1}
freqs = freqs.sort_by{|x,y| y}
freqs.reverse!
freqs.each{|word,freq| puts word+ ' '+freq.to_s}


words = File.open('filename.txt') {|f| f.read}.split
freqs = Hash.new(0)
words.each {|word| freqs[word] +=1}
freqs.sort_by{|x,y| y}.reverse.each{|w,f| puts w+ '' + f.to_s}

