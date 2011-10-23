os = RUBY_PLATFORM.downcase
@browser_command = "open"
@browser_command = "start" if os.start_with?('mswin') || os[/mingw32/] != nil
puts @browser_command