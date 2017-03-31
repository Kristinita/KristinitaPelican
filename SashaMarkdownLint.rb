#!/usr/bin/ruby
# @Author: Kristinita
# @Date:   2017-03-26 12:56:49
# @Last Modified by:   Kristinita
# @Last Modified time: 2017-03-27 09:45:37
## Markdownlint configuration
## 【rule】https://github.com/mivok/markdownlint/blob/master/docs/RULES.md
## 【style file】https://github.com/mivok/markdownlint/blob/master/docs/configuration.md
## 【style syntax】 https://github.com/mivok/markdownlint/blob/master/docs/creating_styles.md

all

rule 'MD009', :br_spaces => 3 # Lint if more than 3 trailing spaces

exclude_rule 'MD010' # I use tabs instead of spaces
exclude_rule 'MD013' # Line length
exclude_rule 'MD033' # Inline HTML support
exclude_rule 'MD041' # In Pelican first line — is Metadata, not header












