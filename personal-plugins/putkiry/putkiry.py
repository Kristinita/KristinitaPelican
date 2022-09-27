# @Author: andreymal
# @Date:   2017-01-25 18:48:20
# @Last Modified by:   Kristinita
# @Last Modified time: 2022-08-19 17:15:55
"""Preserve paths for Pelican articles and pages.

Based on @andreymal answer:
https://ru.stackoverflow.com/a/619397/199934

Example:
    Input page path: content/SashaFolder/SashaFile.md
    Output page path: output/SashaFolder/SashaFile.html

"""
import itertools

from pelican import signals
from pelican.generators import ArticlesGenerator
from pelican.generators import PagesGenerator


def putkiry(instance):
    """Putkiry function.

    Overwrite articles and pages paths in output.
    """
    # [INFO] Get relative (regarding the “content” folder) path:
    source_path = instance.get_relative_source_path()
    # [INFO] Change extension to “.html”:
    instance_path = source_path.rsplit(".", 1)[0] + ".html"
    # [INFO] Overwrite paths:
    # https://github.com/getpelican/pelican/blob/e8c7756875c982085f745ce4deff0fb5b4ea2a2a/pelican/contents.py#L613
    instance.override_save_as = instance_path
    # [INFO][PELICAN] Overwrite “article.url” and “page.url” settings:
    instance.override_url = instance_path


def run_plugin(generators):
    """Run plugin for different objects.

    Inspired from existing pelican plugins:
    https://github.com/getpelican/pelican-plugins/blob/0b9e66ee7b0a3609c1d94e5aeb90144993a1603e/summary/summary.py
    https://github.com/coyote240/exifiscerate/blob/29519310f10f1e9bd900a11922c256d78fc41173/exifiscerate/exifiscerate.py
    https://github.com/dtzWill/wdtz/blob/85c92b0e3bfa1f8004ce23fe0376bec054a0ee46/plugins/plugin_pipeline/plugin_pipeline.py
    """
    for generator in generators:
        if isinstance(generator, ArticlesGenerator):
            # [INFO][PELICAN] All articles types:
            # https://github.com/getpelican/pelican/blob/2cafe926fa854b5b8c84b944d77b628574a2ec61/pelican/generators.py#L283-L296
            # [LEARN][PYTHON] itertools.chain:
            # https://stackoverflow.com/a/37683485/5951529
            for article in itertools.chain(
                    generator.articles, generator.translations, generator.hidden_articles,
                    generator.hidden_translations, generator.drafts, generator.drafts_translations):
                putkiry(article)
        elif isinstance(generator, PagesGenerator):
            # [INFO][PELICAN] All pages types:
            # https://github.com/getpelican/pelican/blob/2cafe926fa854b5b8c84b944d77b628574a2ec61/pelican/generators.py#L717-L726
            # [NOTE] generator.all_pages doesn’t work
            for page in itertools.chain(
                    generator.pages, generator.translations, generator.hidden_pages,
                    generator.hidden_translations, generator.draft_pages, generator.draft_translations):
                putkiry(page)


def register():
    """Register function.

    Register Pelican plugin.
    """
    # [INFO] List of signals:
    # https://github.com/getpelican/pelican/blob/e9b6174157ed85687823b5301613d7f9f442754b/docs/plugins.rst#list-of-signals:
    # “all_generators_finalized” — invoked after all generators executed and before writing output
    signals.all_generators_finalized.connect(run_plugin)
