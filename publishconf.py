# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2017-01-17 17:43:09
# @Last Modified time: 2019-02-04 14:28:10
"""Pelican configuration file.

For publishing. pelicanconf.py — for development.
"""
# [WARNING] Close all files from “output” folder in all programs,
# that “pelican -s publishconfig.py” run without warnings and errors.

import sys

# Doesn't need “os” module
# https://github.com/getpelican/pelican-blog/blob/master/publishconf.py
sys.path.append(".")

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
SITEURL = YAMLCONFIG["siteurl"]
RELATIVE_URLS = False

PLUGINS = [
    # Temporary disable, when bugs not fixed
    # 'deadlinks',
    "filetime_from_git",
    "just_table",
    "interlinks",
    "open_graph",
    "neighbors",
    "putsashi",
    "section_number",
    "sitemap",
]

# ****************************************************************************
# *                               Cache                                   *
# ****************************************************************************

CACHE_CONTENT = False
LOAD_CONTENT_CACHE = False

# ****************************************************************************
# *                               Sharing                                    *
# ****************************************************************************

# Feed generation works for absolute domains:
# http://docs.getpelican.com/en/latest/faq.html#i-m-getting-a-warning-about-feeds-generated-without-siteurl-being-set-properly
# Disable feed generation in developing process
# http://docs.getpelican.com/en/latest/faq.html#what-if-i-want-to-disable-feed-generation
# [BUG] I get in console: “TypeError: not all arguments converted during string formatting”

# Feed generation, perhaps, not desired when developing
FEED_DOMAIN = SITEURL

# [NOTE] Atom is obsolete technology, it doesn't support in Firefox 64:
# https://www.theregister.co.uk/2018/10/13/mozilla_firefox_kills_rss/
# Use addons, for example:
# https://addons.mozilla.org/ru/firefox/addon/feed-preview
FEED_ALL_ATOM = "feeds/all.atom.xml"
# [NOTE] %s usage in CATEGORY_FEED_ATOM is deprecated, use {slug} instead:
# https://github.com/getpelican/pelican/blob/master/docs/changelog.rst#401-2018-11-30
CATEGORY_FEED_ATOM = "feeds/{slug}.atom.xml"
# [NOTE] %s usage in TRANSLATION_FEED_ATOM is deprecated, use {lang} instead:
# https://github.com/getpelican/pelican/blob/master/docs/changelog.rst#401-2018-11-30
TRANSLATION_FEED_ATOM = "feeds/all-{lang}.atom.xml"
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

# DISQUS_SITENAME = ''
# GOOGLE_ANALYTICS = ''
