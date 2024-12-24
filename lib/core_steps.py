from behave import *
from behave_webdriver.steps import *
from apps.lib.automation_base import Base
from selenium.webdriver.common.keys import Keys
from selenium.webdriver import ActionChains
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait

base_methods = Base()


class Steps(object):
    def __init__(self):
        super(Steps, self).__init__()


# Passing the data into the field using placeholder
@When('I add "{name}" into the inputfield "{placeholder}"')
def send_data_with_placeholder(context, name, placeholder):
    base_methods.input_data_with_placeholder(context, name, placeholder)


# Passing the data into the field contains placeholder text
@When('I add "{name}" into the inputfield with contains "{placeholder}"')
def send_data_with_placeholder(context, name, placeholder):
    base_methods.input_data_with_contains_placeholder(
        context, name, placeholder)


# Passing the data into the field using id
@When('I add "{text}" into the inputfield using Id "{idvalue}"')
def input_data_with_id_value(context, text, idvalue):
    base_methods.input_data_with_id(context, text, idvalue)


# Uploading a file
@When('I upload a file "{filename}" in "{app_name}" app using class "{class_name}"')
def upload_file(context, filename, class_name, app_name):
    base_methods.upload_files(
        context, filename, f"//input[contains(@class,'{class_name}')]", app_name)


# Click the link with text
@When('I click on the linktext "{text}"')
def click_link(context, text):
    base_methods.click_link_text(context, text)


# Click the button with text
@When('I click on the button using text "{text}"')
def click_button(context, text):
    base_methods.click_button_text(context, text)


# Scroll the page till down
@When('I scroll till the page down')
def scroll_down(context):
    base_methods.scroll_to_down(context)


# Scroll the page till up
@When('I scroll till the page up')
def scroll_up(context):
    base_methods.scroll_to_up(context)


# Switch to last opened tab
@When('I switch to the new tab')
def switch_to_window_or_tab(context):
    base_methods.switch_to_window(context)


# Focus on last opened tab
@When('I focus on last opened tab')
def last_last_opened(context):
    base_methods.focus_last_opened_tab(context)


    # Focus on last opened tab
@When('I focus on last opened tab using Xpath')
def last_last_opened(context):
    base_methods.focus_last_opened_tab(context)



# Clear the text field using placeholder
@When('I clear the data using "{placeholder}" from the text field')
def clear_input_data_placeholder(context, placeholder):
    base_methods.clear_input_data_with_placeholder(context, placeholder)


# Clear the text field using id
@When('I clear the input data using "{id}" from the text field')
def clear_input_data_placeholder(context, id):
    base_methods.clear_input_data_with_id(context, id)


# Click the button using label
@When('I click on the button using "{label}"')
def click_button_using_label(context, label):
    base_methods.click_button_with_label(context, label)


# Passing the data into the filed using label
@When('I add "{text}" into the inputfield with "{label}"')
def input_data_using_label(context, text, label):
    base_methods.input_data_with_label(context, text, label)


# Click on circular + button
@When('I click on circular plus button')
def click_circular_plus(context):
    base_methods.action_click(
        context, f"//span[@class='fe fe-plus position-absolute text-white float-plus']")


# Click on toggle button ex: +Add group
@When('I click on toggle button "{text}"')
def click_on_toggle_button(context, text):
    base_methods.click_element(context, f"//*[normalize-space()='{text}']")


# Click on edit or delete on hover (text= edit or trash)
@When('I click on "{text}" icon')
def click_options_on_hover(context, text):
    base_methods.action_click(
        context, f"//span[contains(@class,'fe fe-{text}')]")


# Click on edit or delete option in a 1st row
@When('I click on "{title}" icon in a row')
def click_on_options_in_row(context, title):
    base_methods.action_click(
        context, f"//tbody/tr[1]//child::span[@title='{title}']")


# Click on list or grid or calendar view buttons
@When('I click on "{text}" view button')
def click_on_view_button_with_span(context, text):
    base_methods.click_element(context, f"//span[@class='fe fe-{text}']")


# Click on list or grid or calendar view buttons
@When('I click on "{text}" icon using javascript')
def click_on_view_button_with_span(context, text):
    b = context.behave_driver.find_element_by_xpath(f"//span[contains(@class,'fe fe-{text}')]")
    context.behave_driver.execute_script("arguments[0].click();", b)


# Click on list or grid or calendar or paperclip symbols
@When('I click on "{text}" symbol button')
def click_on_view_button_with_i(context, text):
    base_methods.click_element(context, f"//i[@class='fe fe-{text}']")


# Select the text from the drop down using the label
@When('I select the "{attr}" "{value}" from the dropdown using label "{label}"')
def slect_text_dropdown_using_label(context, label, attr, value):
    base_methods.select_option_by(
        context, attr, value, f"//*[normalize-space()='{label}']//parent::*//select")


# Hover on the button text
@When('I hover on the button text "{text}"')
def hover_on_btn_txt(context, text):
    base_methods.move_to_element(
        context, f"//*[normalize-space()='{text}']")


# Click on label text
@When('I click on the label text "{label}"')
def click_on_lable(context, label):
    base_methods.click_element(
        context, f"//label//span[normalize-space()='{label}']")


# Click on button with exact text
@When('I click on the "{text}" button')
def click_on_lable(context, text):
    base_methods.click_element(context, f"//button[normalize-space()='{text}']")


# Send no data into the field using placeholder
@When('I add no data "" into the inputfield "{placeholder}"')
def no_data_field(context, placeholder):
    base_methods.send_no_data_input_field(context, placeholder)


# Select first two items from the drop down
@When('I select the items "{values}" from the multi select dropdown using "{label}"')
def click_on_lable(context, label, values):
    base_methods.multi_select_dropdown(context, label, values)


# Click on the element contains text
@When('I click on the element contains text "{text}"')
def click_on_task(context, text):
    base_methods.action_click(context, f"//*[contains(text(),'{text}')]")


# Click on element using title
@When('I click on element using title "{text}"')
def click_on_element_with_title(context, text):
    base_methods.click_element(context, f"//*[@title='{text}']")


# Click on element using text
@When('I click on the button with text "{text}"')
def click_button_using_text(context, text):
    base_methods.click_element(context, f"//*[text()='{text}']")


# Expect element text is visible
@Then('I expect that element text "{text}" is visible')
def elements_text_visible(context, text):
    base_methods.element_visible(
        context, f"//*[normalize-space()='{text}']")


# Expect element contains text is visible
@Then('I expect that element contains text "{text}" is visible')
def elements_contains_text_visible(context, text):
    base_methods.element_visible(
        context, f"//*[contains(text(),'{text}')]")


# Expect element text does not exists
@Then('I expect that button text "{text}" does not exist "{option}"')
def elements_text_visible(context, text, option):
    base_methods.verify_element_exists(
        context, f"//*[normalize-space()='{text}']", "{option}")


# Expect element text does not exists
@Then('I expect that element text "{element}" does not exist "{option}"')
def elements_text_visible(context, element, option):
    base_methods.verify_element_exists_2(
        context, element, option)


# Expect element text does not exists
@Then('I expect that element with text "{text}" does not exist "{option}"')
def elements_text_visible(context, text, option):
    base_methods.verify_element_exists_2(
        context, f"//*[normalize-space()='{text}']", option)


# Verify the alert message
@Then('I verify the alert message "{message}" is visible')
def alert_notify(context, message):
    base_methods.alert_message(context, message)


# Verify the empty dropdwon validation message
@Then('I expect validation message "{validation_message}" for empty dropdown "{classname}" matched')
def dropdown_validation_message(context, validation_message, classname):
    base_methods.dropdown_validation(context, validation_message, classname)


# Verify the empty field validation message
@Then('I expect validation message "{validation_message}" for input field "{textfieldid}" matched')
def empty_textfield_validation(context, validation_message, textfieldid):
    base_methods.textfield_validation(context, validation_message, textfieldid)


# Click on a button in a slide out
@When('I click on "{value}" "{text}" button')
def click_slide_out_buttons(context, value, text):
    base_methods.click_element(
        context, f"//div[contains(@id,'{value}')]//child::button[normalize-space()='{text}']")


# Pass data into the quill editor
@When('I pass data "{text}" into the quill editor in slide out "{slideoutid}"')
def pass_data_into_quill_editor(context, text, slideoutid):
    base_methods.input_text_locator(
        context, text, f"//div[contains(@id,'{slideoutid}')]//child::div[contains(@class,'ql-editor')]")


# Pass data into the input field using placeholder in a slide out
@When('I pass data "{text}" into the text field in slide out "{slideoutid}" using placeholder "{placeholder}"')
def send_data_into_text_field(context, text, slideoutid, placeholder):
    base_methods.input_text_locator(
        context, text, f"//div[@id='{slideoutid}']//child::input[@placeholder='{placeholder}']")


# Click icons in a slide out using class
@When('I click on the "{text}" icon in slide out "{slideoutid}"')
def click_icons_in_slide_out(context, text, slideoutid):
    base_methods.action_click(
        context, f"//div[@id='{slideoutid}']//*[contains(@class,'fe fe-{text}')]")


# Verify tooltip visible
@Then('I expect the button tooltip "{text}" should be visible')
def tooltip_visible(context, text):
    base_methods.element_visible(
        context, f"//button[@data-original-title='{text}']")


# Hover on button
@When('I hover on button "{title}"')
def hover_button(context, title):
    base_methods.move_to_element(context, f"//button[@title='{title}']")


# Switch to frame with frame name
@When('I switch to the frame with frame name "{name}"')
def switch_to_frame(context, name):
    base_methods.switch_to_frame_with_name(context, name)


# Switch to frame with web element
@When('I switch to the frame with web element "{value}"')
def switch_to_frame_by_web_element(context, value):
    base_methods.switch_to_frame_with_web_element(
        context, f"//iframe[@*='{value}']")


# Move out the current frame to the page level
@When('I switch to the default page')
def switch_to_page_level(context):
    base_methods.switch_to_default(context)


# Switch to parent frame
@When('I switch to the parent frame')
def switch_to_parent(context):
    base_methods.switch_to_parent_frame(context)


# Click on multi select drop down in slide out
@When('I click on the multi select drop down in slide out "{slideoutid}"')
def click_on_multi_select_drop_down(context, slideoutid):
    base_methods.action_click(
        context, f"//div[@id='{slideoutid}']//child::div[@class='multiselect__select']")


# Click options on element
@When('I click on "{text}" icon on element "{classname}"')
def click_options_on_element(context, classname, text):
    base_methods.action_click(
        context, f"//div[contains(@class,'{classname}')]//*[contains(@class,'fe fe-{text}')]")


# Click different formats in a quill editor
@When('I click on format button "{classname}" in quill editor')
def click_formats(context, classname):
    base_methods.action_click(
        context, f"//div[contains(@class,'quill-editor')]//child::*[contains(@class,'{classname}')]")


# Bold text visible in quill editor
@Then('I expect the bold text "{text}" visible')
def bold_text_visible(context, text):
    base_methods.element_visible(
        context, f"//strong[normalize-space()='{text}']")


# Italic text visible in quill editor
@Then('I expect the italic text "{text}" visible')
def italic_text_visible(context, text):
    base_methods.element_visible(context, f"//em[normalize-space()='{text}']")


# Underline text visible in quill editor
@Then('I expect the underline text "{text}" visible')
def underline_text_visible(context, text):
    base_methods.element_visible(context, f"//u[normalize-space()='{text}']")


# Strike text visible in quill editor
@Then('I expect the strike text "{text}" visible')
def strike_text_visible(context, text):
    base_methods.element_visible(context, f"//s[normalize-space()='{text}']")


# Code block text visible in quill editor
@Then('I expect the code block text "{text}" visible')
def code_block_text_visible(context, text):
    base_methods.element_visible(context, f"//pre[normalize-space()='{text}']")
    

# Background color and text color visible in quill editor
@Then('I expect the background color and text color "{color_code}" "{text}" visible')
def background_color_text_visible(context, color_code, text):
    base_methods.element_visible(
        context, f"//span[@style='{color_code}' and normalize-space()='{text}']")


# Verify element visible using xpath
@Then('I expect that element "{element}" visible')
def element_visible_using_xpath(context, element):
    base_methods.element_visible(
        context, f"{element}")


# Element click using xpath
@When('I click on the "{element}" using xpath')
def click_element_using_xpath(context, element):
    base_methods.click_element(
        context, f"{element}")


# Click on edit or delete under my apps
@When('I click on the options "{option}" under my apps "{app}"')
def click_button(context, app, option):
    base_methods.action_click(
        context, f"//h5[text()='{app}']//parent::div//child::*[contains(@class,'fe fe-{option}')]")


# Upload a file in slide out
@When('I upload the file "{filename}" in slide out  "{idvalue}" using label "{label}" in the "{app_name}" app')
def upload_file_slide_out(context, filename, idvalue, label, app_name):
    base_methods.upload_files(
        context, filename, f"//div[@id='{idvalue}']//child::*[contains(text(),'{label}')]//parent::fieldset//child::input", app_name)


# Click options in a particular row
@When('I click on "{title}" icon in a particular row "{num}"')
def click_on_options_in_row(context, title, num):
    base_methods.action_click(
        context, f"//tbody/tr[{num}]//child::*[@title='{title}']")


# Click elements in a slide out
@When('I click on element "{value}" "{text}" in slide out')
def click_slide_out_element(context, value, text):
    base_methods.action_click(
        context, f"//div[contains(@id,'{value}')]//child::*[contains(@class,'{text}')]")


# Click on future dates in a row using index from current date
@When('I click on particular date "{num}" in the calendar')
def click_on_future_dates(context, num):
    base_methods.click_element(context, f"//div[contains(@aria-label,'(Today)')]//following-sibling::div[{num}]")


# Verify validation message of empty select drop down
@Then('I expect validation message "{validation_message}" for empty select tag dropdown using "{placeholder}" matched')
def dropdown_validation(context, validation_message, placeholder):
    base_methods.select_dropdown_validation_xpath(context, validation_message, placeholder)


# Hover on element text in a slide out
@When('I move to element "{value}" "{class_name}"  "{text}" in slide out')
def hover_slide_out_element(context, value, class_name, text):
    base_methods.move_to_element(
        context, f"//div[@id='{value}']//child::*[contains(@class,'{class_name}') and text()='{text}']")


# Select the csv headers in mapping screen
@When('I select "{attr}" "{text}" from CSV headers in mapping screen with index "{index}"')
def click_on_drop_down(context, index, attr, text):
    base_methods.select_option_by(context, attr, text, f"//div[normalize-space()='CSV headers']//parent::div[@class='row']//following::select[{index}]")


# Click on toggle button(switch type)
@When('I click on toggle button')
def click_on_toggle_button_of_job_status(context):
    base_methods.action_click(context, "//div[contains(@class,'custom-switch')]//input")


# Hover on element contains text
@When('I hover on the contains text "{name}"')
def hover_on_contains_text(context, name):
    base_methods.move_to_element(context, f"//*[contains(text(),'{name}')]")


# Verify symbol visible
@Then('I expect that "{name}" symbol becomes visible')
def symbol_visible(context, name):
    base_methods.element_visible(context, f"//i[@class='fe fe-{name}']")


# Select the drop downs in activities using index
@When('I select the "{attr}" "{value}" from the dropdown using classname "{classname}" and index number "{num}"')
def slect_text_dropdown_using_label(context, classname, attr, value, num):
    base_methods.select_option_by(context, attr, value, f"//div[@class='{classname}']//child::div[{num}]//select")


# Pass data using data placeholder
@When('I add "{text}" to the data-placeholder "{placeholder}"')
def input_data_into_data_placeholder(context, text, placeholder):
    base_methods.input_text_locator(context, text, f"//*[@data-placeholder='{placeholder}']")


# Click on any date number
@When('I click on any date using class "{class_name}" "{num}" in the calendar')
def click_on_any_date(context, class_name, num):
    base_methods.click_element(context, f"//div[@aria-roledescription='Calendar']//child::span[contains(@class,'{class_name}') and text()='{num}']")


# Verify the empty field validation message using class name
@Then('I expect validation message "{validation_message}" for input field using class "{class_name}" matched')
def empty_text_field_validation(context, validation_message, class_name):
    base_methods.dropdown_validation(context, validation_message, class_name)


# Verify the empty field validation message using xpath
@Then('I expect validation message "{validation_message}" for input field using xpath "{text}" matched')
def empty_text_field_validation_xpath(context, validation_message, text):
    base_methods.empty_field_validation_xpath(context, validation_message, text)


# Click on element contains class
@When('I click on element contains class "{class_name}"')
def click_element_contains_class(context, class_name):
    base_methods.action_click(
        context, f"//*[contains(@class,'{class_name}')]")


# Click on the buttons based on the index numbers
@When('I click on "{text}" label "{name}" button with index number "{num}"')
def click_on_text_buttons(context, num, text, name):
    base_methods.action_click(context, f"//*[normalize-space()='{text}']//following::*[normalize-space()='{name}'][{num}]")


# Click the check box using offset
@When('I click on check box using "{items}" "{subject}" "{class_name}" and by x_offset and y_offset')
def click_by_offsets(context, items, subject, class_name):
    base_methods.click_element_by_offset(context, f"//div[normalize-space()='{subject}']//../../../../../../div[contains(@class,'{class_name}')]//child::*[{items}]")


# Click on resolution widths
@When('I click on preview with width "{num}"')
def click_on_preview_width(context, num):
    base_methods.action_click(
        context, f"//div[@data-width='{num}']")


# Element contains class becomes visible
@Then('I expect the element contains class "{classname}" becomes visible')
def icon_visible(context, classname):
    base_methods.element_visible(context, f"//*[contains(@class,'{classname}')]")


# Move to element contains class
@When('I move to the element contains class "{classname}"')
def move_contains_class(context, classname):
    base_methods.move_to_element(context, f"//*[contains(@class,'{classname}')]")


# Click a element in a particular row
@When('I click on "{element}" icon in "{num}" row')
def click_on_elements_in_row(context, element, num):
    base_methods.action_click(
        context, f"//tbody/tr[{num}]//child::*[{element}]")


# Click elements of LHS side in slide out
@When('I click on multiple elements "{elements}" using text "{text}" in LHS of the slide out "{slideout_id}"')
def click_lhs_elements(context, slideout_id, text, elements):
    base_methods.action_click(
        context, f"//div[contains(@id,'{slideout_id}')]//*[text()='{text}']//parent::div//following-sibling::*[contains({elements})]")


# Pass data into the field using label text
@When('I pass the data "{text}" into the field using label text "{label}"')
def pass_data_into_field(context, text, label):
    base_methods.input_text_locator(
        context, text, f"//*[contains(text(),'{label}')]//following::div[1]//input")


# Drag and drop using classname and node number
@When('I drag and drop from one node to another node using indexes "{i}" "{j}"')
def drag_drop_elements(context, i, j):
    base_methods.drag_drop_nodes(
        context, i, j
    )

# Click on element using tag


@When('I click on element contains "{ele}" using tag name "{tag}"')
def click_on_element(context, ele, tag):
    base_methods.action_click(context, f"//{tag}[contains({ele})]")


# Click on quill editor send button
@When('I click on the {text} send button')
def click_send_button(context, text):
    base_methods.action_click(
        context, f"//div[@data-placeholder={text}]//parent::div[@class='ql-container ql-snow']//following::button[1]/div")


# Click on color
@When('I click on color label "{text}"')
def click_on_color_label(context, text):
    base_methods.click_element(context, f"//*[@aria-label='{text}']")


# Upload a file in slide out using slide out id
@When('I upload the file "{filename}" in slide out  "{idvalue}" in the "{app_name}" app')
def upload_file_slide_out(context, filename, idvalue, app_name):
    base_methods.upload_files(
        context, filename, f"//div[@id='{idvalue}']//child::input", app_name)


# Click options on a card
@When('I click on "{option}" optoin on card "{card_name}" using index "{index}"')
def click_options_on_card(context, option, card_name, index):
    base_methods.action_click(
        context, f"//*[normalize-space()='{card_name}']//parent::*//following::*[contains(@class,'{option}')][{index}]")


# Wait for element visiblity
@When('I wait for the element "{element}" with in "{time}" seconds')
def wait_for_element_visibility(context, element, time):
    time = int(time)
    base_methods.explicit_wait(
        context, time, element)

# Wait for element clickable


@When('I wait for the element "{element}" to be clickable with in "{time}" seconds')
def wait_for_element_clickable(context, element, time):
    time = int(time)
    base_methods.wait_element_clickable(
        context, time, element)

# Facebook user verification


@When('I click on the confirmation "{text}" button in facebook login page')
def click_button_using_text(context, text):
    try:
        element = context.behave_driver.find_element_by_xpath(
            f"//button[text()='{text}']")
        if element.is_displayed():
            base_methods.click_element(context, f"//button[text()='{text}']")
    except:
        pass


# Range input slider
@When('I slide the "{label}" range input slider by range "{value}" by "{num}"')
def slide_the_range_input_slider(context, value, label, num):
    slider = context.behave_driver.find_element_by_xpath(f"(//*[text()='{label}']//parent::*//following::input)[{num}]")
    slide = int(value)
    for i in range(slide):
        slider.send_keys(Keys.RIGHT)


# Click on element/button text using index
@When('I click on the button with the text "{text}" and index "{index}"')
def click_text_with_index(context, text, index):
    base_methods.click_element(context, f"(//*[text()='{text}'])[{index}]")


# Clear the data into the filed using label
@When('I clear the inputfield with "{label}"')
def clear_data_using_label(context, label):
    base_methods.clear_data_with_label(context, label)


# Navigation for calendar previous or Next, index 1 is for previous 2 is for Next
@When('I click on the calendar navigation button with index "{index}"')
def calendar_navigation_click(context, index):
    base_methods.click_element(context, f"(//*[@class='b-calendar-header']/following::*[@aria-label='chevron left'])[{index}]")


# Upload the file using any attribute and value
@When('I upload the file "{filename}" using any attribute "{value}" in the "{app_name}" app')
def upload_file_slide_out(context, filename, value, app_name):
    base_methods.upload_files(
        context, filename, f"//input[contains(@{value})]", app_name)


# Press keys
@When('I press control plus "{key}"')
def press_keys(context, key):
    base_methods.key_press(context, key)


# Open site
@When('I open the url "{url}"')
def open_site(context, url):
    base_methods.open_a_url(context, url)


# Open site using app name
@When('I open the url using appname "{appname}"')
def open_site(context, appname):
    base_methods.open_url(context, appname)


# Delay
@When('I wait for "{time}" seconds')
def static_wait(context, time):
    base_methods.wait(context, time)


# Press enter
@When('I press the ENTER')
def press_enter(context):
    base_methods.press_enter(context)


# Press space
@When('I press the SPACE')
def press_spacebar(context):
    base_methods.press_space(context)


# Press 9
@When('I press 9')
def press_nine(context):
    base_methods.press_nine(context)


# Press escape
@When('I press the ESCAPE')
def press_escape(context):
    base_methods.press_escape(context)


# Press backspace
@When('I press the BACKSPACE')
def press_backspace(context):
    base_methods.press_backspace(context)


# Press uparrow
@When('I press the UPARROW')
def press_uparrow(context):
    base_methods.press_up(context)


# Press downarrow
@When('I press the DOWNARROW')
def press_downarrow(context):
    base_methods.press_down(context)


# Press rightarrow
@When('I press the RIGHTARROW')
def press_rightarrow(context):
    base_methods.press_right(context)


# Press leftarrow
@When('I press the LEFTARROW')
def press_leftarrow(context):
    base_methods.press_left(context)


# Press tab
@When('I press the TAB')
def press_tab(context):
    base_methods.press_tab(context)


# Page refresh
@When('I refresh the page')
def refresh_page(context):
    base_methods.refresh_page(context)


# Open a new tab with URL
@When('I open a new tab')
def open_new_tab(context):
    base_methods.open_tab(context)


# Press CTRL + ENTER
@When('I press CTRL and ENTER')
def press_enter(context):
    base_methods.press_ctrl_enter(context)


# Press delete
@When('I press DELETE key')
def press_delete_step(context):
    base_methods.press_delete(context)


# Press CTRL + any key
@When('I press CTRL and key "{key}"')
def press_ctrl(context, key):
    base_methods.press_ctrl_key(context, key)


# Send the number into the input field
@When('I add the number "{num}" into inputfield id "{idvalue}" for the slideout text "{text}"')
def num_with_id_value(context, num, text, idvalue):
    base_methods.input_text_locator(
        context, num, f"//*[text()='{text}']//following::input[@id='{idvalue}']")


# Close the last opened and switch to default
@When('I close last opened tab')
def close_tab_switch_default(context):
    base_methods.close_last_opened_tab(context)


# Focus on last opened window
@When('I focus on last opened tab "{handle}"')
def focus_on_new_window(context, handle):
    base_methods.focus_last_opened_tab(context, handle)


# Press text/numbers
@When('I press the "{text}"')
def press_text(context, text):
    base_methods.press_text(context, text)


# Press key/text/numbers
@When('I press the key of text "{text}"')
def press_key(context, text):
    base_methods.press_key(context, text)


# Switch to last opened tab with handles
@When('I switch to the new tab with handle "{num}"')
def switch_to_window_or_tab(context, num):
    base_methods.switch_to_window_handle(context, num)


# Switch to window and close using handle
@When('I close last opened tab with handle "{num}"')
def close_tab_switch_default(context, num):
    base_methods.close_last_opened_tab_with_handle(context, num)


# Element becomes visible
@Then('I expect the "{element}" becomes visible')
def icon_visible(context, element):
    base_methods.element_visible(context, f"{element}")


# Click on user gravatar
@When('I click on user gravatar')
def click_gravatar(context):
    base_methods.click_element(context, "//*[@class='drop-right pl-2 ml-2 settings-dropdown']")


# Read the OTP
@When('I get the OTP')
def otp(context):
    base_methods.get_otp(context)


# Accept alert
@When('I accept the alert')
def alert(context):
    base_methods.accept_alert(context)


# Pass data into the field using placeholder
@When('I pass data "{text}" into the placeholder "{placeholder}" with index number "{num}"')
def send_data_into_text_field(context, text, placeholder, num):
    base_methods.input_text_locator(
        context, text, f"(//input[@placeholder='{placeholder}'])[{num}]")


# Click on id value
@When('I click on id "{idvalue}"')
def click_on_the_idvalue(context, idvalue):
    base_methods.action_click(
        context, f"//*[@id='{idvalue}']")


# Double click using title
@When('I double click on the node "{title_name}" to design')
def drag_and_drop_by_offset(context, title_name):
    element = context.behave_driver.find_element_by_xpath(
        f"//*[@title='{title_name}']")
    action = ActionChains(context.behave_driver)
    action.double_click(element).perform()


# Click element text with index
@When('I click on the text "{text}" using index "{index}"')
def click_with_index(context, text, index):
    base_methods.action_click(context, f"(//span[normalize-space()='{text}'])[{index}]")


# Move the position of nodes in designer
@When('I drag and drop element having class "{class_name}" by offset "{x}" and "{y}" with "{index}"')
def drag_and_drop_by_class_name(context, x, y, class_name, index):
    base_methods.drag_and_drop_using_offset(context, x, y, class_name, index)


# Select in mapping screen
@When('I select "{attr}" "{text}" from "{name}" in mapping screen with index "{index}"')
def click_on_drop_down(context, index, text, name, attr):
    base_methods.select_option_by(context, attr, text, f"//div[normalize-space()='{name}']//parent::div[@class='row']//following::select[{index}]")


# Select copy icon using copy url path
@When('I click on "{text}" copy clip button')
def click_on_view_button_with_copy(context, text):
    base_methods.click_element(context, f"//*[@title='{text}']")


# Click on edit and delete icons on a project using javascript
@When('I click "{text}" icon using javascript')
def click_on_view_button_with_span(context, text):
    b = context.behave_driver.find_element_by_xpath(f"//div[@class='popover-body']//span[contains(@class,'fe fe-{text}')]")
    context.behave_driver.execute_script("arguments[0].click();", b)


# Select the value from dropdown using classname
@When('I select "{attr}" "{value}" using class name "{classname}"')
def select_value_by_classname(context, attr, value, classname):
    base_methods.select_option_by(context, attr, value, f"//select[contains(@class,'{classname}')]")


# Click on icons like edit or delete in a list row using class name
@When('I click on the "{icon_classname}" icon in a particular row "{num}" using tag "{tag}"')
def click_icon_in_row(context, icon_classname, num, tag):
    base_methods.action_click(
        context, f"//tbody/tr[{num}]//child::{tag}[contains(@class,'{icon_classname}')]")


# Click icons using element,tag and index
@when('I click on the element text "{ele}" using tagname "{tag}" with index "{index}"')
def click_with_index(context, ele, index, tag):
    base_methods.click_element(context, f"(//{tag}[{ele}])[{index}]")


# Click icons using two elements
@When('I click on the "{ele1}" in slide out using another "{ele2}"')
def click_icons_in_slide_out(context, ele1, ele2):
    base_methods.action_click(context, f"//*[{ele2}]//*[{ele1}]")


# Hover on a element text in a slide out using element and tag
@When('I hover on the element text "{ele}" in the slide out using "{tag}"')
def hover_on_contains_text_in_slide_out(context, ele, tag):
    base_methods.move_to_element(context, f"//{tag}[contains(text(),'{ele}')]")


# Validate the page URL
@Then('I verify the url "{url}" of the page')
def validate_url(context, url):
    base_methods.url_validation(context, url)
    

# Click on toggle button using xpath
@When('I click on the toggle button using xpath "{xpath}"')
def click_on_toggle_button(context, xpath):
    base_methods.click_element_by_offset(context, xpath)


# Select member for group/project
@When('I select "{attr}" "{text}" from add user popup using user name "{user_name}"')
def click_on_drop_down(context, text, attr, user_name):
    base_methods.select_option_by(context, attr, text, f"//span[normalize-space()='{user_name}']//..//..//select")
    

# Validate tab slection
@Then('I expect group or project "{name}" is selected "{value}"')
def tab_select(context, name, value):
    base_methods.element_visible(context, f"//a[@aria-selected='{value}']//child::*[text()='{name}']")
    
  
# Passing the data into the field contains class
@When('I add "{text}" into the inputfield using class name "{class_name}"')
def send_data_with_class(context, text, class_name):
    base_methods.input_data_with_contains_class(
        context, text, class_name)  

# Click onboarding cross button
@When('I click on onboarding cross button when it appears')
def click_onboarding_cross_button(context):
     try:
        WebDriverWait(context.behave_driver, 10).until(
            EC.visibility_of_element_located((By.XPATH, "//img[@class='close_image']")))
        element = context.behave_driver.find_element_by_xpath(
            f"//img[@class='close_image']")
        element.click()
     except:
         pass
     
# Double click using xpath
@When('I double click on the element using "{xpath}"')
def double_click(context, xpath):
    base_methods.double_click(context,xpath)
    
# Login to admin/user accounts
@When('I login to "{account_name}" account "{app_name}"')
def add_admin_token(context, account_name, app_name):
    base_methods.add_token(context, app_name, f"{account_name}_list")


# Scroll to the element
@When('I scroll till the element located "{xpath}"')
def scroll_till_element(context, xpath):
    base_methods.scroll_to_element(context, xpath)


# Press CTRL + BACKSPACE
@When('I press CTRL and BACKSPACE')
def press_backspace(context):
    base_methods.press_ctrl_backspace(context)
    

# Add text into placeholder using element and tag
@when('I add "{text}" to the field "{field_name}" using tagname "{tag}" with index "{index}"')
def pass_data_into_field(context, index, tag, field_name, text):
    base_methods.input_text_locator(context, text, f"(//{tag}[{field_name}])[{index}]")
    
    
# Right click using xpath
@When('I right click on the element using xpath "{xpath}"')
def right_click_element(context, xpath):
    base_methods.right_click(context, xpath)


# Element click using actions
@When('I click on the "{element}" with actions using xpath')
def click_element_using_actions(context, element):
    base_methods.action_click(
        context, f"{element}")
