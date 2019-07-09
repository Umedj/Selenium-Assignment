require 'rubygems'
require 'selenium-webdriver'

text= 'Umed Jadhav'
SITE = "https://the-internet.herokuapp.com/"
timeout = 20
driver = Selenium::WebDriver.for :chrome
driver.get (SITE)


driver.find_element(:link_text, "JavaScript Alerts").click
buttons = driver.find_elements(:tag_name,'button')

#JS Alert
buttons[0].click
wait = Selenium::WebDriver::Wait.new(:timeout => timeout) # seconds

a = wait.until{driver.switch_to.alert()}
a.accept()
msg = driver.find_element(:id,'result').text
puts msg

#JS Confirm 
buttons[1].click
a = wait.until{driver.switch_to.alert()}
a.accept()
msg = driver.find_element(:id,'result').text
puts msg

#JS Prompt
buttons[2].click
a = wait.until{driver.switch_to.alert()}
a.send_keys(text)
a.accept()
msg = driver.find_element(:id,'result').text
puts msg

driver.quit