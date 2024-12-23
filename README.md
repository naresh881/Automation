[![N|Solid](https://warehouse-camo.ingress.cmh1.psfhosted.org/3b046ad42380f4a376f5df7074ae8fff346de56a/68747470733a2f2f7261772e6769746875622e636f6d2f6265686176652f6265686176652f6d61737465722f646f63732f5f7374617469632f6265686176655f6c6f676f312e706e67)](https://infinity.500apps.com)

| Environment      | Status                                                                                                                                                                                                                                            |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SINGLE-APP-RUN   | [![SINGLE-APP-RUN](https://github.com/agilecrm/infinity-qa-automation/actions/workflows/individual-app-automation-test.yml/badge.svg)](https://github.com/agilecrm/infinity-qa-automation/actions/workflows/individual-app-automation-test.yml)   |
| SCHEDULED-RUNNER | [![SCHEDULED-REPORT-UPDATE](https://github.com/agilecrm/infinity-qa-automation/actions/workflows/status-page-updater.yml/badge.svg?branch=develop)](https://github.com/agilecrm/infinity-qa-automation/actions/workflows/status-page-updater.yml) |

## Table of contents

- [Table of contents](https://github.com/agilecrm/infinity-qa-automation#table-of-contents)
- [Environments variables](https://github.com/agilecrm/infinity-qa-automation#available-env-variables)
- [Configuration options](https://github.com/agilecrm/infinity-qa-automation#configuration-options)
- [Installation](https://github.com/agilecrm/infinity-qa-automation#installation)
  - [Run in linux/unix](https://github.com/agilecrm/infinity-qa-automation#run-in-linux-unix)
  - [Run in windows](https://github.com/agilecrm/infinity-qa-automation#run-in-windows)
  - [All usage](https://github.com/agilecrm/infinity-qa-automation#all-usage)

## Available env variables

```
DRIVER_PATH              :-  required
AUTOMATION_GUI           :-  optional (default False)
```

## Configuration options

#### `DRIVER_PATH`

if you want to use a specific chrome driver you can set this value in environment variable.

- [Download chrome driver](https://chromedriver.chromium.org/downloads)
- [Download firefox driver](https://github.com/mozilla/geckodriver/releases)
- [Download msedriver driver](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/)

#### `AUTOMATION_GUI`

See the automation in live.

## Installation

Requires python 3.6 + and java 8

##### Run in LINUX/UNIX

```sh
git clone https://github.com/agilecrm/infinity-qa-automation.git
cd infinity-qa-automation
pip3 install -r requirements.txt
python3 run.py --path apps/finder/features --region qa --driver firefox
```

##### Run in WINDOWS

```batch
git clone https://github.com/agilecrm/infinity-qa-automation.git
cd infinity-qa-automation
pip install -r requirements.txt
python run.py --path apps\finder\features --region qa --driver firefox
```

##### All usage

```batch
usage: run.py [-h] --region dev --driver chrome --path path [--allure allure] [--verbose verbose]

optional arguments:
  -h, --help         show this help message and exit
  --region dev       testing region
  --driver chrome    on which browser you wanted to test
  --path path        your app name
  --allure allure    to generate report
  --verbose verbose  show details mode


```

500apps QA Automation modules, having following settings.

- main app is under apps folder
- global configuration file location apps/default_settings.py
- all the reusable methods implemented in automation_base file, if we wants to use those methods need to import them into the respective app .py file and keep the xpaths in locators.py file. There are few common steps implemented in core_steps file. This commons steps text just we need to write in feature file based on the requirement

## Modules added

- finder
- forms

## Explanation video

- [To run the automation scenarios in linux/unix/windows](https://drive.google.com/file/d/1TxkrG0ksNFimGb19fGzudXke5Wr2FzZC/view?usp=sharing)
