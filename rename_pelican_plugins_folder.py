"""Rename Pelican plugins folders.

Rename folders of Pelican plugins, that will be possible use them:
https://github.com/buildinspace/peru/issues/205
"""
import os
import ruamel.yaml as yaml
YAMLCONFIG = yaml.safe_load(open('site_variables.yaml', encoding='utf-8'))
# [INFO] Get third-party plugins folder:
THIRD_PARTY_PLUGINS = YAMLCONFIG["PLUGIN_PATHS"][0]
# [INFO] Rename folder:
# http://hplgit.github.io/edu/ostasks/._ostasks002.html
# Build failed, if folder already renamed.
os.rename(
    THIRD_PARTY_PLUGINS +
    "/pelican-open_graph",
    THIRD_PARTY_PLUGINS +
    "/open_graph")
