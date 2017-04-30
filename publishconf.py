#!/usr/bin/env python
# -*- coding: utf-8 -*- #

# This file used if use `make publish` or
# explicitly specify it as your config file.

import os
import sys

sys.path.append(os.curdir)

from pelicanconf import *  # NOQA
"""pelicanconf module.

Import settings from pelicanconf.py file.
Ignore flake8 errors/warnings in this line:
http://stackoverflow.com/a/10506715/5951529
“import pelicanconf” doesn't work:
http://stackoverflow.com/a/1084984/5951529
"""


# Absolute path, if site publish
# Don't use relative paths for publishing!

SITEURL = 'http://kristinita.ru'
RELATIVE_URLS = False

PLUGINS = [
    'deadlinks',
    'feed_summary',
    'interlinks',
    'optimize_images',
    'pagefixer',
    'pelican_javascript',
    'section_number',
    'sitemap',
]

# Following items are often useful when publishing

# DISQUS_SITENAME = ""
# GOOGLE_ANALYTICS = ""
