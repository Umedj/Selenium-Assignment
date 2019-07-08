require 'rubygems'
require 'selenium-webdriver'

file = 'test.txt'
driver = Selenium::WebDriver.for :chrome
driver.get "https://the-internet.herokuapp.com/"


driver.find_element(:link_text, "Hovers").click
wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds

begin
	elements = driver.find_elements(:class,'figure')
end

elements.each { |e| 
	driver.action.move_to(e).perform
	puts e.text
	
 }
 
sleep(5)
driver.quit
