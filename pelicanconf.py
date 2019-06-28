# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2017-01-17 17:43:09
# @Last Modified time: 2019-06-23 12:06:45
"""Pelican configuration file.

For development. publishconf.py — for publishing.
"""
import sys

from datetime import date

# [INFO] Enable import from current working directory.
# [NOTE] Doesn't need “os” module:
# https://github.com/getpelican/pelican-blog/blob/master/publishconf.py
# [WARNING] I can't find better solution for it:
# https://stackoverflow.com/a/28154841/5951529
sys.path.append(".")

# [LEARN][PYTHON] Use IPython %load and %whos, that view variables of current file:
# https://ipython.readthedocs.io/en/stable/interactive/magics.html#built-in-magic-commands
# https://ipython.readthedocs.io/en/stable/interactive/magics.html#magic-loadpy
# https://stackoverflow.com/a/21034906/5951529
# https://stackoverflow.com/a/634581/5951529


# [INFO] Disable flake8 errors:
# https://stackoverflow.com/a/38338146/5951529
# [NOTE] “noqa”, not “NOQA” works for Anaconda:
# https://stackoverflow.com/a/46759770/5951529
# [INFO] Disable pylint errors:
# https://stackoverflow.com/a/48836605/5951529

# pylint: disable=wrong-import-position

from pelican_settings_loader import DEV_SETTINGS  # noqa: E402
from pelican_settings_loader import kira_load_settings  # noqa: E402

# pylint: enable=wrong-import-position

# [INFO] Insert current year to templates:
# https://bernhard.scheirle.de/posts/2016/February/29/how-to-keep-your-copyright-year-up-to-date-using-jinja-filters/
CURRENTYEAR = date.today().year

# [INFO] Convert Python dictionary to variables.
# [NOTE] “locals()” and “globals” is a bad idea:
# https://stackoverflow.com/a/36059129/5951529
globals().update(kira_load_settings(DEV_SETTINGS))
