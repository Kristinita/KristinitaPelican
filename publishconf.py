# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2017-01-17 17:43:09
# @Last Modified time: 2022-09-11 10:21:38
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

# [INFO] Enough to import the variables “CURRENTYEAR” and “JINJA_FILTERS”
# imports and “sys.path.append("..")” not required
from pelicanconf import CURRENTYEAR  # noqa: F401
from pelicanconf import JINJA_FILTERS  # noqa: F401
# from pelicanconf import FILENAME_METADATA  # noqa: F401

# pylint: enable=wrong-import-position, unused-import

globals().update(kira_load_settings(PRODUCTION_SETTINGS))
