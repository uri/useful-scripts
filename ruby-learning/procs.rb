class ProcTest
	
	attr_accessor :pie
	
	@pie = 'yummm'
	
	def initialize
		@methods = {}
		@@pi = "asd"
	end
	
	def methods
		@methods
	end
	
	def add_method name, method
		@methods[name] = method
	end
	
	def invoke_method name
		@methods[name].call
	end
end


p = ProcTest.new
puts p.pie

a = [1, 2, 3, 4, 5]

def array test
	yield(test)
end

class Array
	def change!
		self.each_with_index do |num, inx|
			self[inx] = yield(num)
		end
	end
end


def meth(range)
	puts range.begin
	puts range.end
end

for i in 0..9
	puts 5
end


