# -*- coding: utf-8 -*-
# @Author: Kristinita
# @Date: 2019-01-18 20:14:23
# @Last Modified time: 2019-02-07 15:59:57
# ****************************************************************************
# *                                 Markdown                                 *
# ****************************************************************************

# Include Markdown extensions
# http://docs.getpelican.com/en/stable/settings.html?highlight=MARKDOWN#basic-settings
# https://pythonhosted.org/Markdown/extensions/#third-party-extensions

"""python Markdown extensions.

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
        'pymdownx.snippets': {
            'base_path': 'content/Snippets'
        },
        # [LEARN] “text” pygmets lexer for Plain text format:
        # http://pygments.org/docs/lexers/#pygments.lexers.special.TextLexer
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
        # [DONE]
        # [-BUG-] Original repository doesn't support Markdown 3:
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
