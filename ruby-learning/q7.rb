

class Q7
	
	@@count = 0;
	
	def count
		@@count
	end
	
	def count= num
		@@count = num
	end
	
	def T n
		
		
		
		if n <= 3
			return n + 1
		end
		
		(T(n-1)*T(n-2))/T(n-3)

	end	
	
	
end

q = Q7.new


for i in 4..7
	puts "T(#{i}) runs #{	q.T(i)	} time."
end




