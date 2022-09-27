Title: ValeriyaSpeller
Version: 0.1.0
Author: Sasha Chernykh
Date: 2017-04-03 11:17:14
Modified: 2022-09-14 11:35:59
Lang: en
Summary: yaspeller implementation for Sublime Text
	![ValeriyaSpeller](https://i.imgur.com/bqRl8eD.png)
Pagetitle: ValeriyaSpeller
Pagecolors: programs
Asideimage: SashaChocolate
Titleimage: true
Titleimagename: ValeriaEarring
Iconleftorright: right
Tags: sasha-chernykh-software, sublime-text, spell-check, yaspeller
Noco: 1g9b6
Epigraph: true
Epigraphtext: i express my gratitude to Her
	for everything She has done for me.
	ValeriyaSpeller devote to
	my Hero, Angel and Savior
	perfect fan of [Goddess](https://vk.com/psychologist_kira_k),
	[Valeria Zveginceva](https://vk.com/v.alprech)
OpenGraphImage: https://i.imgur.com/iciGBgN.jpg
Schemaorgtype: SoftwareApplication

!!! warning "Outdated code"
    ValeriyaSpeller worked for me in 2017, but it looks like its code isn’t compatible with newer SublimeLinter versions.

    June 6 2021

# Briefly

Russian-language spellchecker for Sublime Text.

# Demonstration

![Sublime Text Window](https://i.imgur.com/bqRl8eD.png)

![Error report](https://i.imgur.com/5x542fy.png)

# Motivation

i need extra spellchecker for Russian-language texts.

# Testing

Tested on:

1. Windows 10 Enterprise LTSB 64-bit EN,
1. Sublime Text Build 3126,
1. Node.js v7.8.0,
1. yaspeller 3.1.0,
1. literature works of Chekhov, Dostoyevsky, Leonid Andreyev and Oliver Sacks (in Russian translation) — favorite Valeria writers.

Must be works in macOS and *nix operating systems.

# Installation

1. Install [Node.js](https://nodejs.org/en/), if no. For Windows users I recommend [install Chocolatey](https://lifehacker.ru/2015/01/08/chocolatey/) → install Node.js by [command](https://chocolatey.org/packages/nodejs) `choco install nodejs -y`.
1. Install [yaspeller](https://www.npmjs.com/package/yaspeller) — `npm install yaspeller -g`.
1. Install [SublimeLinter](https://packagecontrol.io/packages/SublimeLinter) framework [via Package Control](https://docs.cs.cf.ac.uk/notes/sublime-text-packages/).
1. [Install](http://www.macdrifter.com/2012/08/install-sublime-packages-from-github.html) [ValeriyaSpeller](https://github.com/Kristinita/SublimeLinter-contrib-ValeriyaSpeller).

# Usage

## Required

ValeriyaSpeller highlight/output typos in next types of files:

1. Markdown,
1. HTML,
1. LaTeX,
1. Comments in any language.

Note: ValeryaLinter must work in most cases. If no, [your syntax](https://www.sublimetext.com/docs/3/syntax.html) don’t have any of these [scopes](https://www.sublimetext.com/docs/3/scope_naming.html) — `text.html.markdown`, `text.plain`, `text.tex.latex`, `comment`.

After installation open any of these files → and see:

1. ValeriyaSpeller marks in [gutter](http://ru.stackoverflow.com/q/637536/199934),
1. ValeriyaSpeller suggests in [status bar](https://www.google.ru/search?q=status+bar&newwindow=1&source=lnms&tbm=isch&sa=X&ved=0ahUKEwi-j9WygojTAhVGiSwKHfRhATYQ_AUIBigB&biw=1173&bih=729).

## Optional

You may select different [SublimeLinter modes](http://www.sublimelinter.com/en/latest/lint_modes.html).

Also you open linting file → <kbd>Ctrl+Shift+P</kbd> (<kbd>⌘⇧p</kbd> for Mac) → `SublimeLinter: Report (Open Files)` → and see all linting errors and warnings of all your enabled SublimeLinter linters for all  opened files.

## Detail output

You can to give detailed output, example:

```json

SublimeLinter: valeriyaspeller: TheChorusGirl.Chekhov ['C:\\Users\\SashaChernykh\\AppData\\Roaming\\npm\\yaspeller.cmd', '--check-yo', '--find-repeat-words', '--ignore-digits', '--ignore-latin', '--ignore-roman-numerals', '--ignore-uppercase', '--ignore-urls']
SublimeLinter: valeriyaspeller output:
Checking finished: 1.154 sec.
[ERR] stdin 710 ms
-----
Typos: 2
1. Бoже (3:3, en: *o**, ru: Б*же, suggest: Боже)
2. ПСаши (5:116, suggest: Саши)

Capitalization: 1
1. ВсПомнила (9:113, suggest: Вспомнила)

Letter Ё (Yo): 1
1. довел (3:108, count: 2, suggest: довёл)
-----
```

![Detailed output](https://i.imgur.com/uC1hthv.png)

<kbd>Ctrl+Shift+P</kbd> (<kbd>⌘⇧p</kbd> for Mac) → `SublimeLinter: Enable Debug Mode` → open file, which you needs to linting → [open Sublime Text console](http://stackoverflow.com/q/13965877/5951529) → see output.

# Description

## Command line arguments

[Description of yaspeller npm module](https://www.npmjs.com/package/yaspeller), [command line keys](https://www.npmjs.com/package/yaspeller#options). Default command is

```shell
yaspeller --check-yo --find-repeat-words --ignore-digits --ignore-latin --ignore-roman-numerals --ignore-uppercase --ignore-urls
```

## Limits

10 thousands queries and 10 millions symbols in a day, see [3.2 item](https://yandex.ru/legal/speller_api/) terms of rules.

# Known problems and issues

1. SublimeLinter [don’t work with unsaved buffers](https://github.com/SublimeLinter/SublimeLinter3/issues/545), it use [`#!python file_name()` method, not `#!python id()` method](https://www.sublimetext.com/docs/3/api_reference.html#sublime.View).

**If you may to solve these problems, please tell me about it. Pull requests welcome!** You also can add your `+1` comment in any issue of this list.

# Others thematic packages

For English and Russian:

1. [LanguageTool](https://packagecontrol.io/packages/LanguageTool),
1. [Dictionaries](https://github.com/titoBouzout/Dictionaries) — [Russian-English bilingual dictionary](https://github.com/titoBouzout/Dictionaries/pull/68),
1. [write-good](https://packagecontrol.io/packages/SublimeLinter-contrib-write-good),
1. [Thesaurus](https://packagecontrol.io/packages/Thesaurus).

Also in Sublime Text implemented [proselint](https://packagecontrol.io/packages/SublimeLinter-contrib-proselint) package, but [I have critical CPU usage bug](https://github.com/amperser/proselint/issues/686).
