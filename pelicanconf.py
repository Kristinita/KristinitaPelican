# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2017-01-17 17:43:09
# @Last Modified time: 2022-09-12 07:44:04
"""Pelican configuration file.

For development. publishconf.py — for publishing.
"""
import sys

from datetime import date

# [INFO] Enable import from current working directory.
#
# [NOTE] Doesn't need “os” module:
# https://github.com/getpelican/pelican-blog/blob/master/publishconf.py
#
# [WARNING] I can't find better solution for it:
# https://stackoverflow.com/a/28154841/5951529
sys.path.append(".")


# [INFO] Import from a directory above.
# In my case, I import functions from a “jinja_filters” folder:
# https://stackoverflow.com/a/11096846/5951529
sys.path.append("..")

# [LEARN][PYTHON] Use IPython %load and %whos, that view variables of current file:
# https://ipython.readthedocs.io/en/stable/interactive/magics.html#built-in-magic-commands
# https://ipython.readthedocs.io/en/stable/interactive/magics.html#magic-loadpy
# https://stackoverflow.com/a/21034906/5951529
# https://stackoverflow.com/a/634581/5951529


# [INFO] Disable flake8 errors:
# https://stackoverflow.com/a/38338146/5951529
#
# [NOTE] “noqa”, not “NOQA” works for Anaconda:
# https://stackoverflow.com/a/46759770/5951529
#
# [INFO] Disable pylint errors:
# https://stackoverflow.com/a/48836605/5951529

# pylint: disable=wrong-import-position

from pelican_settings_loader import DEV_SETTINGS  # noqa: E402
from pelican_settings_loader import kira_load_settings  # noqa: E402

from jinja_filters.jinja_filter_all import jinja_filter_all
from jinja_filters.jinja_filter_any import jinja_filter_any

# pylint: enable=wrong-import-position

# [INFO] Insert current year to templates:
# https://bernhard.scheirle.de/posts/2016/February/29/how-to-keep-your-copyright-year-up-to-date-using-jinja-filters/
CURRENTYEAR = date.today().year


"""
[INFO] Adding custom Jinja filters to Pelican:
https://docs.getpelican.com/en/latest/settings.html?highlight=jinja_filters#basic-settings
https://web.archive.org/web/20210726001021/https://linkpeek.com/blog/how-to-add-a-custom-jinja-filter-to-pelican.html

[INFO] Jinja filter can also be added as a Pelican plugin:
https://undefinedvalue.com/adding-a-jinja2-filter-with-a-pelican-plugin.html

[NOTE] “JINJA_FILTERS” variable works solely in Python files, not in YAML

[FIXME][ISSUE] Add “all()” and “any()” filters to the Jinja Filters plugin:
https://github.com/pelican-plugins/jinja-filters
"""
JINJA_FILTERS = {
    'all': jinja_filter_all,
    'any': jinja_filter_any
}


# [INFO] Convert Python dictionary to variables.
# [NOTE] “locals()” and “globals” is a bad idea:
# https://stackoverflow.com/a/36059129/5951529
globals().update(kira_load_settings(DEV_SETTINGS))
