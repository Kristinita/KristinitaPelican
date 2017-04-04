#!/usr/bin/ruby
# @Author: Kristinita
# @Date:   2017-03-26 12:56:49
# @Last Modified by:   Kristinita
# @Last Modified time: 2017-04-03 13:11:45
## Markdownlint configuration
## 【rule】https://github.com/mivok/markdownlint/blob/master/docs/RULES.md
## 【style file】https://github.com/mivok/markdownlint/blob/master/docs/configuration.md
## 【style syntax】 https://github.com/mivok/markdownlint/blob/master/docs/creating_styles.md

all

# Lint if more than 3 trailing spaces
rule 'MD009', :br_spaces => 3

# In my Pelican articles I use h1 tag in page templates
# I begin section use h2 tag
# Using h1 tag is good — http://archive.li/X3d8c
exclude_rule 'MD002'
# I use tabs instead of spaces
exclude_rule 'MD010'
# Line length
exclude_rule 'MD013'
# Inline HTML support
exclude_rule 'MD033'
# In Pelican first line — is Metadata, not header
exclude_rule 'MD041'












