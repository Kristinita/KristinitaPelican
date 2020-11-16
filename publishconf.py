# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2017-01-17 17:43:09
# @Last Modified time: 2020-09-24 14:14:47
"""Pelican configuration file.

For publishing. pelicanconf.py — for development.
"""
# [WARNING] Close all files from “output” folder in all programs,
# that “pelican -s publishconfig.py” run without warnings and errors.

import sys

sys.path.append(".")

# [INFO] Disable pylint unused-import for CURRENTYEAR variable:
# https://stackoverflow.com/a/12036086/5951529

# pylint: disable=wrong-import-position, unused-import

from pelican_settings_loader import PRODUCTION_SETTINGS  # noqa: E402
from pelican_settings_loader import kira_load_settings  # noqa: E402
from pelicanconf import CURRENTYEAR  # noqa: F401
# from pelicanconf import FILENAME_METADATA  # noqa: F401

# pylint: enable=wrong-import-position, unused-import

globals().update(kira_load_settings(PRODUCTION_SETTINGS))
