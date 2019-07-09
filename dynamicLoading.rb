require 'rubygems'
require 'selenium-webdriver'

SITE = "https://the-internet.herokuapp.com/"
timeout = 20
driver = Selenium::WebDriver.for :chrome
driver.get (SITE)


driver.find_element(:link_text, "Dynamic Loading").click
driver.find_element(:partial_link_text, "Example 1").click 
driver.find_element(:tag_name,'button').click
element = driver.find_element(:css, "#finish h4")
wait = Selenium::WebDriver::Wait.new(:timeout => timeout) # seconds
wait.until{ element.displayed?}
text1 = element.text
puts "Eg: 1 #{text1}"

driver.navigate.back
driver.find_element(:partial_link_text, "Example 2").click 
driver.find_element(:tag_name,'button').click
element = wait.until { driver.find_element(:css, "#finish h4") }
text2 = element.text
puts "Eg: 2 #{text2}"

driver.quit