import time
import behave_webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.firefox.options import Options as ff_options
from msedge.selenium_tools import Edge, EdgeOptions
from apps.default_settings import *


class Infinity(object):
    def __init__(self):
        super(Infinity, self).__init__()

    def initializing_webdriver(self, driver_name, path=None):
        print('detected browser 🌐', driver_name)

        executable_path, options = get_driver(driver_name)

        # for chrome
        if driver_name == 'chrome':
            chrome_options = Options()

            for chrome_args in options:
                chrome_options.add_argument(chrome_args)
                chrome_options.add_experimental_option(
                    "excludeSwitches", ["enable-logging"])
                if path is not None:
                    chrome_options.add_extension(path)

            return behave_webdriver.Chrome(
                executable_path=executable_path, options=chrome_options)

        # for firefox
        elif driver_name == 'firefox':
            firefox_options = ff_options()
            if len(options):
                firefox_options.add_argument("--headless")
            return behave_webdriver.Firefox(
                executable_path=executable_path, options=firefox_options)

        elif driver_name == 'safari':
            return behave_webdriver.Safari(
                executable_path=executable_path)
        # for edge
        elif driver_name == 'mse':
            edge_option = EdgeOptions()
            if len(options):
                edge_option.use_chromium = True
                edge_option.add_argument("headless")
            return Edge(
                executable_path=executable_path,  options=edge_option)
        else:
            raise Exception(f'webdriver {driver_name} not supported yet')

     # Maximize browser window and set the user cookies
    def setting_up_cookies(self, context, testing_region, app_name, driver_name):
        context.behave_driver.maximize_window()
        print('detected window 💻 ', context.behave_driver.get_window_size())

        if testing_region in 'devqa':
            infinity_url = f'{infinity_base_url}index-latest?env={testing_region}#/'
        else:
            infinity_url = infinity_base_url

        context.behave_driver.get(infinity_url)

        try:
            if driver_name == 'chrome':
                jwt_token = user_list[app_name][testing_region]['token']
            elif driver_name == 'firefox':
                jwt_token = user_list[app_name]['firefoxap1']['token']
            elif driver_name == 'mse':
                jwt_token = user_list[app_name]['edgeap1']['token']
            elif driver_name == 'safari':
                jwt_token = user_list[app_name]['safariap1']['token']
        except Exception as e:
            raise Exception(f'sorry, {app_name} details not found in user_list.json')

        cookie = {
            'name': 'token',
            'value': jwt_token
        }
        context.behave_driver.add_cookie(cookie)
        time.sleep(5)
        context.behave_driver.refresh()
        context.behave_driver.get(infinity_url+app_name)
        return context.behave_driver