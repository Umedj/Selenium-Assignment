require 'rubygems'
require 'selenium-webdriver'

fileName = 'test.txt'
SITE = "https://the-internet.herokuapp.com/"
timeout = 20
driver = Selenium::WebDriver.for :chrome
driver.get (SITE)


driver.find_element(:link_text, "File Download").click

wait = Selenium::WebDriver::Wait.new(:timeout => timeout) # seconds

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