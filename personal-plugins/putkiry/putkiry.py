# @Author: andreymal
# @Date:   2017-01-25 18:48:20
# @Last Modified by:   Kristinita
# @Last Modified time: 2019-06-16 16:37:08
"""Preserve paths for Pelican articles and pages.

Based on @andreymal answer:
https://ru.stackoverflow.com/a/619397/199934
Example:
    Input page path: content/SashaFolder/SashaFile.md
    Output page path: output/SashaFolder/SashaFile.html

"""

from pelican import signals
from pelican.generators import ArticlesGenerator
from pelican.generators import PagesGenerator


def putkiry(instance):
    """fix_articles function.

    Same as fix_pages, for articles

    Arguments:
        generator {articles} -- correct path for articles.
    """
    # Get relative (regarding the “content” folder) path:
    source_path = instance.get_relative_source_path()
    # Change extension to “.html”:
    instance_path = source_path.rsplit(".", 1)[0] + ".html"
    # Overwrite paths:
    # https://github.com/getpelican/pelican/blob/e8c7756875c982085f745ce4deff0fb5b4ea2a2a/pelican/contents.py#L613
    instance.override_save_as = instance_path
    # [INFO][PELICAN] Overwrite “article.url” and “page.url” settings:
    instance.override_url = instance_path


def run_plugin(generators):
    """Run plugin for different objects.

    Built by type summary.py pelican plugin:
    https://github.com/getpelican/pelican-plugins/blob/0b9e66ee7b0a3609c1d94e5aeb90144993a1603e/summary/summary.py#L94
    """
    for generator in generators:
        if isinstance(generator, ArticlesGenerator):
            # [INFO][PELICAN] All articles types:
            # https://github.com/getpelican/pelican/blob/8a769811377e2a3a32ba27b0a98e08f4102a0b43/pelican/generators.py#L289-L297
            for article in (generator.articles + generator.translations +
                            generator.drafts + generator.drafts_translations):
                putkiry(article)
        elif isinstance(generator, PagesGenerator):
            # [INFO][PELICAN] All pages types:
            # https://github.com/getpelican/pelican/blob/8a769811377e2a3a32ba27b0a98e08f4102a0b43/pelican/generators.py#L705-L710
            # [NOTE] generator.all_pages doesn't work
            for page in (generator.pages + generator.translations +
                         generator.hidden_pages + generator.hidden_translations +
                         generator.draft_pages + generator.draft_translations):
                putkiry(page)


def register():
    """Register function.

    Register Pelican plugin.
    """
    # [INFO] List of signals:
    # https://github.com/getpelican/pelican/blob/e9b6174157ed85687823b5301613d7f9f442754b/docs/plugins.rst#list-of-signals:
    # “all_generators_finalized” — invoked after all generators executed and before writing output
    signals.all_generators_finalized.connect(run_plugin)
