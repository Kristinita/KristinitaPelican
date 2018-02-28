# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2017-01-17 17:43:09
# @Last Modified time: 2018-02-27 18:35:50

import sys

# Doesn't need “os” module
# https://github.com/getpelican/pelican-blog/blob/master/publishconf.py
sys.path.append('.')

"""pelicanconf module.

Import settings from pelicanconf.py file.
Ignore flake8 errors/warnings in this line:
http://stackoverflow.com/a/10506715/5951529
“import pelicanconf” doesn't work:
http://stackoverflow.com/a/1084984/5951529
“noqa”, not “NOQA” works for Anaconda:
https://stackoverflow.com/a/46759770/5951529
"""
from pelicanconf import *  # noqa

DELETE_OUTPUT_DIRECTORY = True

# Absolute path, if site publish
# Don't use relative paths for publishing!

SITEURL = 'https://kristinita.ru'
RELATIVE_URLS = False

PLUGINS = [
    # Temporary disable, when bugs not fixed
    # 'deadlinks',
    'just_table',
    'interlinks',
    'neighbors',
    'putsashi',
    'section_number',
    'sitemap',
]

# ****************************************************************************
# *                               Cache                                   *
# ****************************************************************************

CACHE_CONTENT = False
LOAD_CONTENT_CACHE = False

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

# Feed summary — short RSS feed by content «Summary» metadata tag
# https://github.com/getpelican/pelican-plugins/tree/master/feed_summary
# [Deprecated] — https://github.com/getpelican/pelican-plugins/tree/master/feed_summary

FEED_USE_SUMMARY = True


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
