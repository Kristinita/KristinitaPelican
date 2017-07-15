#!/usr/bin/ruby
# @Author: Kristinita
# @Date:   2017-03-26 12:56:49
# @Last Modified by:   Kristinita
# @Last Modified time: 2017-05-10 09:55:22
## Markdownlint configuration
## 【rules】https://github.com/mivok/markdownlint/blob/master/docs/RULES.md
## 【style file】https://github.com/mivok/markdownlint/blob/master/docs/configuration.md
## 【style syntax】 https://github.com/mivok/markdownlint/blob/master/docs/creating_styles.md

all

# Lint if more than 3 trailing spaces
rule 'MD009', :br_spaces => 3

# In my Pelican articles I use h1 tag in page templates
# I begin section use h2 tag
# Using h1 tag is good — http://archive.li/X3d8c
# Enable, because downheader extension
# https://github.com/cprieto/mdx_downheader
# exclude_rule 'MD0102'
# I use tabs instead of spaces
exclude_rule 'MD010'
# Line length
exclude_rule 'MD013'
# I end headers by question marks
exclude_rule 'MD026'
# Inline HTML support
exclude_rule 'MD033'
# I use bare URL for Open Graph variable og:image
# Open Graph — http://ruogp.me/
# Also, I use bare URL for magiclink
# http://facelessuser.github.io/pymdown-extensions/extensions/magiclink/
exclude_rule 'MD034'
# Temporary, before the new release
# https://github.com/mivok/markdownlint/pull/160
exclude_rule 'MD039'
# In Pelican first line — is Metadata, not header
exclude_rule 'MD041'
