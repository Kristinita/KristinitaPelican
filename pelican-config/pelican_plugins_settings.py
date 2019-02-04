# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2019-01-18 20:28:46
# @Last Modified time: 2019-02-04 14:27:46
# ****************************************************************************
# *                                  Plugins                                 *
# ****************************************************************************
"""Plugins for Pelican.

https://github.com/getpelican/pelican-plugins

filetime_from_git — add “date” and “modified” varables from Git:
If plugin exist: you don't need add “Date:” and “Modified:” variables for
your each article:
https://github.com/getpelican/pelican-plugins/tree/master/filetime_from_git

liquid_tags — add videos/images by code;
for Instagram images, without another frames data;
https://github.com/getpelican/pelican-plugins/tree/master/liquid_tags

"""

# [BUG] Automatic plugins installation doesn't work for me:
# https://github.com/kplaube/pelican-plugin-installer/issues/6
PLUGINS = [
    # [DEPRECATED], now by default
    # https://github.com/getpelican/pelican-plugins/tree/master/feed_summary
    # 'feed_summary',
    'filetime_from_git',
    'interlinks',
    # [WARNING] Doesn't work with “article” or “page” templates:
    # https://github.com/getpelican/pelican-plugins/issues/983
    # 'jinja2content',
    'just_table',
    'liquid_tags.gram',
    # [BUG] Template doesn't work
    # 'loadcsv',
    'neighbors',
    # Open_graph:
    # Add open_graph to HTML:
    # https://github.com/whiskyechobravo/pelican-open_graph
    'open_graph',
    # [FIXME] Different colors for different designs
    # 'pelican-linkclass',
    # [DONE]
    # # [BUG] “TypeError: Unicode-objects must be encoded before hashing”:
    # # https://github.com/getpelican/pelican-plugins/issues/1011
    # [DEPRECATED] Anchors not support, but all my internal links with anchors:
    # https://github.com/getpelican/pelican-plugins/issues/1025
    # 'permalinks',
    # 'photos',
    # Disable, because:
    # 1. Plugin create duplicates of files
    # 2. Incorrect paths — http://bit.ly/2pZdyk0
    # 'pelican_javascript',
    'putsashi',
    # [BUG] Incorrect Cyrillic URL's:
    # https://github.com/getpelican/pelican-plugins/issues/1010
    # 'random_article',
    'section_number',
]

# PHOTO_LIBRARY = 'pictures'

# PHOTO_THUMB = (192, 144, 60)

# Deadlinks
# https://github.com/silentlamb/pelican-deadlinks/
DEADLINK_VALIDATION = True

DEADLINK_OPTS = {
    # Replace dead link to Internet Archive link
    'archive': True,
    'classes': ['SashaDeadlink'],
    # Disable «403» or «404» text after link in generated HTML
    'labels': False,
}

# just_table
# Simple Pelican tables
# https://github.com/burakkose/just_table
# [BUG] Unwanted <p> tag — https://github.com/burakkose/just_table/issues/5
JTABLE_SEPARATOR = '|'

# filetime_from_git
# https://github.com/getpelican/pelican-plugins/tree/master/filetime_from_git#other-options
GIT_HISTORY_FOLLOWS_RENAME = True
# GIT_GENERATE_PERMALINK = True
GIT_SHA_METADATA = True
GIT_FILETIME_FROM_GIT = True

RANDOM = 'random.html'

# Sitemap
# https://github.com/getpelican/pelican-plugins/tree/master/sitemap
SITEMAP = {
    'format': 'xml',
    'priorities': {
        'articles': 1,
        'indexes': 0.5,
        'pages': 0.5
    },
    'changefreqs': {
        'articles': 'always',
        'indexes': 'weekly',
        'pages': 'always'
    }
}

# Section number
# https://github.com/getpelican/pelican-plugins/tree/master/section_number
SECTION_NUMBER_MAX = 5

# Interlinks for generate links for frequently used sites
# https://github.com/getpelican/pelican-plugins/tree/master/interlinks
INTERLINKS = {
    'kristinita': 'https://kristinita.ru/#gsc.tab=0&gsc.q='
}
