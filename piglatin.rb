#Implementation of piglatin algorithm
class PigLatin
   def pig(word)
     leadingCap = word =~ /^A-Z?
      word.downcase!
      res = case word
       #when vowels word + way
         when /^aeiouy/
           word+"way"
       #otherwise, start from the back to concatanete with the first letter and add ay
         when /^([^aeiouy]+)(.*)/
           $2 + $1 + "ay"
         else
           word
         end
       leadingCap ? res.capitalize : res
   end

   def showPig
     #split the value into array and collect the words and join them into a string. 
     @text.value = @text.value.split.collect{|w| pig(w)}.join(" ")
   end
end
