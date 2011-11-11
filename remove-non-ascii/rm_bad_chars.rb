# encoding: utf-16

class String
 def remove_non_ascii(replacement="") 
   self.gsub(/[\x80-\xff]/,replacement)
 end
end



puts '•'.remove_non_ascii
