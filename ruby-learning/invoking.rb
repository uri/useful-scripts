class UriClass
  def meth
    puts "this is a method"
  end
end

uri = UriClass.new

uri.meth

uri.send(:meth)

uri.method(:meth).call