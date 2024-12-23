import behave
from behave_webdriver.steps import *
import os
import pathlib
from apps.finder.extension.steps.locators import Locators
from behave import *
import time
from apps.lib.automation_base import Base
from apps.lib.core_steps import *
from selenium import webdriver
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options

elements = Locators()
base_methods = Base()


@when('I open finder extension html page')
def extension(context):
    context.behave_driver.get("chrome-extension://lgffeamjjemnjmkpjppghejpdhaahlkn/popup/popup.html")
    time.sleep(5)


@when('I open "{finder}" url')
def open_url(context, finder):
    context.behave_driver.get(f"{finder}")
    time.sleep(3)


@when('I select element with text "{option_value}"')
def select_option(context, option_value):
    base_methods.action_click(context, f"//span[@data-selected='Selected']/span[contains(text(),'{option_value}')]")
