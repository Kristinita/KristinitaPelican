# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2017-01-17 17:43:09
# @Last Modified time: 2019-01-27 13:56:23
"""Pelican configuration file.

For development. publishconf.py — for publishing.
"""
import os
import sys
# Parse YAML configuration file:
# https://stackoverflow.com/q/41974628/5951529
# Require PyYAML module:
# http://pyyaml.org/wiki/PyYAML
import yaml

# Import custom settings:
# https://stackoverflow.com/a/44891159/5951529
CONFIG_DIR = "pelican-config"

sys.path.append(os.path.abspath(CONFIG_DIR))

from generation import *  # noqa
from markdown_plugins_settings import *  # noqa
from other import *  # noqa
from paths import *  # noqa
from pelican_plugins_settings import *  # noqa

# ****************************************************************************
# *                                 Relative                                 *
# ****************************************************************************

# Relative settings, that user can change
# Configuration from YAML files.
# [BUG] Needs add encoding for AppVeyor:
# https://stackoverflow.com/a/16347110/5951529
# https://github.com/appveyor/ci/issues/2129
# https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/job/jhtr2opsnckg214g
YAMLCONFIG = yaml.load(open('pelicanvariables.yaml', encoding='utf-8'))

PATH = YAMLCONFIG['path']
OUTPUT_PATH = YAMLCONFIG['output_path']
THEME = YAMLCONFIG['theme']
THEME_STATIC_DIR = YAMLCONFIG['theme_static_dir']
THEME_STATIC_PATHS = YAMLCONFIG['theme_static_paths']
PLUGIN_PATHS = YAMLCONFIG['plugin_paths']

AUTHOR = YAMLCONFIG['author']
SITENAME = YAMLCONFIG['sitename']
TIMEZONE = YAMLCONFIG['timezone']
DEFAULT_LANG = YAMLCONFIG['default_lang']
CACHE_PATH = YAMLCONFIG['cache_path']

# Path for pages
# [Hack] That exclude articles, include non-exicting folder.
# «ARTICLE_PATHS = None» — critical error, integer parameter
PAGE_PATHS = YAMLCONFIG['page_paths']
# Path for articles
# Don't set “PAGE_PATHS = ['']”! See
# https://github.com/getpelican/pelican/issues/2123
ARTICLE_PATHS = YAMLCONFIG['article_paths']

GITHUB_SOURCES_URL = YAMLCONFIG['github_sources_url']
GITHUB_OUTPUT_URL = YAMLCONFIG['github_output_url']
