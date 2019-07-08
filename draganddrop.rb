require 'rubygems'
require 'selenium-webdriver'

file = 'test.txt'
driver = Selenium::WebDriver.for :chrome
driver.get "https://the-internet.herokuapp.com/"

driver.find_element(:link_text,"Drag and Drop").click

wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds

element = wait.until { driver.find_element(:id, "column-a") }
target = wait.until { driver.find_element(:id, "column-b") }

driver.action.move_to(target).perform
driver.action.drag_and_drop(element,target).perform
puts "Successful completion"

sleep(3)
driver.quit


