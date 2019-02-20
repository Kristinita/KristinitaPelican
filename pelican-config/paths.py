# ****************************************************************************
# *                                   Paths                                  *
# ****************************************************************************
"""paths settings."""

# Relative paths for development.
# [INFO] No page speed difference, absolute or relative path use:
# https://webmasters.stackexchange.com/a/96963/71131
SITEURL = '.'

# Non-modified files and folders
# [Hack] The register matters. 404.md & 404.html don't work.
STATIC_PATHS = ['']

# Move static files to root directory:
# https://docs.getpelican.com/en/latest/settings.html?highlight=EXTRA_PATH_METADATA
# http://docs.getpelican.com/en/latest/tips.html#copy-static-files-to-the-root-of-your-site
EXTRA_PATH_METADATA = {'extra/README.md': {'path': 'README.md'},
                       'extra/opensearch.xml': {'path': 'opensearch.xml'}}

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
