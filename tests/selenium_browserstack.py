# @Author: Kristinita
# @Date: 2018-04-28 18:35:24
# @Last Modified time: 2018-04-30 11:53:03
"""BrowserStack + Selenium example test.

Demonstration test:
https://www.browserstack.com/automate
Get project name and badge key:
https://www.browserstack.com/automate/status-badges
"""
import time
from selenium import webdriver

desired_cap = {
    'browser': 'Safari',
    'browser_version': '11.0',
    'os': 'OS X',
    'os_version': 'High Sierra',
    'resolution': '1920x1080'
}

driver = webdriver.Remote(
    command_executor='http://bsuser43877:sAKeQiprjVUqpWyaxcyp@hub.browserstack.com:80/wd/hub',
    desired_capabilities=desired_cap)

driver.get("https://kristinita.ru")
if "Поиск Кристиниты" not in driver.title:
    raise Exception("Unable to load google page!")
elem = driver.find_element_by_tag_name("input")
elem.send_keys("Кристина Кива")
elem = driver.find_element_by_tag_name("button").click()
print(driver.title)
time.sleep(7)
driver.quit()
