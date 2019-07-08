require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get "https://the-internet.herokuapp.com/"

input = ['u','m','e','d']

element = driver.find_element(:link_text, "Key Presses").click

element = driver.find_element(:id, "target")

input.each{
	|letter|
	element.send_keys(letter)
	ans = driver.find_element(:id, "result").text
	puts ans
}

sleep(2)
driver.quit