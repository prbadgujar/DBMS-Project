# from selenium import webdriver
# from selenium.webdriver.common.by import By
# from selenium.webdriver.firefox.service import Service
# from selenium.webdriver.firefox.options import Options
# from selenium.webdriver.support.ui import WebDriverWait
# from selenium.webdriver.support import expected_conditions as EC

# import pdb
# import time

# # Set up Firefox options
# firefox_options = Options()
# firefox_options.add_argument("--headless")  # Run headless Firefox

# # Path to the Geckodriver executable
# #gecko_service = Service('/path/to/geckodriver')  # Update this path

# # Initialize the WebDriver
# driver = webdriver.Firefox(options=firefox_options)

# state_abbreviations = [
#     "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA",
#     "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
#     "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
#     "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
#     "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"
# ]

# def get_state_info(url):
#     driver.get(url)
#     WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.TAG_NAME, "footer")))

#     # Find the main list element
#     main_list = driver.find_element(By.XPATH, '//*[@id="list_parks"]')

#     # Find all list items under the main list
#     list_items = main_list.find_elements(By.XPATH, './/li')

#     # Open the file to write the extracted information
#     with open('parks_info.txt', 'a') as file:
#         # Extract information from each list item
#         for item in list_items:
#             if item.get_attribute('id') == "":
#                 continue
#             while item.find_element(By.XPATH, './/h3/a').text.strip() == "":
#                 print("fuckery afoot")
#                 time.sleep(10)
#             # print("______")
#             # pdb.set_trace()
#             # Extract specific elements based on your markers
#             kicker = item.find_element(By.XPATH, './/p[@class="list_left__kicker"]').text
#             title = item.find_element(By.XPATH, './/h3/a').text
#             title_link = item.find_element(By.XPATH, './/h3/a').get_attribute('href')
#             subtitle = item.find_element(By.XPATH, './/p[@class="list_left__subtitle"]').text
#             description = item.find_element(By.XPATH, './/p[not(@class)]').text

#             # Navigate to the sibling div with class "list_right" to get the links
#             list_right = item.find_element(By.XPATH, './/div[@class="list_right"]')
#             #print("Found list_right:", list_right is not None)  # Debugging line
#             list_right_html = list_right.get_attribute('outerHTML')
#             #print("Full HTML of list_right:\n", list_right_html)  # Print the HTML

#             # Navigate to the sibling div with class "list_right" to get the links
#             links = list_right.find_elements(By.XPATH, './/div[@class="col-sm-12 col-6 stateListLinks"]//li/a')
#             link_info = {link.text.strip(): link.get_attribute('href') for link in links}

#             # Write the extracted information to the file
#             file.write(f"Type: {kicker.strip()}\n")
#             file.write(f"Title: {title.strip()}\n")
#             file.write(f"Title Link: {title_link.strip()}\n")
#             file.write(f"State: {subtitle.strip()}\n")
#             file.write(f"Description: {description.strip()}\n")
#             file.write("Links:\n")
#             for text, href in link_info.items():
#                 file.write(f"  {text}: {href}\n")
#             file.write('-' * 40 + '\n')

# try:
#     # URL of the page to scrape
#     #for state in state_abbreviations:
#     for state in state_abbreviations:
#         url = 'https://www.nps.gov/state/' + state + '/index.htm'
#         get_state_info(url)


# finally:
#     # Close the WebDriver
#     driver.quit()
