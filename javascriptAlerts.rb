require 'rubygems'
require 'selenium-webdriver'

text= 'Umed Jadhav'

driver = Selenium::WebDriver.for :chrome
driver.get "https://the-internet.herokuapp.com/"


driver.find_element(:link_text, "JavaScript Alerts").click
buttons = driver.find_elements(:tag_name,'button')

#JS Alert
buttons[0].click
wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds

a = wait.until{driver.switch_to.alert()}
sleep(0.5)
a.accept()
msg = driver.find_element(:id,'result').text
puts msg

#JS Confirm 
buttons[1].click
a = wait.until{driver.switch_to.alert()}
sleep(0.5)
a.accept()
msg = driver.find_element(:id,'result').text
puts msg

#JS Prompt
buttons[2].click
a = wait.until{driver.switch_to.alert()}
sleep(0.5)
a.send_keys(text)
a.accept()
msg = driver.find_element(:id,'result').text
puts msg

sleep(2)
driver.quit