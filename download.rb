require 'rubygems'
require 'selenium-webdriver'

fileName = 'test.txt'
driver = Selenium::WebDriver.for :chrome
driver.get "https://the-internet.herokuapp.com/"


driver.find_element(:link_text, "File Download").click

wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds

element = wait.until { driver.find_element(:link_text, fileName) }


element.click
puts "Downloading..."

if File.file?("/Users/umedjadhav/Downloads/#{fileName}")
	puts "Successful completion"
else
	puts "File not Found"
end

sleep(5)
driver.quit