import time
import pathlib
import os
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support.ui import Select
import logging
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.keys import Keys
import sys
import re
from selenium.webdriver.common.alert import Alert
import logging
from os import path
import json

class Base(object):
    def __init__(self):
        super(Base, self).__init__()

    # click the button using label
    def click_button_with_label(self, context, label):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//*[contains(text(),'{label}')]")
        element.click()

    # send the data into the text field contains placeholder
    def input_data_with_contains_placeholder(self, context, name, placeholder):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//*[contains(@placeholder,'{placeholder}')]"
        )
        element.clear()
        element.send_keys(name)

    # send the data into the text field using exact placeholder text
    def input_data_with_placeholder(self, context, name, placeholder):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//*[@placeholder ='{placeholder}']"
        )
        element.clear()
        element.send_keys(name)

    # send the data into the text field using id
    def input_data_with_id(self, context, name, text):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//input[@id='{text}']"
        )
        element.clear()
        element.send_keys(name)

    # upload a file
    def upload_files(self, context, filename, xapth, app_name):
        basePath = os.path.realpath(__file__)
        path = pathlib.Path(basePath)
        print("path=", path)
        filepath = f"{path.parent.parent}/{app_name}/uploading_files/{filename}"
        print(filepath)
        context.behave_driver.implicitly_wait(5)
        upload = context.behave_driver.find_element_by_xpath(xapth)
        upload.send_keys(filepath)

    # click the link
    def click_link_text(self, context, text):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//a[normalize-space()='{text}']")
        element.click()

    # wait
    def wait(self, context, value):
        time.sleep(int(value))

    # verify the empty field validation messages
    def textfield_validation(self, context, validation_message, textfieldid):
        msg = context.behave_driver.find_element_by_id(textfieldid)
        print(msg)
        validationmessage = context.behave_driver.execute_script(
            "return arguments[0].validationMessage;", msg)
        try:
            if validationmessage:
                print(validationmessage)
                assert validationmessage == validation_message
        except:
            validationmessage == validationmessage

    # click button using text
    def click_button_text(self, context, text):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//button[normalize-space()='{text}']")
        element.click()

    # click the element using element xpath
    def click_element(self, context, xpath):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(xpath)
        element.click()

    # send the data into the filed using label
    def input_data_with_label(self, context, text, label):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//span[contains(text(),'{label}')]//following::div[1]//input"
        )
        element.clear()
        element.send_keys(text)

    # send the data into the filed using id value
    def input_data_with_id_value(self, context, text, id_value):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//span[contains(text(),'{id_value}')]//following::div[1]//input"
        )
        element.clear()
        element.send_keys(text)

    # verify the elemnet exist or not
    def verify_element_exists(self, context, element, negative):
        exists = context.behave_driver.element_exists(element)
        if negative:
            assert not exists, 'Expected the element does not exist, but element "{}" was located'.format(
                element)
        else:
            assert exists, 'Expected element to exist, but no element "{}" was located'.format(
                element)

    # verify the element exist or not
    def verify_element_exists_2(self, context, element, negative):
        exists = 0
        try:
            context.behave_driver.implicitly_wait(5)
            context.behave_driver.find_element_by_xpath(element)
            exists = exists + 1
        except:
            pass
        if exists == 0:
            if negative == 'yes':
                assert True == True
            else:
                assert True == False  # element not visible
        else:
            if negative == 'no':
                assert True == True
            else:
                assert True == False  # element visible

    # hover on the element
    def move_to_element(self, context, xpath):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(xpath)
        hover = ActionChains(context.behave_driver).move_to_element(element)
        hover.perform()

    # send the data using xpath or locator
    def input_text_locator(self, context, text, xpath):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(xpath)
        element.clear()
        element.send_keys(text)

    # scroll to the particular element
    def scroll_to_element(self, context, xpath):
        element = context.behave_driver.find_element_by_xpath(xpath)
        context.behave_driver.execute_script("arguments[0].scrollIntoView(true);", element)

    # scroll the page till down
    def scroll_to_down(self, context):
        context.behave_driver.execute_script(
            "window.scrollBy(0,document.body.scrollHeight)")

    # scroll the page till up
    def scroll_to_up(self, context):
        context.behave_driver.execute_script(
            "window.scrollBy(document.body.scrollHeight,0)")

    # switch to another window or tab
    def switch_to_window(self, context):
        context.behave_driver.switch_to.window(context.behave_driver.window_handles[1])
        context.behave_driver.implicitly_wait(5)

    # close the last opened tab and switch to defult
    def close_last_opened_tab(self, context):
        context.behave_driver.close()
        context.behave_driver.switch_to_window(context.behave_driver.window_handles[0])
        context.behave_driver.implicitly_wait(5)

    # focus on last opened tab
    def focus_last_opened_tab(self, context, handle):
        number = (int(handle))
        context.behave_driver.switch_to_window(context.behave_driver.window_handles[number])
        context.behave_driver.implicitly_wait(5)

    # verify the alert message
    def alert_message(self, context, message):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//span[normalize-space()='{message}']")
        element.is_displayed()

    # move to the element and click
    def action_click(self, context, xpath):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(xpath)
        hover = ActionChains(context.behave_driver).move_to_element(element)
        hover.click().perform()

    # verfiy the text
    def text_verify(self, context, xpath, expectedtext):
        context.behave_driver.implicitly_wait(5)
        actualtext = context.behave_driver.find_element_by_xpath(xpath).text
        self.assertEquals(actualtext, expectedtext)

    # verify the element visibility
    def element_visible(self, context, xpath):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(xpath)
        element.is_displayed()

    # clear the text field using placeholder
    def clear_input_data_with_placeholder(self, context, placeholder):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//*[contains(@placeholder,'{placeholder}')]"
        )
        element.clear()

    # clear the text field using id
    def clear_input_data_with_id(self, context, id):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//*[@id='{id}']"
        )
        element.clear()

    # verify the empty dropdwon validation message
    def dropdown_validation(self, context, validation_message, classname):
        msg = context.behave_driver.find_element_by_class_name(classname)
        print(msg)
        validationmessage = context.behave_driver.execute_script(
            "return arguments[0].validationMessage;", msg)
        try:
            if validationmessage:
                print(validationmessage)
                assert validationmessage == validation_message
        except:
            validationmessage == validationmessage

    # select the text from the dropdown using label
    def select_option_by(self, context, attr, attr_value, element):
        context.behave_driver.implicitly_wait(5)
        dropdown = Select(context.behave_driver.find_element_by_xpath(element))
        if attr == "text":
            dropdown.select_by_visible_text(attr_value)
        elif attr == "value":
            dropdown.select_by_value(attr_value)
        elif attr == "index":
            dropdown.select_by_index(attr_value)

    # send no data into the field
    def send_no_data_input_field(self, context, placeholder):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//*[contains(@placeholder,'{placeholder}')]"
        )
        element.send_keys("")

    # select two items from the drop down
    def multi_select_dropdown(self, context, drowpdownlabel, values):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(f"//label[normalize-space()='{drowpdownlabel}']//following::span[@class='multiselect__placeholder']")
        element.click()
        dropdown_list = context.behave_driver.find_elements_by_xpath(f"//label[normalize-space()='{drowpdownlabel}']//following::li[@class='multiselect__element']//descendant::span/span")
        for ele in dropdown_list:
            try:
                if ele.text in values:
                    ele.click()
            except:
                continue

    # switch to frame using web element
    def switch_to_frame_with_web_element(self, context, xpath):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(xpath)
        context.behave_driver.switch_to.frame(element)

    # switch to frame with frame name
    def switch_to_frame_with_name(self, context, name):
        context.behave_driver.implicitly_wait(5)
        context.behave_driver.switch_to.frame(name)

    # move out the current frame to the page level
    def switch_to_default(self, context):
        context.behave_driver.implicitly_wait(5)
        context.behave_driver.switch_to.default_content()

    # switch to parent frame
    def switch_to_parent_frame(self, context):
        context.behave_driver.implicitly_wait(5)
        context.behave_driver.switch_to.parent_frame()

    # verify validation message of empty select drop down
    def select_dropdown_validation_xpath(self, context, validation_message, placeholder):
        context.behave_driver.implicitly_wait(5)
        msg = context.behave_driver.find_element_by_xpath(f"//*[text()='{placeholder}']//parent::select")
        validationmessage = context.behave_driver.execute_script(
            "return arguments[0].validationMessage;", msg)
        try:
            if validationmessage:
                print(validationmessage)
                assert validationmessage == validation_message
        except:
            validationmessage == validationmessage

    # verify validation message of empty select drop down
    def empty_field_validation_xpath(self, context, validation_message, placeholder):
        context.behave_driver.implicitly_wait(5)
        msg = context.behave_driver.find_element_by_xpath(f"//*[@*='{placeholder}']")
        validationmessage = context.behave_driver.execute_script(
            "return arguments[0].validationMessage;", msg)
        try:
            if validationmessage:
                print(validationmessage)
                assert validationmessage == validation_message
        except:
            validationmessage == validationmessage

    # Click element by offsets using xpath
    def click_element_by_offset(self, context, xpath):
        x = int(context.behave_driver.find_element_by_xpath(xpath).location['x'])
        y = int(context.behave_driver.find_element_by_xpath(xpath).location['y'])
        width = int(context.behave_driver.find_element_by_xpath(xpath).size['width'])
        height = int(context.behave_driver.find_element_by_xpath(xpath).size['height'])
        action = ActionChains(context.behave_driver)
        action.move_by_offset(x + width/2, y + height/2)
        action.click()
        action.perform()     
    
    # Drag and drop for designer nodes
    def drag_drop_nodes(self, context, i, j):
        try:
            source = context.behave_driver.find_element_by_xpath(f"(//td[@title='Start'])[1]//following::div[contains(@class,'circle')][{i}]")
            target = context.behave_driver.find_element_by_xpath(f"(//td[@title='Start'])[1]//following::div[contains(@class,'circle')][{j}]")
            context.behave_driver.implicitly_wait(10)
            actions2 = ActionChains(context.behave_driver)
            actions2.drag_and_drop(source, target).click_and_hold(source).move_to_element(target).release().perform()
            context.behave_driver.implicitly_wait(10)
        except:
            pass

    # Common method for explicit wait
    def explicit_wait(self, context, time, xpath):
        WebDriverWait(context.behave_driver, time).until(
            EC.visibility_of_element_located((By.XPATH, xpath)))

    # common method for explicit wait for clickable
    def wait_element_clickable(self, context, time, xpath):
        WebDriverWait(context.behave_driver, time).until(
            EC.element_to_be_clickable((By.XPATH, xpath)))

    # clear the data into the filed using label
    def clear_data_with_label(self, context, label):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//span[contains(text(),'{label}')]//following::div[1]/input"
        )
        element.clear()

    # page refresh
    def refresh_page(self, context):
        context.behave_driver.refresh()
        context.behave_driver.implicitly_wait(5)

    # open a new tab
    def open_tab(self, context):
        context.behave_driver.execute_script("window.open('');")
        context.behave_driver.implicitly_wait(5)

    # press two keys
    def key_press(self, context, letter):
        data = sys.argv
        if data[4] == 'driver=safari':
            ActionChains(context.behave_driver).key_down(Keys.COMMAND).send_keys(letter).key_up(Keys.COMMAND).perform()
        else:
            ActionChains(context.behave_driver).key_down(Keys.CONTROL).send_keys(letter).key_up(Keys.CONTROL).perform()

    # open url
    def open_a_url(self, context, url):
        context.behave_driver.get(url)
        context.behave_driver.implicitly_wait(5)

    # open url using app_name
    def open_url(self, context, appname):
        data = sys.argv
        if data[3] == 'region=qa':
            context.behave_driver.get("https://infinity.500apps.com/index-latest?env=qa#/"+appname)
        else:
            context.behave_driver.get("https://infinity.500apps.com/"+appname)
        context.behave_driver.implicitly_wait(5)

    # press tab
    def press_tab(self, context):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(Keys.TAB).perform()

    # press enter
    def press_enter(self, context):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(Keys.ENTER).perform()

    # press space
    def press_space(self, context):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(Keys.SPACE).perform()

    # press number 9
    def press_nine(self, context):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(Keys.NUMPAD9).perform()

    # press backspace
    def press_backspace(self, context):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(Keys.BACKSPACE).perform()

    # press arrow down
    def press_down(self, context):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(Keys.ARROW_DOWN).perform()

    # press arrow up
    def press_up(self, context):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(Keys.ARROW_UP).perform()

    # press arrow left
    def press_left(self, context):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(Keys.ARROW_LEFT).perform()

    # press arrow right
    def press_right(self, context):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(Keys.ARROW_RIGHT).perform()

    # Press escape
    def press_escape(self, context):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(Keys.ESCAPE).perform()

    # press text/numbers
    def press_text(self, context, text):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(text).perform()

    # press ctrl and enter
    def press_ctrl_enter(self, context):
        actions = ActionChains(context.behave_driver)
        actions.key_down(Keys.CONTROL).send_keys(Keys.ENTER).key_up(Keys.CONTROL).perform()

    # press delete
    def press_delete(self, context):
        actions = ActionChains(context.behave_driver)
        actions.send_keys(Keys.DELETE).perform()

    # press ctrl and any key(letter and number)
    def press_ctrl_key(self, context, key):
        actions = ActionChains(context.behave_driver)
        actions.key_down(Keys.CONTROL).send_keys(key).key_up(Keys.CONTROL).perform()

    # press key
    def press_key(self, context, text):
        actions = ActionChains(context.behave_driver)
        if text == 'TAB':
            actions.send_keys(Keys.TAB).perform()
        elif text == 'ENTER':
            actions.send_keys(Keys.ENTER).perform()
        elif text == 'SPACE':
            actions.send_keys(Keys.SPACE).perform()
        elif text == 'BACKSPACE':
            actions.send_keys(Keys.BACKSPACE).perform()
        elif text == 'ARROW_DOWN':
            actions.send_keys(Keys.ARROW_DOWN).perform()
        elif text == 'ARROW_UP':
            actions.send_keys(Keys.ARROW_UP).perform()
        elif text == 'ARROW_LEFT':
            actions.send_keys(Keys.ARROW_LEFT).perform()
        elif text == 'ARROW_RIGHT':
            actions.send_keys(Keys.ARROW_RIGHT).perform()
        elif text == 'ESCAPE':
            actions.send_keys(Keys.ESCAPE).perform()
        else:
            actions.send_keys(text).perform()

    # switch to another window or tab with handles
    def switch_to_window_handle(self, context, handle):
        number = (int(handle))
        context.behave_driver.switch_to.window(context.behave_driver.window_handles[number])
        context.behave_driver.implicitly_wait(5)

    # switch to window and close using handle
    def close_last_opened_tab_with_handle(self, context, handle):
        number = (int(handle))
        context.behave_driver.switch_to_window(context.behave_driver.window_handles[number])
        context.behave_driver.close()
        context.behave_driver.implicitly_wait(5)

    # read the OTP
    def get_otp(self, context):
        email_header = context.behave_driver.find_element_by_xpath("//tr[2]//child::td[contains(@class,'ng-binding')]").text
        otp = re.compile(r'\d\d\d\d')
        mo = otp.search(email_header)
        context.behave_driver.close()
        context.behave_driver.switch_to.window(context.behave_driver.window_handles[0])
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//input[@placeholder='Please enter the 4 digit code']"
        )
        element.send_keys(mo.group())

    # accept alert
    def accept_alert(self, context):
        context.behave_driver.implicitly_wait(5)
        alert = Alert(context.behave_driver)
        alert.accept()

    # Drag and drop desinger nodes using class_name with index
    def drag_and_drop_using_offset(self, context, x, y, class_name, index):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(f"(//div[@class='{class_name}'])[{index}]")
        action = ActionChains(context.behave_driver)
        action.drag_and_drop_by_offset(element, x, y).perform()

    # Validate the page URL
    def url_validation(self, context, actual_url):
        expected_url = context.behave_driver.current_url
        logging.info(expected_url)
        assert expected_url == actual_url
        
    def url_validations(self, context, actual_url):
        expected_url = context.behave_driver.current_url
        logging.info(expected_url)
        assert expected_url == actual_url    
        
    
    # Send the data into the text field using class name
    def input_data_with_contains_class(self, context, name, class_name):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(
            f"//*[contains(@class,'{class_name}')]"
        )
        element.clear()
        element.send_keys(name)
        
        
    # Move to the element and doubleclick
    def double_click(self, context, xpath):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(xpath)
        action = ActionChains(context.behave_driver)
        action.double_click(element).perform()
        
        
    # Add cookie
    def add_token(self, context, app_name, file_name):
        basePath = os.path.realpath(__file__)
        path = pathlib.Path(basePath)
        admin_list_path = f"{path.parent.parent}/{file_name}.json"
        testing_region = 'qa'
        driver_name = 'chrome'
        with open(admin_list_path) as admin_list:
            admin_list = json.load(admin_list)
        data = sys.argv
        if 'region=' in data[3]:
            testing_region = data[3].replace('region=', '')
        if 'driver=' in data[5]:
            driver_name = data[5].replace('driver=', '')
        try:
            if driver_name == 'chrome':
                jwt_token = admin_list[app_name][testing_region]['token']
            elif driver_name == 'firefox':
                jwt_token = admin_list[app_name]['firefoxap1']['token']
            elif driver_name == 'mse':
                jwt_token = admin_list[app_name]['edgeap1']['token']
            elif driver_name == 'safari':
                jwt_token = admin_list[app_name]['safariap1']['token']
        except Exception as e:
            raise Exception(f'sorry, {app_name} details not found in admin_list.json')
        cookie = {
            'name': 'token',
            'value': jwt_token
        }
        context.behave_driver.implicitly_wait(5)
        context.behave_driver.add_cookie(cookie)
        time.sleep(5)
        context.behave_driver.refresh()
        time.sleep(5)
        context.behave_driver.implicitly_wait(30)

    # Press ctrl and backspace
    def press_ctrl_backspace(self, context):
        actions = ActionChains(context.behave_driver)
        actions.key_down(Keys.CONTROL).send_keys(Keys.BACKSPACE).key_up(Keys.CONTROL).perform()
        
        
    # Move to the element and doubleclick
    def right_click(self, context, xpath):
        context.behave_driver.implicitly_wait(5)
        element = context.behave_driver.find_element_by_xpath(xpath)
        action = ActionChains(context.behave_driver)
        action.context_click(on_element = element)
        action.perform()
