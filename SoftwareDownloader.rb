class SoftwareDownloader
	
	
	def initialize
		set_os
		
		@replace_str = "saucyparty"
		@url = "http://www.google.com/search?q=#{@replace_str}&btnI"
		@s_list = open("software.txt", 'r').read
		download
	end
	
	def set_os
		os = RUBY_PLATFORM.downcase
	  @browser_command = "open"
	  @browser_command = "start" if os.start_with?('mswin') || os[/mingw32/] != nil
	end
	
	def download
		list = DATA.read
		
		list.each_line do |s|
			puts "Downloading: #{s}..."
			puts "Press enter to continue."
			url = @url.gsub(/#{@replace_str}/, "#{s}+download")
			puts "#{@url}\nThis is the url #{url}"
			
			system "#{@browser_command} " + "\'#{url}\'"
#			gets
		end
		 
	end
	
end

SoftwareDownloader.new

__END__
Firefox
Audacity