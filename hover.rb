require 'rubygems'
require 'selenium-webdriver'

SITE = "https://the-internet.herokuapp.com/"
timeout = 20
driver = Selenium::WebDriver.for :chrome
driver.get (SITE)


driver.find_element(:link_text, "Hovers").click
wait = Selenium::WebDriver::Wait.new(:timeout => timeout) # seconds

begin
	elements = driver.find_elements(:class,'figure')
end

elements.each { |e| 
	driver.action.move_to(e).perform
	puts e.text
	
 }
 
driver.quit
