require 'rubygems'
require 'selenium-webdriver'

file = 'test.txt'
driver = Selenium::WebDriver.for :chrome
driver.get "https://the-internet.herokuapp.com/"


driver.find_element(:link_text, "File Upload").click

wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
begin
 element = wait.until { driver.find_element(:id, "file-upload") }
end
element.send_keys("/users/umedjadhav/Desktop/Selenium Assignment/#{file}")

puts "Uploading..."

element = driver.find_element(:id, "file-submit")
element.click
sleep(10)

uploadFile = driver.find_element(:id, "uploaded-files").text


if uploadFile == file
	puts "Successful completion"
end

driver.quit