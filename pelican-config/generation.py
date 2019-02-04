# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2019-01-18 20:46:53
# @Last Modified time: 2019-02-02 16:22:02
# ****************************************************************************
# *                                Generation                                *
# ****************************************************************************
"""site generation settings."""

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

# [INFO] List of Metadata fileds, that will be parset from Markdown on reST to HTML:
# https://docs.getpelican.com/en/latest/settings.html?highlight=formatted_fields#basic-settings
FORMATTED_FIELDS = ['summary', 'epigraphtext']

# [INFO] Folder name = category name:
# https://docs.getpelican.com/en/latest/settings.html#basic-settings
USE_FOLDER_AS_CATEGORY = True
