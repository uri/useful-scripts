require 'csv'

header = File.open('TEXT.CSV', &:readline) 
keys = header.split(",")


values = CSV.read("TEXT.CSV")

def combine(a,b)
  zipped = a.zip(b)
  Hash[zipped]
end

keyvalue = values.each do |i|
  combine(keys,i)
end

puts keyvalue
