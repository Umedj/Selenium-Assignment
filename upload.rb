require 'rubygems'
require 'selenium-webdriver'

fileName = 'test.txt'
SITE = "https://the-internet.herokuapp.com/"
timeout = 20
driver = Selenium::WebDriver.for :chrome
driver.get (SITE)


driver.find_element(:link_text, "File Upload").click

wait = Selenium::WebDriver::Wait.new(:timeout => timeout) # seconds
element = wait.until { driver.find_element(:id, "file-upload") }
element.send_keys("/users/umedjadhav/Desktop/Selenium Assignment/#{fileName}")
puts "Uploading..."

element = driver.find_element(:id, "file-submit")
element.click

uploadFile = wait.until{driver.find_element(:id, "uploaded-files").text}


if uploadFile == fileName
	puts "Successful completion"
end

driver.quit