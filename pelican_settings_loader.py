# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2019-03-12 07:49:38
# @Last Modified time: 2019-03-12 19:57:39
"""Convert YAML variables to Python.

Argumentation and details:
https://stackoverflow.com/a/55099893/5951529
"""

# [INFO] Parse YAML configuration files:
# https://stackoverflow.com/q/41974628/5951529
# [INFO] Using ruamel.yaml — superset of of PyYAML.
# PyYAML not support YAML 1.2 at March 2019:
# https://github.com/yaml/pyyaml/issues/116
# https://stackoverflow.com/a/38922434/5951529
import ruamel.yaml as yaml

CONFIG_DIR = "pelican-config"

# [INFO] Files for pelicanconf.py and publishconf.py both
DEV_AND_PRODUCTION_SETTINGS = [
    'generation',
    'markdown_plugins_settings',
    'other',
    'paths',
    'pelican_plugins_settings'
]

# [INFO] Files specify for pelicanconf.py
DEV_SPECIFIC_SETTINGS = ['dev']
# [INFO] Files specify for publishconf.py
PRODUCTION_SPECIFIC_SETTINGS = ['feeds', 'production']

# [INFO] All settings for pelicanconf.py
DEV_SETTINGS = DEV_AND_PRODUCTION_SETTINGS + DEV_SPECIFIC_SETTINGS
# [INFO] All settings for publishconf.py
PRODUCTION_SETTINGS = DEV_AND_PRODUCTION_SETTINGS + PRODUCTION_SPECIFIC_SETTINGS


def kira_load_settings(pelicansettings):
    """Load settings.

    https://stackoverflow.com/a/55099893/5951529
    """
    variables = {}
    # [INFO] Relative settings, that user can change
    # [BUG] Needs add encoding for AppVeyor:
    # https://stackoverflow.com/a/16347110/5951529
    # https://github.com/appveyor/ci/issues/2129
    # https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/job/jhtr2opsnckg214g
    variables.update(
        yaml.safe_load(
            open(
                'site_variables.yaml',
                encoding='utf-8')))
    for settings_file in pelicansettings:
        # [INFO] Convert Python dictionary to variables:
        # https://stackoverflow.com/a/36059129/5951529
        # [FIXME] Duplicate variables.update() function
        variables.update(yaml.safe_load(open(
            CONFIG_DIR +
            '/' +
            settings_file +
            '.yaml',
            encoding='utf-8')))
    return variables
