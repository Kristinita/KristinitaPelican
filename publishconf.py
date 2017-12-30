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


DELETE_OUTPUT_DIRECTORY = True

# Absolute path, if site publish
# Don't use relative paths for publishing!

SITEURL = 'http://kristinita.ru'
RELATIVE_URLS = False

PLUGINS = [
    # Temporary disable, when bugs not fixed
    # 'deadlinks',
    'just_table',
    'interlinks',
    'neighbors',
    'optimize_images',
    'pagefixer',
    'section_number',
    'sitemap',
]

# ****************************************************************************
# *                               Sharing                                    *
# ****************************************************************************

# Feed generation, perhaps, not desired when developing

FEED_DOMAIN = SITEURL

FEED_ALL_ATOM = 'feeds/all.atom.xml'
CATEGORY_FEED_ATOM = 'feeds/%s.atom.xml'
TRANSLATION_FEED_ATOM = 'feeds/all-%s.atom.xml'
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll
# LINKS = (('Pelican', 'http://getpelican.com/'),
#          ('Python.org', 'http://python.org/'),
#          ('Jinja2', 'http://jinja.pocoo.org/'),
#          ('You can edit those links in your config file', '#'),)

# Social widget
# SOCIAL = (('You can add links in your config file', '#'),
#           ('Another social link', '#'),)


# Following items are often useful when publishing

# DISQUS_SITENAME = ""
# GOOGLE_ANALYTICS = ""
