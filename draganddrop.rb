require 'rubygems'
require 'selenium-webdriver'

SITE = "https://the-internet.herokuapp.com/"
timeout = 20
driver = Selenium::WebDriver.for :chrome
driver.get (SITE)

driver.find_element(:link_text,"Drag and Drop").click

wait = Selenium::WebDriver::Wait.new(:timeout => timeout) # seconds

element = wait.until { driver.find_element(:id, "column-a") }
target = wait.until { driver.find_element(:id, "column-b") }

driver.action.move_to(target).perform
driver.action.drag_and_drop(element,target).perform

puts "Successful completion"
driver.quit


