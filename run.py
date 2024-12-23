import os
import json
import shutil
import argparse
import webbrowser
from glob import glob

brand_banner = '''
 ┌─────────────────────────────────────────────────────────┐
 │  #######   ###     ###                                  │
 │  #        #   #   #   #    ##   #####  #####   ####     │
 │  #       #     # #     #  #  #  #    # #    # #         │
 │  ######  #     # #     # #    # #    # #    #  ####     │
 │        # #     # #     # ###### #####  #####       #    │
 │  #     #  #   #   #   #  #    # #      #      #    #    │
 │   #####    ###     ###   #    # #      #       ####     │
 └─────────────────────────────────────────────────────────┘
'''

print('\033[34m' + brand_banner)


def path_converter(_path):
    if os.name == 'nt':
        return _path.replace('/', '\\')
    return _path


apps_dir_extension = [
    dir.path + path_converter('/extension') for dir in os.scandir('apps')
    if dir.is_dir() and ('lib' not in dir.path and 'pycache' not in dir.path)
]

apps_dir_smoke = [
    dir.path + path_converter('/features') for dir in os.scandir('apps')
    if dir.is_dir() and ('lib' not in dir.path and 'pycache' not in dir.path)
]


apps_dir_regression = [
    dir.path + path_converter('/regression') for dir in os.scandir('apps')
    if dir.is_dir() and ('lib' not in dir.path and 'pycache' not in dir.path)
]

apps_dir = apps_dir_smoke + apps_dir_regression + apps_dir_extension
parser = argparse.ArgumentParser()

parser.add_argument('--region',
                    metavar='dev',
                    type=str,
                    choices=['dev', 'qa', 'us1', 'eu1', 'ap1', 'sa1', 'firefoxap1', 'edgeap1', 'safariap1'],
                    help='testing region',
                    required=True)

parser.add_argument('--driver',
                    metavar='chrome',
                    type=str,
                    choices=['chrome', 'firefox', 'safari', 'mse'],
                    help='on which browser you wanted to test',
                    required=True)

parser.add_argument('--path',
                    metavar='path',
                    type=str,
                    choices=apps_dir,
                    help='your app name',
                    required=True)

parser.add_argument('--allure',
                    metavar='allure',
                    type=str,
                    help='to generate report')

parser.add_argument('--verbose',
                    metavar='verbose',
                    type=str,
                    help='show details mode')

args = parser.parse_args()

# copy env file
shutil.copy2(path_converter('apps/lib/environment.py'),
             path_converter(f'{args.path}/environment.py'))


app_name = args.path.split(path_converter('/'))[1]

# if args.allure and shutil.which('allure'):
if args.allure:
    if not shutil.which('java'):
        print('please install jdk 8')
        if os.name == 'nt':
            webbrowser.open('https://devwithus.com/install-java-windows-10/')
        else:
            webbrowser.open(
                'https://computingforgeeks.com/how-to-install-java-8-on-ubuntu/'
            )

        exit(143)

    if not shutil.which('allure'):
        print('please install allure')
        webbrowser.open(
            'https://github.com/allure-framework/allure2/releases/tag/2.14.0'
        )

        exit(143)

    result_dirs = ['report_html', 'report_json']

    for result_dir in result_dirs:
        if os.path.exists(result_dir):
            shutil.rmtree(result_dir)

        os.mkdir(result_dir)

    print('running behave in silent mode, to generate json')

    behave_cmd = f'behave -f allure_behave.formatter:AllureFormatter -o {path_converter("report_json/"+app_name)} {args.path} -D region={args.region} -D driver={args.driver}'

    status = os.system(behave_cmd)

    results = []
    if os.path.exists('results.json'):
        f = open('results.json', 'r')
        existing_results = json.loads(f.read())
        f.close()

        results_data = {}
        results_data['app_name'] = app_name
        results_data['status'] = status

        existing_results.append(results_data)

        with open('results.json', 'w') as result:
            json.dump(existing_results, result)

    else:
        results_data = {}
        results_data['app_name'] = app_name
        results_data['status'] = status
        results.append(results_data)

        with open('results.json', 'w') as result:
            json.dump(results, result)

    print('generating allure report')

    allure_cmd = f'allure generate {path_converter("report_json/"+app_name)} --clean --output {path_converter("report_html/"+app_name)}'

    os.system(allure_cmd)
else:
    print('running behave')
    behave_cmd = f'behave {args.path} -D region={args.region} -D driver={args.driver}'
    os.system(behave_cmd)
