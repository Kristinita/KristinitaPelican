#!/usr/bin/env python
# -*- coding: utf-8 -*- #

from __future__ import unicode_literals

import logging
""" logging pelican module.

For disabling warnings:
http://docs.getpelican.com/en/stable/settings.html#logging
"""
import sys

# ****************************************************************************
# *                                  General                                 *
# ****************************************************************************

# Для того чтобы Pelican видел плагины из этой папки
sys.path.append('plugins')

AUTHOR = 'Саша Черных'
SITENAME = 'Поиск Кристиниты'
SITEURL = 'http://kristinita.ru'

TIMEZONE = 'Europe/Moscow'
DEFAULT_LANG = 'en'

# ****************************************************************************
# *                                   Feed                                   *
# ****************************************************************************

# Feed generation, perhaps, not desired when developing
FEED_ALL_ATOM = 'feeds/all.atom.xml'
CATEGORY_FEED_ATOM = 'feeds/%s.atom.xml'
TRANSLATION_FEED_ATOM = None
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

# ****************************************************************************
# *                                Generation                                *
# ****************************************************************************

# Перед генерацией стираем старый вариант сайта (кроме информации о
# репозитории)
DELETE_OUTPUT_DIRECTORY = True
# Do not touch in generation process
OUTPUT_RETENTION = [".git"]

LOAD_CONTENT_CACHE = False

# Uncomment following line if you want document-relative URLs when developing
RELATIVE_URLS = True

# Original format without rendering. If true, md rendering to md,
# not md → html
OUTPUT_SOURCES = False

# ****************************************************************************
# *                                  Plugins                                 *
# ****************************************************************************

PLUGIN_PATHS = ['pelican-plugins']
PLUGINS = ['pagefixer', 'pelican_javascript', 'sitemap']

# SITEMAP, see
# https://github.com/getpelican/pelican-plugins/tree/master/sitemap
SITEMAP = {
    'format': 'xml',
    'priorities': {
        'articles': 0,
        'indexes': 0.5,
        'pages': 1
    },
    'changefreqs': {
        'articles': 'never',
        'indexes': 'weekly',
        'pages': 'always'
    }
}

# ****************************************************************************
# *                                   Paths                                  *
# ****************************************************************************

# Путь, где пишется контент сайта
PATH = 'content'


# Путь к pages
# Don't set “PAGE_PATHS = ['']”! See
# https://github.com/getpelican/pelican/issues/2123
PAGE_PATHS = ['Gingerinas', 'Giologica', 'Life-hacks', 'Sasha-Black',
              'Smert-svobode', 'Sublime-Text']
# Путь к articles
# [Хак] Чтобы исключить articles, подставил несуществующую папку.
# «ARTICLE_PATHS = None» — critical error, integer parameter
ARTICLE_PATHS = ['None']
# Не модифицируемые папки и файлы
# [Хак] Почему-то регистр имеет значение. 404.md и 404.html уже не работает.
STATIC_PATHS = ['']
# Чтобы имя файла было = Slug и не нужно было бы каждый раз вписывать slug
# вручную
SLUGIFY_SOURCE = 'basename'
# Extra path metadata, see
# http://manos.im/blog/static-site-pelican-grunt-travis-github-pages/
EXTRA_PATH_METADATA = {
    'extra/robots.txt': {'path': 'robots.txt'},
    'extra/CNAME': {'path': 'CNAME'},
    'extra/verifyforzoho.HTML': {'path': 'zohoverify/verifyforzoho.html'},
    'favicons/favicon.ico': {'path': 'favicon.ico'},
}

PAGE_URL = '{slug}.html'
PAGE_SAVE_AS = PAGE_URL
CATEGORY_URL = 'category/{slug}.html'
CATEGORY_SAVE_AS = CATEGORY_URL
TAG_URL = 'tag/{slug}.html'
TAG_SAVE_AS = TAG_URL
TAGS_SAVE_AS = 'tag/alltags.html'

# ****************************************************************************
# *                                   Other                                  *
# ****************************************************************************

# Theme
THEME = 'themes/sashapelican'

# Pagination — division of articles
DEFAULT_PAGINATION = False

TYPOGRIFY = True

# Disable logging of empty alt attribute, needs “import logging” module
LOG_FILTER = [(logging.WARN, 'Empty alt attribute for image %s in %s')]
