# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2017-01-17 17:43:09
# @Last Modified time: 2017-12-28 09:32:30
"""Pelican configuration file.

For development. publishconf.py — for publishing.
"""
import sys
"""sys module.

For download plugins from “plugins” folder.
"""

# import logging
""" logging pelican module.

For disabling warnings:
http://docs.getpelican.com/en/stable/settings.html#logging
"""
# That Pelican see plugins from this folder

sys.path.append('plugins')

# ****************************************************************************
# *                                  General                                 *
# ****************************************************************************

AUTHOR = 'Саша Черных'
SITENAME = 'Поиск Кристиниты'
SITEURL = 'http://kristinita.ru'

TIMEZONE = 'Europe/Moscow'
DEFAULT_LANG = 'en'

# ****************************************************************************
# *                               Sharing                                    *
# ****************************************************************************

# Feed generation, perhaps, not desired when developing

FEED_DOMAIN = SITEURL

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

# Delete old site before building
# I don't get bugs, if true.
# If false, files, which I delete from content directory, not deleted from
# output directory.

DELETE_OUTPUT_DIRECTORY = False

# Do not touch in generation process

OUTPUT_RETENTION = [".git"]

# Load non-modified content from cache

LOAD_CONTENT_CACHE = True

# Relative URLs for developing

RELATIVE_URLS = True

# Original format without rendering. If true, md rendering to md,
# if false, md → html

OUTPUT_SOURCES = False

# GitHub path for this project

GITHUB_URL = 'https://github.com/Kristinita/KristinitaPelican'

# ****************************************************************************
# *                                  Plugins                                 *
# ****************************************************************************

PLUGIN_PATHS = ['pelican-plugins']
PLUGINS = [
    'feed_summary',
    'interlinks',
    'just_table',
    'pagefixer',
    # Disable, because:
    # 1. Plugin create duplicates of files
    # 2. Incorrect paths — http://bit.ly/2pZdyk0
    # 'pelican_javascript',
    'section_number',
]

# Deadlinks
# https://github.com/silentlamb/pelican-deadlinks/

DEADLINK_VALIDATION = True

DEADLINK_OPTS = {
    # Replace dead link to Internet Archive link
    'archive': True,
    'classes': ['SashaDeadlink'],
    # Disable «403» or «404» text after link in generated HTML
    'labels': False
}

# just_table
# Simple Pelican tables
# https://github.com/burakkose/just_table
# [Bug] Unwanted <p> tag — https://github.com/burakkose/just_table/issues/5
JTABLE_SEPARATOR = '|'


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
    'kristinita': 'http://kristinita.ru/#gsc.tab=0&gsc.q='
}

# Feed summary — short RSS feed by content «Summary» metadata tag
# https://github.com/getpelican/pelican-plugins/tree/master/feed_summary

FEED_USE_SUMMARY = True

# ****************************************************************************
# *                                 Markdown                                 *
# ****************************************************************************

# Include Markdown extensions
# http://docs.getpelican.com/en/stable/settings.html?highlight=MARKDOWN#basic-settings
# https://pythonhosted.org/Markdown/extensions/#third-party-extensions

"""Python Markdown extensions.

Extensions, which Sasha's fan use.

#
# 1. extra
#

Attribute List — add id and classes in Markdown
https://pythonhosted.org/Markdown/extensions/attr_list.html

Definition List — add dl, dd, dt tags
https://pythonhosted.org/Markdown/extensions/definition_lists.html
https://webref.ru/html/dd

Fenced code blocks — correct display multiline code blocks
https://pythonhosted.org/Markdown/extensions/fenced_code_blocks.html

Tables — simple tables
https://pythonhosted.org/Markdown/extensions/tables.html

#
# 2. Other default extensions
#

admonition — notes in Markdown
https://pythonhosted.org/Markdown/extensions/admonition.html

nl2br — new line without 2 br in line end
Like GitHub, not like Stack Overflow
https://pythonhosted.org/Markdown/extensions/nl2br.html

sane_lists — mix ordered/unordered list
https://pythonhosted.org/Markdown/extensions/sane_lists.html

#
# 3. facelessuser extensions
#

betterem — fix ** and __ symbols
http://facelessuser.github.io/pymdown-extensions/extensions/betterem/

caret — underline, if ^^ symbols
http://facelessuser.github.io/pymdown-extensions/extensions/caret/

critic — Critic Markup support
http://facelessuser.github.io/pymdown-extensions/extensions/critic/
http://criticmarkup.com/

escapeall — don't convert space symbols
http://facelessuser.github.io/pymdown-extensions/extensions/escapeall/
https://github.com/waylan/Python-Markdown/issues/564#issuecomment-299681538

inlinehilite — inline highlight code
http://facelessuser.github.io/pymdown-extensions/extensions/inlinehilite/
https://pythonhosted.org/Markdown/extensions/code_hilite.html#step-2-add-css-classes

magiclink — clickable Bare URL
http://facelessuser.github.io/pymdown-extensions/extensions/magiclink/

progressbar — candy Progress Bar
http://facelessuser.github.io/pymdown-extensions/extensions/progressbar/

smartsymbols — replace symbols to correct.
Example: (c) → ©
http://facelessuser.github.io/pymdown-extensions/extensions/smartsymbols/

snippets — insert HTML to another HTML
http://facelessuser.github.io/pymdown-extensions/extensions/snippets/

superfences — different block highlights.
http://facelessuser.github.io/pymdown-extensions/extensions/superfences/

tilde — ~~delete~~ and sub support
http://facelessuser.github.io/pymdown-extensions/extensions/tilde/

#
# 4. Other extensions
#

downheader — down headers to 1 item, that MD002 is good
https://github.com/cprieto/mdx_downheader

markdown_blockdiag — diagrams in Markdown
https://github.com/gisce/markdown-blockdiag
http://blockdiag.com/en/blockdiag/index.html

markdown_newtab — add target="_blank" for all links
Attribute don't add for local anchors
https://github.com/Undeterminant/markdown-newtab/blob/master/run_tests.py

md_environ — add own environment variables to text
https://github.com/cmacmackin/md-environ

mdx_cite — cite tag
https://github.com/aleray/mdx_cite

mdx_custom_span_class — custom !!classes!! for span tag
https://github.com/exaroth/mdx_custom_span_class

pyembed — embed videos/images from different popular sites
https://pyembed.github.io/usage/markdown/
"""

MARKDOWN = {
    'extension_configs': {
        'markdown.extensions.extra': {},
        'markdown.extensions.admonition': {},
        # [Bug] just_table conflict, just_table tables display incorrect
        # nl2br — extension, without which I can do
        # 'markdown.extensions.nl2br': {},
        'markdown.extensions.sane_lists': {},
        # [Bug] “section_number” disabling bug
        # https://github.com/waylan/Python-Markdown/issues/560
        # Now I use regex replacing in Gruntfile.coffee and don't need this
        # extension
        # 'markdown.extensions.toc': {'permalink': True},
        'pymdownx.inlinehilite': {'css_class': 'SashaInlineHighlight',
                                  'style_plain_text': True,
                                  # Deprecated in 3.0 version
                                  # 'use_codehilite_settings': False,
                                  },
        'pymdownx.betterem': {},
        'pymdownx.caret': {},
        'pymdownx.critic': {},
        'pymdownx.escapeall': {},
        'pymdownx.magiclink': {'hide_protocol': True, 'repo_url_shortener':
                               True},
        'pymdownx.mark': {},
        'pymdownx.progressbar': {},
        'pymdownx.snippets': {},
        'pymdownx.smartsymbols': {},
        # [FIXME] Spoils Rainbow.js code
        # 'pymdownx.superfences': {},
        'pymdownx.tilde': {},
        'mdx_cite': {},
        'pyembed.markdown': {},
        'mdx_custom_span_class': {},
        'downheader': {},
        'markdown_newtab': {},
        'md_environ.environ': {},
        'markdown_blockdiag': {},
    },
    'output_format': 'html5',
}

# ****************************************************************************
# *                                   Paths                                  *
# ****************************************************************************

# Path for site content

PATH = 'content'

# Path for pages
# Don't set “PAGE_PATHS = ['']”! See
# https://github.com/getpelican/pelican/issues/2123

ARTICLE_PATHS = ['Gingerinas', 'Giologica', 'Life-hacks',
                 'Smert-svobode', 'Sasha-Black', 'Sublime-Text']

# Path for articles
# [Hack] That exclude articles, include non-exicting folder.
# «ARTICLE_PATHS = None» — critical error, integer parameter

PAGE_PATHS = ['None']

# Non-modified files and folders
# [Hack] The register matters. 404.md & 404.html don't work.

STATIC_PATHS = ['']

# That filename = Slug, not necessary to write slug manually for each article

SLUGIFY_SOURCE = 'basename'

# Extra path metadata
# http://manos.im/blog/static-site-pelican-grunt-travis-github-pages/

ARTICLE_URL = '{slug}.html'
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

# Disable logging of empty alt attribute, needs “import logging” module
# Fix, but save as comment, that doesn't forgot if I will have a similar
# problem.

# LOG_FILTER = [(logging.WARN, 'Empty alt attribute for image %s in %s')]

# ****************************************************************************
# *                                 External                                 *
# ****************************************************************************

# Typogrify library
# https://pypi.python.org/pypi/typogrify
# False, because bug with br in a newline:
# https://github.com/mintchaos/typogrify/pull/39
# Also unexpected &nbsp; after last word in line.

TYPOGRIFY = False
