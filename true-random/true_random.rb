# True Random

require 'open-uri'

min = 1
max = 1000


str = open("http://www.random.org/integers/?num=#{min}&min=1&max=#{max}&col=1&base=10&format=plain&rnd=new").read

puts str.chomp.to_i