Title: How to get current … in Sublime Text
Version: 0.2.0
Author: Sasha Chernykh
Date: 2018-04-05 7:30:14
Modified: 2019-05-23 14:28:48
Lang: en
Summary: Tutorial, how to get some variable parameters for your Sublime Text <br><br> ![Color scheme and theme](https://i.imgur.com/nwNgLkR.png)
Pagetitle: How to get current … in Sublime Text
Pagecolors: it-articles
Iconleftorright: right
Asideimage: SashaGreenSweater
Tags: sublime-text
Noco: 1vWK5
Tooltipster: true
Clipboardjs: true
Og_image: https://i.imgur.com/nwNgLkR.png
Schemaorgtype: HowTo

<!-- MarkdownTOC -->

1. [Overview](#Overview)
1. [Audience](#Audience)
1. [Relevance](#Relevance)
1. [Features](#Features)
1. [Sublime Text console](#Sublime-Text-console)
	1. [Console actions](#Console-actions)
1. [How to get current …](#How-to-get-current-…)
	1. [Packages directory](#Packages-directory)
		1. [What is it?](#What-is-it)
		1. [What should you do?](#What-should-you-do)
		1. [Method](#Method)
		1. [Not recommended](#Not-recommended)
	1. [Syntax](#Syntax)
		1. [What is it?](#What-is-it-1)
		1. [What should you do?](#What-should-you-do-1)
		1. [Method](#Method-1)
	1. [Theme](#Theme)
		1. [What is it?](#What-is-it-2)
		1. [What should you do?](#What-should-you-do-2)
		1. [Method](#Method-2)
	1. [Color scheme](#Color-scheme)
		1. [What is it?](#What-is-it-3)
		1. [What should you do?](#What-should-you-do-3)
		1. [Method](#Method-3)
	1. [Scope](#Scope)
		1. [What is it?](#What-is-it-4)
		1. [What should you do?](#What-should-you-do-4)
		1. [Method](#Method-4)
		1. [Not recommended](#Not-recommended-1)
	1. [Syntax scope](#Syntax-scope)
		1. [What is it?](#What-is-it-5)
		1. [What should you do?](#What-should-you-do-5)
		1. [Method](#Method-5)
1. [External links](#External-links)

<!-- /MarkdownTOC -->

<a id="Overview"></a>
# Overview

Article, how you can get some variable parameters for your Sublime Text. I wrote about the most common variable parameters, that you can found in my answers and comments in Stack Overflow.

<a id="Audience"></a>
# Audience

Sublime Text users:

+ Inexperienced
+ Which help inexperienced users

<a id="Relevance"></a>
# Relevance

This article is relevant for April 2018. In the future, the data in this article may be obsolete.

<a id="Features"></a>
# Features

+ Data of this article cross platform. They are relevance for Windows, macOS and Linux users.

<a id="Sublime-Text-console"></a>
# Sublime Text console

+ [“Sublime Text is Programmable”](http://docs.sublimetext.info/en/latest/basic_concepts.html#sublime-text-is-programmable)
+ [“What is the purpose of Console in Sublime Text editor?”](https://softwareengineering.stackexchange.com/q/164225/264224)

<a id="Console-actions"></a>
## Console actions

+ `#!bash $parameter` — parameter, which you want to know.

**Example**: **if** you want to know your syntax, `#!bash $parameter` is *Syntax*; **else** theme, `#!bash $parameter` is *Theme* and so on.

1. open Sublime Text
1. open file whose `#!bash $parameter` you want to know
1. place your caret before symbol whose `#!bash $parameter` you want to know

	!!! caution
		Please, do not confuse [caret](https://www.computerhope.com/jargon/t/textcurs.htm) and [mouse pointer](https://www.computerhope.com/jargon/m/mouspoin.htm).

1. open [Sublime Text console](https://stackoverflow.com/q/13965877/5951529)
1. paste method from `#!bash $parameter` section to Sublime Text console input area → <kbd>Enter</kbd>

You should get  console output, **example**:

![Example Sublime Text console output](https://i.imgur.com/cQbwDkM.png)

<a id="How-to-get-current-…"></a>
# How to get current …

<a id="Packages-directory"></a>
## Packages directory

<a id="What-is-it"></a>
### What is it?

[Packages directory](http://docs.sublimetext.info/en/sublime-text-3/basic_concepts.html#the-packages-directory) — *Data/Packages* — path, where stored:

1. [“user packages” except “installed packages”](http://docs.sublimetext.info/en/latest/extensibility/packages.html#types-of-packages) in Sublime Text terminology
1. *User* folder, where stored [user settings](https://www.sublimetext.com/docs/3/settings.html)

<a id="What-should-you-do"></a>
### What should you do?

[Actions 1, 4, 5](#console-actions).

<a id="Method"></a>
### Method

```python
sublime.packages_path()
```

!!! note
	That get directory of [“installed packages”](http://docs.sublimetext.info/en/latest/extensibility/packages.html#types-of-packages), use this method:

	```python
	sublime.installed_packages_path()
	```

<a id="Not-recommended"></a>
### Not recommended

In some sources ([example](https://stackoverflow.com/a/19158010/5951529)) you can read similar answers:

> For Sublime 3, the locations are the following:
>
> Windows: *%APPDATA%\Sublime Text 3*,
>
> OS X: *~/Library/Application Support/Sublime Text 3*,
>
> Linux: *~/.config/sublime-text-3*.

I'm not recommend this, arguments:

1. it less simple
1. in new versions of Sublime Text and/or operating systems paths may be change
1. it [doesn't take](http://docs.sublimetext.info/en/sublime-text-3/basic_concepts.html#the-data-directory) portable Sublime Text on Windows

<a id="Syntax"></a>
## Syntax

<a id="What-is-it-1"></a>
### What is it?

+ [“Syntax” definition](https://www.computerhope.com/jargon/s/syntax.htm).

<a id="What-should-you-do-1"></a>
### What should you do?

[Actions 1, 2, 4, 5](#console-actions).

<a id="Method-1"></a>
### Method

```python
view.settings().get('syntax')
```

<a id="Theme"></a>
## Theme

<a id="What-is-it-2"></a>
### What is it?

Please, do not confuse theme and color scheme:

1. **color scheme** — file, that design your Sublime Text [syntaxes](#syntax); it zone — area of your opened files
1. **theme** — file, that design your Sublime Text UI; almost everyone else, that not highlight color scheme

In image below:

+ color scheme design area in a pink rectangle
+ theme — another area, blue rectangle

![Color scheme and theme](https://i.imgur.com/nwNgLkR.png)

!!! hint
	Also, some parameters has in [*Preferences.sublime-settings*](https://www.sublimetext.com/docs/3/settings.html) and *stTheme* files. [*stTheme*](https://stackoverflow.com/a/19582360/5951529) highlight and stylize regular expressions and another elements in input areas of your [“Find”, “Find in Files” and “Replace panels”](https://www.sublimetext.com/docs/3/themes.html#elements-panels).

	![stTheme](https://i.imgur.com/icfjatQ.png)

<a id="What-should-you-do-2"></a>
### What should you do?

[Actions 1, 2, 4, 5](#console-actions).

<a id="Method-2"></a>
### Method

```python
view.settings().get('theme')
```

<a id="Color-scheme"></a>
## Color scheme

<a id="What-is-it-3"></a>
### What is it?

+ [\#theme](#theme).

<a id="What-should-you-do-3"></a>
### What should you do?

[Actions 1, 2, 4, 5](#console-actions).

<a id="Method-3"></a>
### Method

```python
view.settings().get('color_scheme')
```

!!! hint
	You can get your another [settings](http://docs.sublimetext.info/en/latest/customization/settings.html), use `#!python view.settings().get()`. **Example**: that get your current font face, you need `#!python view.settings().get('font_face')`.

<a id="Scope"></a>
## Scope

!!! caution
	“Scope”, “syntax scope”, “syntax type scope” unconventional, not official terms. Please, read [links below](#what-is-it-4) for more detailed information.

<a id="What-is-it-4"></a>
### What is it?

[jtable]
“scope”|“syntax scope”|“syntax type scope”
source.css meta.property-list.css meta.property-name.css support.type.property-name.css |source.css|source
text.html.basic source.css meta.property-list.css meta.property-name.css |text.html.basic|text
kira.genius kira.error |kira.genius|kira
[/jtable]

+ [Scope vs. scope selector](https://forum.sublimetext.com/t/question-terminology-scope-vs-scope-selector/36039?u=sasha_chernykh)
+ [Introduction to scopes](http://blog.macromates.com/2005/introduction-to-scopes/)
+ [“Scope selector” definition](http://manual.macromates.com/en/scope_selectors.html)

<a id="What-should-you-do-4"></a>
### What should you do?

[Actions 1, 2, 3, 4, 5](#console-actions).

<a id="Method-4"></a>
### Method

```python
view.scope_name(view.sel()[0].begin())
```

<a id="Not-recommended-1"></a>
### Not recommended

In some sources ([example](https://stackoverflow.com/a/15911198/5951529)) you can read similar answers:

> Windows — <kbd>Ctrl+Alt+Shift+P</kbd>,
>
> macOS — <kbd>Ctrl+Shift+P</kbd>.

I not recommend it, arguments:

1. Hotkeys conflict; one or more your plugins may use same hotkeys.

<!-- [TODO] Hate hotkeys -->

<a id="Syntax-scope"></a>
## Syntax scope

<a id="What-is-it-5"></a>
### What is it?

Syntax scope — for [syntax](#syntax): part of any [scope](#scope-selector) before first space symbol. Details [read above](#what-is-it-4).

<a id="What-should-you-do-5"></a>
### What should you do?

[Actions 1, 2, 4, 5](#console-actions).

<a id="Method-5"></a>
### Method

```python
view.scope_name(0).split()[0]
```

<a id="External-links"></a>
# External links

+ [Sublime Text 3 API Reference](https://www.sublimetext.com/docs/3/api_reference.html)
+ [“Writing Sublime Plugins”](https://leanpub.com/writing-sublime-plugins) book
