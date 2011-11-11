require "digest"


class PassCrack
	
	
	
	def initialize
		@sha = Digest::SHA256.new
		@old_password = ''
		@new_hash = ''
		
		@cracked = nil
		
		letter_ind = 0

		while(@old_password.length - 1 != letter_ind)
			break if swap_char(letter_ind) != nil
			letter_ind += 1
		end
		
		if @cracked.nil?
		    puts "Did not find the password"
		else			
			puts "The password is #{@cracked}"
		end
	end
	
	
	def swap_char index
	
		(32..126).each do |c|
			cur_pass = String.new @old_password
			cur_pass[index] = c.chr
			
			hex = @sha.hexdigest cur_pass
			@cracked = cur_pass if hex == @new_hash
			
				
			
			
			return @cracked if @cracked != nil
		end
		return nil;
	end


end


PassCrack.new
