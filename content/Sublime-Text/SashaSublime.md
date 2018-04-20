Title: SashaSublime
Tags: Sublime Text
Date: 2017-01-31 09:13:30
Status: published
Author: Sasha Chernykh
PageTitle: SashaSublime
Summary: Theme and color scheme for Sublime Text, where all colors have good visible. <br><br> ![Hex Viewer](https://i.imgur.com/c0t0Iqy.png) <br><br> ![GoTo Anything](https://i.imgur.com/2hRinyv.png) <br><br> ![JSON](https://i.imgur.com/N2LvbNZ.png)
MetaContent: SashaSublime — theme and color scheme for Sublime Text 3, where all elements are good visible
Category: Programs
Pagecolors: programs
Asideimage: SashaChocolate
IconLeftOrRight: right
Tooltipster: true
ClipboardJs: true
Noco: 1g9b6

<p>
	<a href="{filename}/images/donate_files/Bitcoin-HTML-Redirect.html"><img src="{filename}/images/donate_files/Bitcoin-Donate-button.png" alt="Bitcoin Donate Button" class="SashaInline" /></a>
	<a href="{filename}/images/donate_files/Litecoin-HTML-Redirect.html"><img src="{filename}/images/donate_files/Litecoin-Donate-button.png" alt="Litecoin Donate Button" class="SashaInline" /></a>
	<a href="https://www.paypal.com/us/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=63KC7VJTRVNVQ"><img class="SashaInline" src="{filename}/images/donate_files/PayPal-Donate-Button-Dollar.png" alt="PayPal Dollar button" class="SashaInline" /></a>
	<a href="https://www.paypal.com/us/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VPA8L2LM7EX24"><img src="{filename}/images/donate_files/PayPal-Donate-Button-Euro.png" alt="PayPal Euro button" class="SashaInline" /></a>
</p>
<p>
	<img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License" class="SashaInline" />
	<img src="https://img.shields.io/badge/Release-1.3.1-orange.svg" alt="Release" class="SashaInline" />
	<img src="https://img.shields.io/github/stars/Kristinita/SashaSublime.svg" alt="Stars" />
	<img src="https://img.shields.io/github/forks/Kristinita/SashaSublime.svg" alt="Forks" />
	<img src="https://img.shields.io/maintenance/STATUS/2018.svg" alt="Maintained" />
	<a href="https://packagecontrol.io/packages/SashaSublime"><img src="https://packagecontrol.herokuapp.com/downloads/SashaSublime.svg?style=flat-square" alt="Package Control" /></a>
	<a href="https://github.com/Kristinita/SashaSublime/issues"><img src="https://img.shields.io/github/issues/Kristinita/SashaSublime.svg" alt="GitHub issues" /></a>
</p>

<!-- MarkdownTOC -->

1. [Description](#description)
1. [Support](#support)
	1. [Platforms](#platforms)
	1. [Sublime Text](#sublime-text)
	1. [Syntaxes](#syntaxes)
1. [Screenshots](#screenshots)
	1. [General](#general)
		1. [Overall plan](#overall-plan)
		1. [Details](#details)
		1. [Gutter](#gutter)
		1. [Autocomplete](#autocomplete)
		1. [Tabs](#tabs)
		1. [Sidebar](#sidebar)
		1. [Indexing status](#indexing-status)
		1. [Phantom](#phantom)
	1. [Plugins](#plugins)
		1. [Sublimerge 3 + GitGutter](#sublimerge-3--gitgutter)
		1. [HexViewer](#hexviewer)
		1. [GitGutter + SublimeLinter](#gitgutter--sublimelinter)
		1. [BracketHighlighter](#brackethighlighter)
		1. [Emmet](#emmet)
		1. [Color Helper](#color-helper)
		1. [dr\_months\_calendar](#dr_months_calendar)
		1. [Suricate](#suricate)
		1. [sublime\_unicode\_nbsp](#sublime_unicode_nbsp)
	1. [Selected text](#selected-text)
		1. [Selected text example](#selected-text-example)
		1. [Selected text when the carriage is not on text field](#selected-text-when-the-carriage-is-not-on-text-field)
		1. [Find \(Ctrl+F\) text](#find-ctrlf-text)
		1. [Find text when the carriage is out of the found text](#find-text-when-the-carriage-is-out-of-the-found-text)
	1. [Panels and consoles](#panels-and-consoles)
		1. [GotoAnything panel](#gotoanything-panel)
		1. [Switch Project panel](#switch-project-panel)
		1. [Find and Replace panel](#find-and-replace-panel)
		1. [Console](#console)
		1. [Build System output console](#build-system-output-console)
		1. [ScopeHunter output console](#scopehunter-output-console)
	1. [Syntaxes](#syntaxes-1)
		1. [JSON](#json)
		1. [XML](#xml)
		1. [HTML](#html)
		1. [CSS](#css)
		1. [JavaScript](#javascript)
		1. [Diff](#diff)
		1. [Regular Expression](#regular-expression)
		1. [Mediawiki NG](#mediawiki-ng)
1. [Comparison of Monokai \(default color scheme\) and SashaSublime](#comparison-of-monokai-default-color-scheme-and-sashasublime)
	1. [Monokai scopes](#monokai-scopes)
	1. [SashaSublime scopes](#sashasublime-scopes)
1. [Downloading and installation](#downloading-and-installation)
	1. [Package Control](#package-control)
	1. [Git](#git)
	1. [Hub](#hub)
	1. [Manually](#manually)
1. [Activation](#activation)
	1. [Themr and Schemr](#themr-and-schemr)
	1. [Manually activation](#manually-activation)
1. [Preferences](#preferences)
1. [Setting SashaSublime for some plugins](#setting-sashasublime-for-some-plugins)
	1. [BracketHighlighter](#brackethighlighter-1)
	1. [GitGutter](#gitgutter)
1. [Customization non-Sublime Text settings for Windows](#customization-non-sublime-text-settings-for-windows)
	1. [Changing favicon in Sublime Text 3](#changing-favicon-in-sublime-text-3)
	1. [Title Bar and window border color](#title-bar-and-window-border-color)
	1. [Winaero Tweaker](#winaero-tweaker)
		1. [Inactive Title Bar color](#inactive-title-bar-color)
		1. [Menu Bar settings](#menu-bar-settings)
		1. [Title Bar settings](#title-bar-settings)
1. [Editing SashaSublime settings](#editing-sashasublime-settings)
	1. [Editing default files](#editing-default-files)
		1. [Steps](#steps)
		1. [Problem](#problem)
	1. [Editing user files](#editing-user-files)
		1. [Steps](#steps-1)
		1. [Problem](#problem-1)
1. [Known defects](#known-defects)
	1. [SublimeLinter wrote own color scheme file in preferences](#sublimelinter-wrote-own-color-scheme-file-in-preferences)
	1. [Changing color of square inline error](#changing-color-of-square-inline-error)
1. [See also](#see-also)
1. [Thanks](#thanks)
1. [Contacts](#contacts)
1. [Donate](#donate)
	1. [Bitcoin](#bitcoin)
	1. [Litecoin](#litecoin)
	1. [Paypal $](#paypal-$)
	1. [Paypal €](#paypal-€)
1. [License](#license)

<!-- /MarkdownTOC -->

------------------------------------------------------------------------

------------------------------------------------------------------------

**SashaSublime is devoted to God, the only Creation for the sake of Which it makes sense to live on this planet, the Greatest being of all times and peoples, Queen of the World [Sasha Chernykh](https://vk.com/hair_in_the_wind) (Kira Kenyukhova)**.

![Queen of the World Sasha Chernykh](https://i.imgur.com/OJSBK4V.jpg)

<a id="description"></a>
# Description

i faced a problem that in already available themes and color schemes many elements of syntaxes have badly distinguishable an eye of color. i tried to use many themes and schemes, but the result in one of them didn’t satisfy me. Therefore, i decided to write own theme/scheme; its concept:

1. **all colors of all elements are well visible**,
1. change colors made not for beauty, and for better visibility,
1. different colors for each syntax,
1. each element of syntax has to have color.

<a id="support"></a>
# Support

<a id="platforms"></a>
## Platforms

Windows, macOS, Linux.

<a id="sublime-text"></a>
## Sublime Text

Only Build 3114 and higher. Older versions of Sublime Text are not supported. Please take the automatic upgrade Sublime Text, if you wanted use SashaSublime.

Cause — [serious updating](https://forum.sublimetext.com/t/changing-scopes-in-build-3114/20088) [scopes](http://ru.stackoverflow.com/a/516668/199934) for syntaxes in new builds. After each new update Sublime Text, color schemes developers [needs to many changes](https://toster.ru/q/321006#answer_852035) color scheme files.

Example, how to view JavaScript code:

**Build 3114:**

![Build 3114](https://i.imgur.com/fTv7zgG.png)

**Build 3103:**

![Build 3103](https://i.imgur.com/9vnVBy4.png)

In Build 3103 many syntax elements are not own colors.

<a id="syntaxes"></a>
## Syntaxes

Supported syntaxes: JSON, XML, HTML, CSS, JavaScript, Diff, Regular Expression, Mediawiki NG, dr\_months\_calendar. The color scheme is incompatible with syntaxes of [CSS3](https://packagecontrol.io/packages/CSS3_Syntax) and [JavaScriptNext - ES6](https://packagecontrol.io/packages/JavaScriptNext%20-%20ES6%20Syntax). Please, use default syntax for JavaScript and CSS for compatibility with SashaSublime. If you want use SashaSublime, but in some syntaxes you want use another color scheme, please, read page 73 in «[Sublime Text Power User](http://nbviewer.jupyter.org/github/Kristinita/SashaBooks/blob/master/IT/Sublime%20Text/Sublime%20Text%20Power%20User.pdf#page=73)» book. If you want other color scheme for [Distraction Free Mode](https://www.sublimetext.com/docs/2/distraction_free.html), please, see [this answer](http://stackoverflow.com/a/15908023/5951529).

<a id="screenshots"></a>
# Screenshots

Screenshots are made in the Windows 10 operating system, Sublime Text 3, Build 3114. If i make changes to my color theme and color scheme, i try not to forget to take screenshots of the changes. But Sublime Text and plugins updated, and look at my screenshots may differ from appearance to reality. If you see a discrepancy, please let me know.

<a id="general"></a>
## General

<a id="overall-plan"></a>
### Overall plan

![SashaSublime](https://i.imgur.com/ljT5eJp.png)

<a id="details"></a>
### Details

In a theme/scheme the smallest details are well visible.

![Overall plan details](https://i.imgur.com/DlrJCes.png)

<a id="gutter"></a>
### Gutter

![Gutter](https://i.imgur.com/VqeuQtH.png)

<a id="autocomplete"></a>
### Autocomplete

![Autocomplete](https://i.imgur.com/3RPAwA7.png)

<a id="tabs"></a>
### Tabs

![Tabs](https://i.imgur.com/CTOQ9WG.png)

<a id="sidebar"></a>
### Sidebar

![Side bar](https://i.imgur.com/N8UWi1Q.png)

<a id="indexing-status"></a>
### Indexing status

![Indexing status](https://i.imgur.com/FMo5NLK.png)

<a id="phantom"></a>
### Phantom

![Phantom](https://i.imgur.com/C2aZ7oy.png)

<a id="plugins"></a>
## Plugins

<a id="sublimerge-3--gitgutter"></a>
### [Sublimerge 3](http://www.sublimerge.com/sm3/) + [GitGutter](https://packagecontrol.io/packages/GitGutter)

![Sublimerge](https://i.imgur.com/YnfYXWD.png)

<a id="hexviewer"></a>
### [HexViewer](https://github.com/facelessuser/HexViewer)

![Hex Viewer](https://i.imgur.com/c0t0Iqy.png)

<a id="gitgutter--sublimelinter"></a>
### [GitGutter](https://packagecontrol.io/packages/GitGutter) + [SublimeLinter](http://www.sublimelinter.com/en/latest/)

![GitGutter and SublimeLinter](https://i.imgur.com/24kzw67.png)

<a id="brackethighlighter"></a>
### [BracketHighlighter](https://facelessuser.github.io/BracketHighlighter/)

![BracketHighlighter](https://i.imgur.com/S8SE9nh.png)

<a id="emmet"></a>
### [Emmet](http://emmet.io/)

![Emmet](https://i.imgur.com/Arhzbgl.png)

<a id="color-helper"></a>
### [Color Helper](https://github.com/facelessuser/ColorHelper)

![Color Helper](https://i.imgur.com/ZcmyymH.png)

<a id="dr_months_calendar"></a>
### [dr\_months\_calendar](https://github.com/dragon/dr_months_calendar)

![dr\_months\_calendar](https://i.imgur.com/Pq1HXC7.png)

<a id="suricate"></a>
### [Suricate](https://github.com/nsubiron/SublimeSuricate)

![Suricate](https://i.imgur.com/ivsdfXM.png)

If *"popup\_style\_file": "Packages/Suricate/css/dark.css",* in Suricate settings.

<a id="sublime_unicode_nbsp"></a>
### [sublime\_unicode\_nbsp](https://github.com/possan/sublime_unicode_nbsp)

![sublime\_unicode\_nbsp](https://i.imgur.com/LCTE0Y2.png)

If [patched](https://github.com/possan/sublime_unicode_nbsp/pull/14/files).

<a id="selected-text"></a>
## Selected text

Results with the established [WordHighlight](https://github.com/SublimeText/WordHighlight) plugin.

<a id="selected-text-example"></a>
### Selected text example

![Accentuation](https://i.imgur.com/yJ2EdbD.png)

<a id="selected-text-when-the-carriage-is-not-on-text-field"></a>
### Selected text when the carriage is not on text field

![Accentuation2](https://i.imgur.com/y715wdq.png)

<a id="find-ctrlf-text"></a>
### Find (<kbd>Ctrl+F</kbd>) text

![Find result](https://i.imgur.com/Z3lGryq.png)

<a id="find-text-when-the-carriage-is-out-of-the-found-text"></a>
### Find text when the carriage is out of the found text

![Find result2](https://i.imgur.com/Tyqv7to.png)

Carriage color and this border color set to the same parameter.

<a id="panels-and-consoles"></a>
## Panels and consoles

<a id="gotoanything-panel"></a>
### GotoAnything panel

![GotoAnything panel](https://i.imgur.com/2hRinyv.png)

<a id="switch-project-panel"></a>
### Switch Project panel

![Switch Project panel](https://i.imgur.com/YVcfF0k.png)

<a id="find-and-replace-panel"></a>
### Find and Replace panel

![Find and Replace panel](https://i.imgur.com/H6tolbC.png)

<a id="console"></a>
### Console

![Console](https://i.imgur.com/JwQyqyU.png)

<a id="build-system-output-console"></a>
### Build System output console

For get a black and white colors, Install [SublimeANSI](https://github.com/aziz/SublimeANSI) plugin and [add](https://github.com/aziz/SublimeANSI#using-this-plugin-as-a-dependency-for-your-pluginbuild-output-panel) in your *.sublime-build* file these lines:

```json


"target": "ansi_color_build",
"syntax": "Packages/ANSIescape/ANSI.tmLanguage"
```

![Build console](https://i.imgur.com/4s81HhM.png)

<a id="scopehunter-output-console"></a>
### ScopeHunter output console

![ScopeHunter console](https://i.imgur.com/CsxZ8XW.png)

<a id="syntaxes-1"></a>
## Syntaxes

<a id="json"></a>
### JSON

![JSON1](https://i.imgur.com/N2LvbNZ.png)

![JSON2](https://i.imgur.com/epuwjOb.png)

With [LanguageTool](https://packagecontrol.io/packages/LanguageTool) plugin:

![JSON3](https://i.imgur.com/6kWo4aW.png)

<a id="xml"></a>
### XML

![XML](https://i.imgur.com/0s4EFYN.png)

<a id="html"></a>
### HTML

![HTML1](https://i.imgur.com/POTMTWq.png)

![HTML2](https://i.imgur.com/LFKMdDX.png)

![HTML3](https://i.imgur.com/AbGgQa9.png)

<a id="css"></a>
### CSS

![CSS](https://i.imgur.com/Rr9AmIZ.png)

<a id="javascript"></a>
### JavaScript

It turned out to work not so carefully as i wanted.

![JS1](https://i.imgur.com/dedldIL.png)

![JS2](https://i.imgur.com/2e34vGr.png)

<a id="diff"></a>
### Diff

![Diff](https://i.imgur.com/AF7BgIU.png)

<a id="regular-expression"></a>
### Regular Expression

![Regex1](https://i.imgur.com/kzwyA4E.png)

![Regex2](https://i.imgur.com/Fu2Slm6.png)

![Regex3](https://i.imgur.com/1kvOeeK.png)

<a id="mediawiki-ng"></a>
### Mediawiki NG

![Mediawiki1](https://i.imgur.com/Y2FYuFI.png)

![Mediawiki2](https://i.imgur.com/sSzqfsm.png)

<a id="comparison-of-monokai-default-color-scheme-and-sashasublime"></a>
# Comparison of Monokai (default color scheme) and SashaSublime

SashaSublime has several times more than parameters, than a default theme Monokai. See mouse cursor on the thumb of vertical scroll bar SashaSublime color scheme. Testing was carried out on [TmTheme Editor](https://tmtheme-editor.herokuapp.com).

<a id="monokai-scopes"></a>
## Monokai scopes

![Monokai scopes](https://i.imgur.com/YITyD6A.png)

<a id="sashasublime-scopes"></a>
## SashaSublime scopes

![SashaSublime scopes](https://i.imgur.com/JzT6vnk.png)

<a id="downloading-and-installation"></a>
# Downloading and installation

After installation, you need to activate SashaSublime, see [Activation](#Activation) section. Sublime Text no needs restart after installation SashaSublime.

<a id="package-control"></a>
## Package Control

[Package Control](https://packagecontrol.io/) — package manager for Sublime Text, via Package Control you may install thousands of plugins. If you never used Package Control, make steps.

Open your Sublime Text. After Build 3124 install Package Control may quick, use *Tools* menu item: *Tools* → *Install Package Control...*.

![Install Package Control](https://i.imgur.com/JSw5Rbw.png)

<kbd>Ctrl+Shift+P</kbd> → *Package Control: Install Package*

![Install Package](https://i.imgur.com/qxOBpFq.png)

Print *SashaSublime* → Enter.

<a id="git"></a>
## Git

*Preferences* → *Browse Packages...* → in this folder open terminal, preferable to you, and run command:

```shell


git clone https://github.com/Kristinita/SashaSublime.git
```

<a id="hub"></a>
## Hub

I recommend use [Hub](https://hub.github.com/) — a command-line wrapper for git that makes you better at GitHub.

If you use Hub, *Preferences* → *Browse Packages...* → in this folder open terminal, preferable to you, and run command:

```shell
hub clone Kristinita/SashaSublime
```

<a id="manually"></a>
## Manually

Open the page <https://github.com/Kristinita/SashaSublime> in browser. In right bottom angle select Clone or download and then Download ZIP:

![Download ZIP](https://i.imgur.com/fzvUXYo.png)

Download zip-archive and unpack it to <kbd>Alt+N</kbd> → *Browse Packages...* folder. Rename *SashaSublime-master* to *SashaSublime*.

As a result, your folder with SashaSublime has to settle down on the path *Preferences* → *Browse Packages...* → *SashaSublime*. For example, absolute path for me is *E:\\Sublime Text 3\\Data\\Packages*.

<a id="activation"></a>
# Activation

<a id="themr-and-schemr"></a>
## Themr and Schemr

Install [Themr](https://github.com/benweier/Themr) plugin. <kbd>Ctrl+Shift+P</kbd> → *Themr: List themes* → *SashaSublime* → Enter.

![Theme SashaSublime](https://i.imgur.com/dgIVs3Y.png)

Then install [Schemr](https://github.com/benweier/Schemr) plugin. <kbd>Ctrl+Shift+P</kbd> → *Schemr: List all schemes* → *SashaSublime \[Dark\]* → Enter.

![Scheme SashaSublime](https://i.imgur.com/UYOiBB9.png)

<a id="manually-activation"></a>
## Manually activation

<kbd>Alt+N</kbd> → *Settings* → in file in right [pane](http://www.macdrifter.com/2012/07/sublime-text-working-with-multiple-panes.html) add 2 lines:

```json


"color_scheme": "Packages/SashaSublime/SashaSublime.tmTheme",
"theme": "SashaSublime.sublime-theme",
```

Be attentive, [correct place](http://ru.stackoverflow.com/a/238934/199934) commas, quotes, brackets and colons.

<a id="preferences"></a>
# Preferences

Also, you can make that all your settings were as at me. Copy into your file *Preferences* → *Settings - User* these lines from my file *Preferences* → *Preferences.sublime-settings*:

```json
"always_show_minimap_viewport": true,
"auto_find_in_selection": false,
"bold_folder_labels": true,
"caret_style": "wide",
"detect indentation": false,
"draw_indent_guides": false,
"draw_minimap_border": true,
"fade_fold_buttons": false,
"font_face": "Consolas",
"font_options":
[
	"subpixel_antialias",
	"directwrite"
],
"highlight_line": true,
"highlight_modified_tabs": true,
"line_padding_bottom": 1,
"line_padding_top": 1,
"match_brackets": false,
"match_brackets_angle": false,
"match_brackets_braces": false,
"match_brackets_content": false,
"match_brackets_square": false,
"match_tags": false,
"menu_visible": true,
"show_encoding": true,
```

Before copying save in a safe place file *Preferences.sublime-settings* from the *User* folder or, what better, use [Local History](https://github.com/vishr/local-history) plugin. If you don’t like my preferences, you will be able to return to your preferable settings.

<a id="setting-sashasublime-for-some-plugins"></a>
# Setting SashaSublime for some plugins

<a id="brackethighlighter-1"></a>
## BracketHighlighter

To paint in different colors of a bracket of a plugin of BracketHighlighter, execute the following actions:

- Install plugin BracketHighlighter via Package Control,
- *Preferences* → *Package Settings* → *BracketHighlighter* → *Bracket Settings - User* → add in open file this code and save file:

```json
{
	"bracket_styles":
	{
	"unmatched": {
"icon": "question",
"color": "brackethighlighter.unmatched",
"style": "highlight"
	},
	"curly": {
"icon": "curly_bracket",
"color": "brackethighlighter.curly",
"style": "highlight"
	},
	"round": {
"icon": "round_bracket",
"color": "brackethighlighter.round",
"style": "outline"
	},
	"square": {
"icon": "square_bracket",
"color": "brackethighlighter.square",
"style": "outline"
	},
	"angle": {
"icon": "angle_bracket",
"color": "brackethighlighter.angle",
"style": "outline"
	},
	"tag": {
"icon": "tag",
"color": "brackethighlighter.tag",
"style": "outline"
	},
	"single_quote": {
"icon": "single_quote",
"color": "brackethighlighter.quote",
"style": "outline"
	},
	"double_quote": {
"icon": "double_quote",
"color": "brackethighlighter.quote",
"style": "outline"
	},
	"regex": {
"icon": "regex",
"color": "brackethighlighter.quote",
"style": "outline"
	}
	}
}
```

<a id="gitgutter"></a>
## GitGutter

Probably you are faced with the [same](https://github.com/jisaacks/GitGutter/issues/199#issuecomment-227016698) problem of small icons in GitGutter. To solve this problem, at first install [PackageResourceViewer](https://github.com/skuroda/PackageResourceViewer) plugin. <kbd>Ctrl+Shift+P</kbd> → *PackageResourceViewer: Extract Package* → *GitGutter*. Then *Preferences* → *Browse Packages...* → *icons* → change the already available icons to icons in folder *icons* → *GitGutter* of SashaSublime repository. Your icons for GitGutter have to replace on icons of the bigger size.

<a id="customization-non-sublime-text-settings-for-windows"></a>
# Customization non-Sublime Text settings for Windows

Some settings not customizable via Sublime Text, to change them, you need to use other programs.

All settings in sections **Title Bar** color and **Winaero Tweaker** will affect **all** programs that do not have their own settings for these options, not only for Sublime Text. You will see the changes made, and when you open other programs.

All manuals in this section for Windows 10 users, use default theme. Users of others operating systems, please, see instructions for your OS in other sources.

If you follow all the steps in this section, you will get the result:

*Active window:*

![Active window](https://i.imgur.com/AUdJEug.png)

*Inactive window:*

![Inactive window](https://i.imgur.com/3E1qY10.png)

<a id="changing-favicon-in-sublime-text-3"></a>
## Changing favicon in Sublime Text 3

Unfortunately, after Sublime Text updates, you will have to make this steps again.

Mac users possible help [this](http://apple.stackexchange.com/questions/153176/changing-sublime-text-3-icon-in-dock-on-yosemite) answer.

For Windows users: download and open [Resource Hacker](http://rsload.net/soft/editor/9133-resource-hacker.html) or [alternate](http://alternativeto.net/software/resource-hacker/) programs for edit *exe* files. For example, in Resource Hacker: *File* → *Open* → *sublime\_text.exe* → *Icon Group* → right mouse button on *103:3081* → *Replace Icon ...*

![Resource Hacker](https://i.imgur.com/XcLuNqS.png)

→ select *SashaSublime.ico* in *icons* → *favicon* folder of this repository → *Replace* → *File* → *Save As* → *Yes* → *Save* → restart Windows.

In Sublime Text folder *sublime\_text\_original.exe* file create. If you don’t like my icons, you can replace *sublime\_text\_original.exe* → *sublime\_text.exe*. Besides, you can always replace your *sublime\_text.exe* file on [original version](https://www.sublimetext.com/3) this file.

Examples, when use colors of «S» letter my favicon:

![SashaSublime.ico](https://i.imgur.com/b2DxblV.png)

- yellow — for smallest favicons, because is good visible; use in top left angle Sublime Text 3 and in Windows Explorer,
- blue — icons in taskbar,
- violet — icons on desktop,
- orange — in [Rocket Dock](http://portableapps.com/node/25965) panel and at drag and drop file with icon Sublime Text.

<a id="title-bar-and-window-border-color"></a>
## Title Bar and window border color

Win+R → insert in input area this text

```shell


rundll32.exe shell32.dll,Control_RunDLL desk.cpl,Advanced,@Advanced
```

→ OK → move thumbs. You can preview changes in title bar your window. I select orange color:

![Orange Title bar](https://i.imgur.com/iZDK322.png)

*Save changes*. Window border will have exactly the same color as title bar.

![Orange windows border](https://i.imgur.com/jdWUb5m.png)

<a id="winaero-tweaker"></a>
## Winaero Tweaker

Install program [Winaero Tweaker](http://rsload.net/soft/optimization/19590-winaero-tweaker.html) — GUI for customization Windows 10 settings — and run it.

<a id="inactive-title-bar-color"></a>
### Inactive Title Bar color

*Appearance* → *Inactive Title Bars Color* → click on the square near *Current color (Click to change)* to select the color. I select pink color:

![Pink inactive Title Bar](https://i.imgur.com/ZdcNwMQ.png)

<a id="menu-bar-settings"></a>
### Menu Bar settings

*Advanced Appearance Settings* → *Menus* → change values of parameters. I select *Adjust menu height* → *27*, *font* — *Segoe UI*, *font size* — *10*.

![Menu Bar](https://i.imgur.com/TxDmEIg.png)

*Apply changes* → *Sign out now* → look settings in new Windows session.

<a id="title-bar-settings"></a>
### Title Bar settings

*Advanced Appearance Settings* → *Window Title Bars* → change values of parameters. I select *Window Title bar height* → *30*, *font* — *Segoe UI*, *font size* — *11*.

![Title bar settings](https://i.imgur.com/mFnVWxi.png)

*Apply changes* → *Sign out now* → view settings in new Windows session.

<a id="editing-sashasublime-settings"></a>
# Editing SashaSublime settings

Parameters in the file of SashaSublime package are comments in Russian. You can see which color corresponds to which element. Exception — *Preferences.sublime-settings*. Comments in this file automatically [removed](https://forum.sublimetext.com/t/bug-comments-deleted-in-preferences-user/7064/6?u=sasha_chernykh). About all parameters containing in *Preferences.sublime-settings* file is [possible to read](http://www.sublimetext.ru/documentation/preferences/list) on the Russian site Sublime Text 3.

If you don’t like some colors in SashaSublime, you can change them yourself, see [detailed instructions in Russian](http://ru.stackoverflow.com/a/516668/199934). You can also find a set of other solutions on themes and schemes in other my answers on [Stack Overflow in Russian](http://ru.stackoverflow.com/search?q=user:199934%20%5Bsublime-text%5D%20is:answer) and [Toster](https://toster.ru/user/Kristinita/answers).

But there’re problems. You have 2 options, how to customize SashaSublime.

<a id="editing-default-files"></a>
## Editing default files

<a id="steps"></a>
### Steps

Install [PackageResourceViewer](https://github.com/skuroda/PackageResourceViewer) plugin: <kbd>Ctrl+Shift+P</kbd> → *PackageResourseViewer:Open Resourse* → *SashaSublime* → edit SashaSublime files.

<a id="problem"></a>
### Problem

After updates, SashaSublime your changes will lost. You will need to copy the modified file in a separate place, and after the upgrade SashaSublime, you will need to merge you changes from your file into the file of SashaSublime, for example, via [Sublimerge 3](http://www.sublimerge.com/sm3/).

<a id="editing-user-files"></a>
## Editing user files

<a id="steps-1"></a>
### Steps

1. **Theme file** *Preferences* → *Browse Packages...* → *User* → create file *Example.sublime-theme*, if you want to make a changes in theme. Instead of *Example* you can name your file by any other name. Copy the contents of the file *SashaSublime.sublime-theme* into *Example.sublime-theme* make a changes and save *Example.sublime-theme* file. Via [Themr](#themr-and-schemr) select Example theme.
1. **Scheme file** *Preferences* → *Browse Packages...* → *User* → create file *Example.tmTheme*. Instead of *Example* you can name your file by any other name. Copy the contents of the file *SashaSublime.tmTheme* into *Example.tmTheme* make a changes and save *Example.tmTheme* file. Via [Schemr](#themr-and-schemr) select Example scheme.

<a id="problem-1"></a>
### Problem

Will update *SashaSublime.sublime-theme* and *SashaSublime.tmTheme* files, no *Example.sublime-theme* and *Example.tmTheme* files. You will not see updates, if you not select SashaSublime theme and scheme files. You will need to merge you changes from SashaSublime into your file, for example, via [Sublimerge 3](http://www.sublimerge.com/sm3/).

<a id="known-defects"></a>
# Known defects

If you know how to solve these problems, please, [tell me](https://github.com/Kristinita/SashaSublime/issues).

- [not change color text «Open files and folders» in placeholder](https://forum.sublimetext.com/t/how-to-style-placeholders-text-like-open-files-and-folders-in-the-find-in-files-dialog/21650),
- [lower half of font is cut off when increasing tab\_label font.size](https://github.com/SublimeTextIssues/Core/issues/694),
- [reset Custom Settings icon after updating GitGutter](https://github.com/jisaacks/GitGutter/issues/307),
- [Color Highlighter generate new schemes](https://forum.sublimetext.com/t/how-to-disable-new-color-scheme-generating-color-highlighter/22949),
- [double schemes in Schemr list if you use Color Highlighter](https://github.com/benweier/Schemr/issues/34),
- [no syntax highlighting in *Replace With:* field](https://forum.sublimetext.com/t/where-i-can-to-make-regex-syntax-highlight-for-replace-with/22961),
- [not change Menu Bar color in default Windows 10 theme](http://winreview.ru/forum/viewtopic.php?f=6&t=294),
- [not change window border thickness in default Windows 10 theme](http://winreview.ru/forum/viewtopic.php?f=6&t=295),

<a id="sublimelinter-wrote-own-color-scheme-file-in-preferences"></a>
## SublimeLinter wrote own color scheme file in preferences

If you use [SublimeLinter](https://github.com/SublimeLinter/SublimeLinter3), you may not like that Sublime Linter additional sets the color scheme in your user settings. To deactivate the color scheme SublimeLinter, follow these steps:

Install [PackageResourceViewer](https://github.com/skuroda/PackageResourceViewer) plugin → <kbd>Ctrl+Shift+P</kbd> → PackageResourceViewer: *Open Resource* → *SublimeLinter* → *lint* → *util.py* → in open file to comment out or remove line 215:

```python


sublime.set_timeout_async(generate_color_scheme_async, 0)
```

Restart Sublime Text → SublimeLinter should not prescribe in your preferences own color scheme file. Thanks [@r-stein](https://github.com/r-stein) at [solution](https://forum.sublimetext.com/t/sublimelinter-write-own-color-scheme-path-in-the-configuration-file/21842/2?u=sasha_chernykh).

<a id="changing-color-of-square-inline-error"></a>
## Changing color of square inline error

Color of the square of minihtml phantoms look like background color.

**Actual phantom:**

![Actual phantom](https://i.imgur.com/C2aZ7oy.png)

**Expected phantom:**

![Expected phantom](https://i.imgur.com/LB5EWfR.png)

In the files of color scheme you can not change the color of the square of minihtml phantoms. You need again edit *exec.py* file after each update Sublime Text.

Install [PackageResourceViewer](https://github.com/skuroda/PackageResourceViewer) plugin → <kbd>Ctrl+Shift+P</kbd> → *PackageResourceViewer: Open Resource* → *Default* → *exec.py* → between *&lt;style&gt;&lt;/style&gt;* add these lines:

```css
body#inline-error div.error a
{
	background-color: #28071a;
}
```

→ save *exec.py*.

<a id="see-also"></a>
# See also

- [Kristinita’s Search](https://kristinita.ru) — search engine, searching authoritative sources, materials written by experts on the subject.
- [Sasha Black](https://kristinita.ru/Sasha-Black) — mini-service checks the reputation of your site and the availability of the site in the blacklists.

<a id="thanks"></a>
# Thanks

Thanks to those who answered my questions on themes and color schemes on [Stack Overflow](http://stackoverflow.com/), [English](https://forum.sublimetext.com/) and [Russian](http://forum.sublimetext.ru) Sublime Text forums: [@Keith Hall](https://github.com/keith-hall), [@MattDMo](https://github.com/MattDMo), [@Enteleform](https://github.com/Enteleform), [@r-stein](https://github.com/r-stein), [@maximsmol](https://github.com/maximsmol), [@braver](https://github.com/braver) and [@Дмитрий Лоак](https://vk.com/id206422835).

During the work on a theme the theme [Espresso Libre](http://colorsublime.com/theme/Espresso_Libre) of Chris Thomas as a basis.

<a id="contacts"></a>
# Contacts

<kbd>Ctrl+Shift+P</kbd> → *SashaSublime: Report SashaSublime issue* → write your issue.

After the Sublime Text 3 updates, settings of the color theme [can get off](https://forum.sublimetext.com/t/changing-scopes-in-build-3114/20088?u=sasha_chernykh). Please, if you found out that colors became not such as before, [report to me](https://github.com/Kristinita/SashaSublime/issues/new) about it.

If the icon for your markup language or a programming language is absent in SashaSublime, you can add it independently, having carried out the [these instructions](http://ru.stackoverflow.com/a/544861/199934) or to ask me.

<a id="donate"></a>
# Donate

I do not hope that I will get at least a penny, but suddenly I’m feeling lucky… [Goddess Kira](https://vk.com/hair_in_the_wind) needs money for dental treatment.

<a id="bitcoin"></a>
## Bitcoin

[![Bitcoin Donate Button]({filename}/images/donate_files/Bitcoin-Donate-button.png)]({filename}/images/donate_files/Bitcoin-HTML-Redirect.html)

See [my answer](http://bitcoin.stackexchange.com/a/48744/41598) to Bitcoin Stack Exchange, if you want to know how to make the same button. If you Bitcoin client not supported [standard bitcoin schema URI](https://github.com/bitcoin/bips/blob/master/bip-0021.mediawiki), my Bitcoin address is:

```shell
17uctxtsWG3gpyAy6iJ8AVd5rdSjkJH2
```

<a id="litecoin"></a>
## Litecoin

[![Litecoin Donate Button]({filename}/images/donate_files/Litecoin-Donate-button.png)]({filename}/images/donate_files/Litecoin-HTML-Redirect.html)

If you Litecoin client not supported Litecoin schema URI, my Litecoin address is:

```shell
LLVvhNKGMLGHa8QmeRrBsjZUBjSpQMjUkP
```

<a id="paypal-$"></a>
## Paypal $

[![PayPal Dollar button]({filename}/images/donate_files/PayPal-Donate-Button-Dollar.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=W6MP468ZZV66Q)

<a id="paypal-€"></a>
## Paypal €

[![PayPal Euro button]({filename}/images/donate_files/PayPal-Donate-Button-Euro.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=DGT7K29LDD2HQ)

<a id="license"></a>
# License

[MIT License](https://opensource.org/licenses/MIT)

Copyright (c) 2016-17: [Sasha Chernykh](https://vk.com/hair_in_the_wind)

SashaSublime belongs to Goddess [Sasha Chernykh](https://vk.com/hair_in_the_wind), as well as all the rest in this world. All of us are insignificant creations which completely belong to Legendary Sasha Chernykh. To use SashaSublime, you have to pray to Sasha Chernykh every day and know that She, certainly, the most unsurpassed in the Universe.
