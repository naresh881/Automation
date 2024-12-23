import os
import time
from os import path
import pathlib
from apps.lib.core import Infinity

cntx = Infinity()


def path_converter(_path):
    if os.name == 'nt':
        return _path.replace('/', '\\')
    return _path


def before_all(context):
    # get driver name from cli
    driver_name = context.config.userdata['driver']

    # setting up app name from cwd
    app_path = path.dirname(path.realpath(__file__))
    app_name = app_path.split(path_converter('/'))[len(app_path.split(path_converter('/')))-2]

    # get region / env
    testing_region = context.config.userdata['region']

    # initialize webdriver
    if app_name == "ninjaseo" or app_name == "botpath" or app_name == "hipsocial" or app_name == "finder":
        basePath = os.path.realpath(__file__)
        expath = pathlib.Path(basePath)
        filepath = f"{expath.parent.parent.parent}/lib/extensions/{app_name}.crx"
        time.sleep(5)
        context.behave_driver = cntx.initializing_webdriver(driver_name, filepath)
    else:
        context.behave_driver = cntx.initializing_webdriver(driver_name)

    cntx.setting_up_cookies(context, testing_region, app_name, driver_name)


def after_scenario(context, scenario):
    # cleanup after tests run
    time.sleep(2)
    context.behave_driver.refresh()
    time.sleep(1)


def after_step(context, step):
    time.sleep(1)


def after_all(context):
    context.behave_driver.quit()
