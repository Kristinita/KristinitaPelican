# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2017-01-17 17:43:09
# @Last Modified time: 2019-01-10 08:31:39
"""Pelican configuration file.

For development. publishconf.py — for publishing.
"""
from datetime import date

# Parse YAML configuration file:
# https://stackoverflow.com/q/41974628/5951529
# Require PyYAML module:
# http://pyyaml.org/wiki/PyYAML
import yaml

# Insert current year to templates:
# https://bernhard.scheirle.de/posts/2016/February/29/how-to-keep-your-copyright-year-up-to-date-using-jinja-filters/
CURRENTYEAR = date.today().year

# [DEPRECATED] All warnings fixed:
# For disabling warnings:
# http://docs.getpelican.com/en/stable/settings.html#logging
# import logging

# ****************************************************************************
# *                                  General                                 *
# ****************************************************************************

# Relative paths for development.
SITEURL = '.'

# Configuration from YAML files.
# [BUG] Needs add encoding for AppVeyor:
# https://stackoverflow.com/a/16347110/5951529
# https://github.com/appveyor/ci/issues/2129
# https://ci.appveyor.com/project/Kristinita/kristinitapelican/build/job/jhtr2opsnckg214g
YAMLCONFIG = yaml.load(open('pelicanvariables.yaml', encoding='utf-8'))

PATH = YAMLCONFIG['path']
OUTPUT_PATH = YAMLCONFIG['output_path']
THEME = YAMLCONFIG['theme']
THEME_STATIC_DIR = YAMLCONFIG['theme_static_dir']
THEME_STATIC_PATHS = YAMLCONFIG['theme_static_paths']
PLUGIN_PATHS = YAMLCONFIG['plugin_paths']

AUTHOR = YAMLCONFIG['author']
SITENAME = YAMLCONFIG['sitename']
TIMEZONE = YAMLCONFIG['timezone']
DEFAULT_LANG = YAMLCONFIG['default_lang']
CACHE_PATH = YAMLCONFIG['cache_path']

# Path for pages
# [Hack] That exclude articles, include non-exicting folder.
# «ARTICLE_PATHS = None» — critical error, integer parameter
PAGE_PATHS = YAMLCONFIG['page_paths']
# Path for articles
# Don't set “PAGE_PATHS = ['']”! See
# https://github.com/getpelican/pelican/issues/2123
ARTICLE_PATHS = YAMLCONFIG['article_paths']

GITHUB_SOURCES_URL = YAMLCONFIG['github_sources_url']
GITHUB_OUTPUT_URL = YAMLCONFIG['github_output_url']

# ****************************************************************************
# *                                Generation                                *
# ****************************************************************************

# Date format, that datetime HTML attribute will be correct:
# https://www.w3schools.com/tags/att_time_datetime.asp
# http://docs.getpelican.com/en/latest/settings.html?highlight=DEFAULT_DATE_FORMAT#time-and-date
# http://www.strfti.me/?f=%25Y-%25m-%25dT%25H%3A%25M%3A%25S%25z
# [WARNING] TZD format — “%z”, “%:z” not support in Python:
# https://stackoverflow.com/q/26081853/5951529
# [WARNING] datetime attribute doesn't support “isoformat()”:
# https://stackoverflow.com/a/37492671/5951529
DEFAULT_DATE_FORMAT = '%Y-%m-%dT%H:%M:%S%z'

# Delete old site before building
# I don't get bugs, if true.
# If false, files, which I delete from content directory, not deleted from
# output directory.
DELETE_OUTPUT_DIRECTORY = False

# Do not touch in generation process
OUTPUT_RETENTION = [
    '.git',
    # Doesn't remove folder with screenshots
    'screenshots'
]

# Cache settings
# http://docs.getpelican.com/en/latest/settings.html?highlight=cache
# [NOTE] If experiments with Pelican settings, use --ignore-cache option
# http://docs.getpelican.com/en/latest/settings.html#settings
CACHE_CONTENT = True
GZIP_CACHE = True
# [NOTE] WITH_FUTURE_DATES conflict with CONTENT_CACHING_LAYER
# http://docs.getpelican.com/en/latest/settings.html#reading-only-modified-content
CONTENT_CACHING_LAYER = 'reader'
LOAD_CONTENT_CACHE = True

# Relative URLs for developing
RELATIVE_URLS = True

# Original format without rendering. If true, md rendering to md,
# if false, md → html
OUTPUT_SOURCES = False

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


# ****************************************************************************
# *                                 Markdown                                 *
# ****************************************************************************

# Include Markdown extensions
# http://docs.getpelican.com/en/stable/settings.html?highlight=MARKDOWN#basic-settings
# https://pythonhosted.org/Markdown/extensions/#third-party-extensions

"""Python Markdown extensions.

http://romeogolf.github.io/pelican-i-modul-python-markdown.html
Extensions, which Sasha's fan use.

CLI usage: https://python-markdown.github.io/cli/#using-extensions
Example: “python -m markdown -x pymdownx.superfences -c config.yml SashaSuperFences.md”

Officially support extensions doesn't need extra installation:
https://python-markdown.github.io/extensions/#officially-supported-extensions

#
# 1. extra
#

Attribute List — add id and classes in Markdown
https://python-markdown.github.io/extensions/extra/

Definition List — add dl, dd, dt tags
https://python-markdown.github.io/extensions/definition_lists/
https://webref.ru/html/dd

Fenced code blocks — correct display multiline code blocks
https://python-markdown.github.io/extensions/fenced_code_blocks/

Tables — simple tables
https://python-markdown.github.io/extensions/tables/

#
# 2. Other default extensions
#

admonition — notes in Markdown
https://python-markdown.github.io/extensions/admonition/

nl2br — new line without 2 br in line end
Like GitHub, not like Stack Overflow
https://python-markdown.github.io/extensions/nl2br/

sane_lists — mix ordered/unordered list
https://python-markdown.github.io/extensions/sane_lists/

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

escapeall — don't convert spaces, octotorps and another symbols
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
http://pygments.org/docs/lexers/

tilde — ~~delete~~ and sub support
http://facelessuser.github.io/pymdown-extensions/extensions/tilde/

#
# 4. Other extensions
#

https://github.com/Python-Markdown/markdown/wiki/Third-Party-Extensions

downheader — down headers to 1 item, that MD002 is good
https://github.com/cprieto/mdx_downheader

markdown_blockdiag — diagrams in Markdown
https://github.com/gisce/markdown-blockdiag
http://blockdiag.com/en/blockdiag/index.html

markdown_newtab — add target='_blank' for all links
Attribute don't add for local anchors
https://github.com/Undeterminant/markdown-newtab

md_environ — add own environment variables to text
https://github.com/cmacmackin/md-environ

mdx_cite — cite tag
https://github.com/aleray/mdx_cite

mdx_custom_span_class — custom !!classes!! for span tag
https://github.com/exaroth/mdx_custom_span_class

mdx_video — embed YouTube videos
https://github.com/getpelican/pelican/issues/1099#issuecomment-25209351
https://github.com/italomaia/mdx-video

pyembed — embed videos/images from different popular sites
https://pyembed.github.io/usage/markdown/
"""

MARKDOWN = {
    'extension_configs': {
        #
        # 1. extra
        #
        'markdown.extensions.extra': {},
        #
        # 2. Other default extensions
        #
        'markdown.extensions.admonition': {},
        # [DEPRECATED] just_table conflict, just_table tables display incorrect.
        # nl2br — extension, without which I can work.
        # 'markdown.extensions.nl2br': {},
        'markdown.extensions.sane_lists': {},
        # [DEPRECATED] “section_number” disabling bug:
        # https://github.com/waylan/Python-Markdown/issues/560
        # Now I use regex replacing in Gruntfile.coffee and don't need this extension:
        # 'markdown.extensions.toc': {'permalink': True},
        #
        # 3. facelessuser extensions
        #
        'pymdownx.betterem': {},
        'pymdownx.caret': {},
        'pymdownx.critic': {},
        'pymdownx.escapeall': {},
        'pymdownx.highlight': {},
        'pymdownx.inlinehilite': {
            # [DEPRECATED] 'use_codehilite_settings' in 3.0 pymdown-extensions version
            'css_class': 'SashaInlineHighlight',
            'style_plain_text': True
        },
        'pymdownx.magiclink': {
            'hide_protocol': True,
            'repo_url_shortener': True
        },
        'pymdownx.mark': {},
        # That bars change colors in each 10%:
        # https://github.com/facelessuser/pymdown-extensions/pull/208
        'pymdownx.progressbar': {
            'level_class': True,
            'progress_increment': 10
        },
        'pymdownx.smartsymbols': {},
        'pymdownx.snippets': {},
        'pymdownx.superfences': {
            'css_class': 'SashaBlockHighlight',
            # Doesn't convert tabs to spaces in code blocks:
            # https://github.com/marionebl/commitlint/issues/316
            'preserve_tabs': True
        },
        'pymdownx.tilde': {},
        #
        # 4. Other extensions
        #
        'markdown_blockdiag': {},
        # [BUG] Deleted by author, replaced to JQuery solution:
        # http://bit.ly/2SjqOLq
        # 'markdown_newtab': {},
        'md_environ.environ': {},
        # [BUG] Unneeded “configs” for Markdown 3:
        # https://github.com/aleray/mdx_cite/pull/2
        # 'mdx_cite': {},
        'mdx_custom_span_class': {},
        # [BUG] Original repository dosen't support Markdown 3:
        # Tempopary use fork:
        # https://github.com/cprieto/mdx_downheader/pull/6
        # https://github.com/linevych/mdx_downheader/tree/markdown3_support
        # https://github.com/pypa/pipenv/pull/2702/files
        # I create my own fork, that plugin doesn't update from original repository:
        # https://github.com/Kristinita/mdx_downheader/blob/KiraPatch/setup.py
        'mdx_downheader': {},
        # [NOTE] Desable, because obsolete attributes “allowfullscreen” and “frameborder”:
        # https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#Attributes
        # 'mdx_video': {},
        'pyembed.markdown': {}
    },
    'output_format': 'html5',
}

# ****************************************************************************
# *                                   Paths                                  *
# ****************************************************************************

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
# *                               Sharing                                    *
# ****************************************************************************

# Disable feed generation in developing process
# http://docs.getpelican.com/en/latest/faq.html#what-if-i-want-to-disable-feed-generation
# [BUG] I get in console: “TypeError: not all arguments converted during string formatting”

# FEED_ALL_ATOM = None
# CATEGORY_FEED_ATOM = None
# TRANSLATION_FEED_ATOM = None
# AUTHOR_FEED_ATOM = None
# AUTHOR_FEED_RSS = None

# ****************************************************************************
# *                                   Other                                  *
# ****************************************************************************

# Pagination — division of articles
DEFAULT_PAGINATION = False

# Disable logging of empty alt attribute, needs “import logging” module
# Fix, but save as comment, that doesn't forgot if I will have a similar problem.
# LOG_FILTER = [(logging.WARN, 'Empty alt attribute for image %s in %s')]

# FORMATTED_FIELDS = ['summary']

# ****************************************************************************
# *                                 External                                 *
# ****************************************************************************

# Typogrify library
# https://pypi.python.org/pypi/typogrify
# False, because bug with br in a newline:
# https://github.com/mintchaos/typogrify/pull/39
# Also unexpected &nbsp; after last word in line.
TYPOGRIFY = False
