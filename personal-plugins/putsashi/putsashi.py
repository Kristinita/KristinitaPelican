# -*- coding: utf-8 -*-
# @Author: andreymal
# @Date:   2017-01-25 18:48:20
# @Last Modified by:   Kristinita
# @Last Modified time: 2019-03-15 11:56:34
"""Preserve paths for Pelican articles and pages.

Based on @andreymal answer:
https://ru.stackoverflow.com/a/619397/199934
"""

from itertools import chain
from pelican import signals


def fix_pages(generator):
    """fix_pages function.

    Correct path for pages.
    Example:
    Input page path: content/SashaFolder/SashaFile.md
    Output page path: output/SashaFolder/SashaFile.html

    Arguments:
        generator {pages} -- correct path for pages.
    """
    for page in chain(generator.translations, generator.pages,
                      generator.hidden_translations, generator.hidden_pages):
        # Получаем путь исходника относительно каталога content
        source_path = page.get_relative_source_path()
        # Заменяем расширение на html
        new_path = source_path.rsplit(".", 1)[0] + ".html"
        # И пихаем в страницу вместо родных путей относительно output
        page.override_url = new_path
        page.override_save_as = new_path


def fix_articles(generator):
    """fix_articles function.

    Same as fix_pages, for articles

    Arguments:
        generator {articles} -- correct path for articles.
    """
    for article in chain(generator.translations, generator.articles):
        source_path = article.get_relative_source_path()
        article_path = source_path.rsplit(".", 1)[0] + ".html"
        article.override_url = article_path
        article.override_save_as = article_path


def register():
    """Register function.

    Register Pelican plugin.
    """
    signals.page_generator_finalized.connect(fix_pages)
    signals.article_generator_finalized.connect(fix_articles)
