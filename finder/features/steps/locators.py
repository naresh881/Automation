
class Locators(object):
    upload_file_xpath = "//input[@class='file-input']"
    move_to_25th_row = "//tr[@aria-rowindex='25']"
    click_on_multi_select_dropdown = "//label[normalize-space()='Group Members']//following::span[@class='multiselect__placeholder']"
    select_options = "//label[normalize-space()='Tag name']//following::li[@class='multiselect__element']//descendant::span/span"
