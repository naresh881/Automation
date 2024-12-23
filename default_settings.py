import json
from os import environ
from os import path

from behave_webdriver import driver

automation_mode = environ.get('AUTOMATION_GUI', False)

driver_options = [
    'headless',
    'no-sandbox',
    'disable-setuid-sandbox',
    'disable-dev-shm-usage',
    'window-size=1920,1080',
]

user_list_path = path.dirname(path.realpath(__file__)) + '/user_list.json'
with open(user_list_path) as user_list:
    user_list = json.load(user_list)


def get_driver(web_driver):
    supported_drivers = [
        'chrome',
        'firefox',
        'safari',
        'mse'
    ]
    driver = web_driver.lower()
    if driver not in supported_drivers:
        raise Exception(f'webdriver {driver} not supported yet')

    if driver == 'chrome':
        if environ.get('CHROMEWEBDRIVER'):
            driver_path = '/usr/local/share/chrome_driver/chromedriver'
        else:
            driver_path = environ.get('DRIVER_PATH', '/usr/local/bin/chromedriver')

        if automation_mode:
            driver_options.remove('headless')
            driver_options.remove('no-sandbox')

        return driver_path, driver_options
    elif driver == 'firefox':
        if environ.get('GECKOWEBDRIVER'):
            driver_path = '/usr/local/share/gecko_driver/geckodriver'
        else:
            driver_path = environ.get('DRIVER_PATH', '/usr/local/bin/geckodriver')

        if automation_mode:
            driver_options.clear()
        else:
            driver_options.clear()
            driver_options.append('--headless')

        return driver_path, driver_options
    elif driver == 'safari':
        if environ.get('SAFARIDRIVER'):
            driver_path = '/usr/bin/safaridriver'
        else:
            driver_path = environ.get('DRIVER_PATH', '/usr/bin/safaridriver')

        if automation_mode:
            driver_options.clear()
        else:
            driver_options.clear()
            driver_options.append('--headless')

        return driver_path, driver_options

    elif driver == 'mse':
        if environ.get('MSEWEBDRIVER'):
            driver_path = 'c:\\mseodriver'
        else:
            driver_path = environ.get('DRIVER_PATH', 'c:\\mseodriver')

        if automation_mode:
            driver_options.clear()
        else:
            driver_options.clear()
            driver_options.append('--headless')

        return driver_path, driver_options


infinity_base_url = 'https://infinity.500apps.com/'
