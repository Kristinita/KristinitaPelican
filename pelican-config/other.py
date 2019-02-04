# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2019-01-18 20:48:12
# @Last Modified time: 2019-02-01 20:50:27
# ****************************************************************************
# *                                   Other                                  *
# ****************************************************************************
"""date and other settings."""
from datetime import date

# [DEPRECATED] All warnings fixed:
# For disabling warnings:
# http://docs.getpelican.com/en/stable/settings.html#logging
# import logging

# Date format, that datetime HTML attribute will be correct:
# https://www.w3schools.com/tags/att_time_datetime.asp
# http://docs.getpelican.com/en/latest/settings.html?highlight=DEFAULT_DATE_FORMAT#time-and-date
# http://www.strfti.me/?f=%25Y-%25m-%25dT%25H%3A%25M%3A%25S%25z
# [WARNING] TZD format — “%z”, “%:z” not support in Python:
# https://stackoverflow.com/q/26081853/5951529
# [WARNING] datetime attribute doesn't support “isoformat()”:
# https://stackoverflow.com/a/37492671/5951529
DEFAULT_DATE_FORMAT = '%Y-%m-%dT%H:%M:%S%z'

# [FIXME] Why I need to change locale?
# https://docs.getpelican.com/en/4.0.1/settings.html?highlight=LOCALE
# https://stackoverflow.com/a/20827962/5951529
# https://lingoport.com/internationalization-of-facebook-open-graph-apps/
# [WARNING] Using country/region abbreviations instead of locale names:
# https://github.com/getpelican/pelican/issues/2525
# LOCALE = ('en_US', 'ru_RU', 'en-US', 'ru-RU')

# Insert current year to templates:
# https://bernhard.scheirle.de/posts/2016/February/29/how-to-keep-your-copyright-year-up-to-date-using-jinja-filters/
CURRENTYEAR = date.today().year

# Pagination — division of articles
DEFAULT_PAGINATION = False

# Typogrify library
# https://pypi.python.org/pypi/typogrify
# [BUG] False, because bug with br in a newline:
# https://github.com/mintchaos/typogrify/pull/39
# Also unexpected &nbsp; after last word in line.
TYPOGRIFY = False
