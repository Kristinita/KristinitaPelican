Title: KristinitaLuckyLink
Date: 2018-01-09 19:27:50
Modified: 2018-01-10 21:54:12
Version: 0.1.0
Author: Sasha Chernykh
Lang: en
Summary: Sublime Text 3 package, that wrap the selected text to DuckDuckGo or Google top query URL <br><br> ![KristinitaLuckyLink](https://i.imgur.com/TuyxneV.png)
Pagetitle: KristinitaLuckyLink
Metacontent: Wrap selected text with top DuckDuckGo or Google URL
Pagecolors: kristinita-temp
Iconleftorright: right
Tags: programs, sublime-text
Category: Programs
Noco: 1g9b6
Jquery: true
Gemini: true
Jquerylazy: true
Fancybox: true
Tooltipster: true
Clipboardjs: true
Visualize: false
Opengraphimage: https://i.imgur.com/TuyxneV.png
Detailspolyfill: false

![KristinitaLuckyLink](https://i.imgur.com/TuyxneV.png)

<!-- MarkdownTOC -->

1. [Description](#description)
    1. [Reason](#reason)
    1. [Demonstration](#demonstration)
    1. [How it works](#how-it-works)
    1. [Examples](#examples)
    1. [Supported search engines](#supported-search-engines)
    1. [Features](#features)
1. [Limits](#limits)
1. [Installation](#installation)
1. [Activation](#activation)
    1. [Global Python packages](#global-python-packages)
    1. [Commands and hotkeys](#commands-and-hotkeys)
    1. [Restart](#restart)
1. [Usage](#usage)
    1. [Shortcuts](#shortcuts)
    1. [Command palette](#command-palette)
1. [Documentation](#documentation)
1. [Testing environment](#testing-environment)
1. [TODO](#todo)
1. [Known bugs and another problems](#known-bugs-and-another-problems)
    1. [KristinitaLuckyLink](#kristinitaluckylink)
    1. [External](#external)
1. [Troubleshooting](#troubleshooting)
    1. [Incorrect links](#incorrect-links)
        1. [SublimeREPL](#sublimerepl)
        1. [DuckDuckGo](#duckduckgo)
        1. [Google](#google)
1. [Contributing](#contributing)
1. [Thanks](#thanks)
1. [Terms and conditions](#terms-and-conditions)
1. [License](#license)

<!-- /MarkdownTOC -->

<a name="description"></a>
# Description

<a name="reason"></a>
## Reason

I insert to my texts links to external sites. Before using KristinitaLuckyLink, that insert link, I need to make these actions:

1. move from Sublime Text to browser,
1. write search query in search bar,
1. press <kbd>Enter</kbd>,
1. copy link,
1. move from browser to Sublime Text,
1. insert link.

It may take a lot of time. Use KristinitaLuckyLink I can make all these actions, **press one shortcut**.

<a name="demonstration"></a>
## Demonstration

<div class="SashaVideo"><iframe class="SashaLazy" data-src="https://streamable.com/s/bj22k/ykgkws"></iframe></div>

<a name="how-it-works"></a>
## How it works

Conversion examples:

+ `kristinitaluckylife` → `[kristinitaluckylife](https://www.instagram.com/kristinitaluckylife/)`,
+ `Поиск Кристиниты `→ `[Поиск Кристиниты](http://kristinita.ru/)`.

1. You select text,
1. KristinitaLuckyLink get query to search engine; query = your selected text,
1. KristinitaLuckyLink return first link from search engine SERP,
1. Your selected text wrap to Markdown link.

![KristinitaLuckyLink example](https://i.imgur.com/1KsfoM6.png)

<a name="examples"></a>
## Examples

When I write this article, I get these links, use KristinitaLuckyLink:

1. [kristinitaluckylife](https://www.instagram.com/kristinitaluckylife/),
1. [PyPI Google](https://pypi.python.org/pypi/google),
1. [Sublime Suricate](https://github.com/nsubiron/SublimeSuricate),
1. [SublimeREPL](https://github.com/wuub/SublimeREPL),
1. [PEP8](https://www.python.org/dev/peps/pep-0008/),
1. [Lintly](https://lintly.com/),
1. [keith-hall](https://github.com/keith-hall),
1. [facelessuser](https://github.com/facelessuser).

<a name="supported-search-engines"></a>
## Supported search engines

1. DuckDuckGo,
1. Google.com.

<a name="features"></a>
## Features

1. Must work with selection text, contains any UTF-8 symbols.

<a name="limits"></a>
# Limits

1. Use KristinitaLuckyLink you can get only top link of search engines. I'm sorry, if in top link not that you want.
1. I'm not affiliated with Google Search or DuckDuckGo Developers. I am not responsible for the fact that there is one or another result in the top of SERP. You can get unexpected link.

    But if in top of SERP one link, but KristinitaLuckyLink out another link, please make [these actions](#incorrect-links).

1. If you don't want by some reasons install any software from [Installation](#installation) section, please, don't install KristinitaLuckyLink.
1. Copy from [here](https://github.com/aviaryan/python-gsearch#warning): “Overusing KristinitaLuckyLink might lead to your IP being blocked by Google Search or DuckDuckGo servers. Searches through browser might still work but KristinitaLuckyLink will stop working. I recommend keeping a 5 seconds gap after each usage of this library. In most cases, much lower gaps or even continuous use of the library will still work but still this is something to be kept in mind. If you see a 'rate limit' or a 503 error, it's best to stop using the library and try back after some time (~1 minute).”
1. At the time supported:

    1. Markdown link style,
    1. English DuckDuckGo and Google search engines.

Personally I use Markdown markup for my articles and Google and DuckDuckGo enough for me. If you use another markups and/or search engines, [pull requests welcome](#contributing).

<a name="installation"></a>
# Installation

1. You need to install Python 3 with pip to your computer, if no.
1. `pip install git+https://github.com/Kristinita/python-duckduckgo` — install [DuckDuckGo module](https://github.com/crazedpsyc/python-duckduckgo), that I [ported for Python 3](https://github.com/Kristinita/python-duckduckgo).
1. `pip install google` — install [PyPI Google](https://pypi.python.org/pypi/google) module.
1. Install [Sublime Suricate](https://github.com/nsubiron/SublimeSuricate) package [via Package Control](https://stackoverflow.com/a/19598084/5951529).
1. Install KristinitaLuckyLink: <kbd>Ctrl+Shift+P</kbd> (<kbd>⌘⇧p</kbd> for Mac) → _Package Control: Add Repository_ → paste in opened input field `https://github.com/Kristinita/KristinitaLuckyLink/tree/SashaDevelop` → <kbd>Enter</kbd> → _Package Control: Install Package_ → print _KristinitaLuckyLink_ → <kbd>Enter</kbd>.

<a name="activation"></a>
# Activation

<a name="global-python-packages"></a>
## Global Python packages

[Open Sublime Text console](https://stackoverflow.com/a/15644431/5951529) → paste in opened input field this code:

```python
import sys; sys.path.append("C:\\Python36\\Lib\\site-packages")
```

Where `C:\\Python36\\Lib\\site-packages` — path to Python _site-packages_ folder. Windows users, please, note to double slashes.

That know your path, see [How installation works](https://docs.python.org/3/install/index.html#how-installation-works) item of Python documentation.

[jtable]
Platform|Default value
Unix|`/usr/local/lib/pythonX.Y/site-packages`
Windows|`C:\PythonXY\Lib\site-packages`
[/jtable]

If you ever add path to your _site-packages_ folder, you can not re-add it.

<a name="commands-and-hotkeys"></a>
## Commands and hotkeys

<kbd>Ctrl+Shift+P</kbd> (<kbd>⌘⇧p</kbd> for Mac) → _Suricate: Add Profile_ → select _KristinitaLuckyLink_ → <kbd>Enter</kbd>.

<a name="restart"></a>
## Restart

After all installation and activation actions restart Sublime Text.

KristinitaLuckyLink must successful works.

<a name="usage"></a>
# Usage

Select text, for which you want to get link...

<a name="shortcuts"></a>
## Shortcuts

... press hotkey. Wait a moment to get the result.

Default hotkeys for platforms:

[jtable]
Platform|DuckDuckGo default shortcut|Google default shortcut
Windows and Linux|<kbd>Ctrl+Shift+Alt+D</kbd>|<kbd>Ctrl+Shift+Alt+D</kbd>
macOS|<kbd>⌘⇧⌥d</kbd>|<kbd>⌘⇧⌥g</kbd>
[/jtable]

If these hotkeys used in you another packages or you don't want use default hotkeys by another reasons: _Preferences_ → _Browse packages..._ → _User_ → create a file _Default.suricate-profile_, if no, and add to them these lines:

```json
{
    "user_commands": {
        "sasha_kristinitaluckylink_duckduckgo": {
            "keys": ["super+keypad_multiply"],
            "caption": "KristinitaLuckyLink: DuckDuckGo",
            "call": "sublime.kristinita_lucky_link_duck_duck_go"
        },
        "sasha_kristinitaluckylink_google": {
            "keys": ["<c>+super+browser_home"],
            "caption": "KristinitaLuckyLink: Google",
            "call": "sublime.kristinita_lucky_link_google"
        }
    }
}
```

Replace `super+keypad8` and `<c>+super+browser_home` from example to your preferred keys. See [key name convention](http://docs.sublimetext.info/en/latest/reference/key_bindings.html#bindable-keys) in Sublime Text 3.

For detailed information about Suricate key bindings see [Sublime Suricate documentation](https://readthedocs.org/projects/sublime-suricate/).

<a name="command-palette"></a>
## Command palette

... use [command palette](https://www.youtube.com/watch?v=VYNkebGdl9Q). Wait a moment to get the result.

Captions:

+ `Suricate: KristinitaLuckyLink: DuckDuckGo`,
+ `Suricate: KristinitaLuckyLink: Google`.

![Command palette](https://i.imgur.com/SjWzTcb.png)

<a name="documentation"></a>
# Documentation

<!-- escapeall facelessuser plugin -->
_\#FuckTheDocs_

<a name="testing-environment"></a>
# Testing environment

1. Windows 10 Enterprise LTSB 64-bit EN_
1. Python 3.6.4,
1. Sublime Text Build 3143,
1. Python Google 1.9.3,
1. Python DuckDuckGo for Python 3 0.242.

KristinitaLuckyLink must be works in new versions macOS and Linux.

<a name="todo"></a>
# TODO

1. unit tests,
1. fix or replace PyPI Google module,
1. add plugin to Package Control.

<a name="known-bugs-and-another-problems"></a>
# Known bugs and another problems

<a name="kristinitaluckylink"></a>
## KristinitaLuckyLink

1. PyPI google module have many bugs. I am planning fix or replace it.

<a name="external"></a>
## External

<a name="troubleshooting"></a>
# Troubleshooting

About all detected bugs please report to [issues](https://github.com/Kristinita/KristinitaLuckyLink/issues) page. Please, add information about your operation system, Sublime Text 3 and KristinitaLuckyLink versions.

<a name="incorrect-links"></a>
## Incorrect links

If you get not top link of Google or DuckDuckGo SERP, please, make actions below.

<a name="sublimerepl"></a>
### SublimeREPL

1. Install [SublimeREPL](https://github.com/wuub/SublimeREPL) via Package Control.
1. <kbd>Ctrl+Shift+P</kbd> (<kbd>⌘⇧p</kbd> for Mac) → _SublimeREPL: Python_. Paste to opened tab code below.

<a name="duckduckgo"></a>
### DuckDuckGo

Replace `Кристина Кива` to your real selection text.

```pycon
>>> from duckduckgo import query
>>> dlink = query('! Кристина Кива').redirect.url
>>> dlink
```

If link, that you get via KristinitaLuckyLink, and this link match; it [DuckDuckGo](https://github.com/crazedpsyc/python-duckduckgo) module problem.

<a name="google"></a>
### Google

Replace `Кристина Кива` to your real selection text.

```pycon
>>> from google import search
>>> for glink in search('Кристина Кива', num=1, stop=1, pause=5.0):
>>> glink
```

Press <kbd>Enter</kbd>.

If link, that you get via KristinitaLuckyLink, and this link match; it [PyPI Google](https://pypi.python.org/pypi/google) module problem.

<a name="contributing"></a>
# Contributing

Pull requests welcome! But, please, adhere to the following rules.

1. Please, not add inside this package external modules. My code “philosophy” is that all modules must be installed separately.
1. Code must match [PEP8](https://www.python.org/dev/peps/pep-0008/) rules. Max line length — 120 symbols. Desirable, 100% for [Lintly](https://lintly.com/).

<a name="thanks"></a>
# Thanks

+ [keith-hall](https://github.com/keith-hall),
+ [facelessuser](https://github.com/facelessuser).

<a name="terms-and-conditions"></a>
# Terms and conditions

By using this package, you agree that the author won't be responsible for any damage that comes to you and/or your property. You hereby agree to take all responsibilities for using this package. The author is merely a developer who created this package but you are the one who is using it.

<a name="license"></a>
# License

+ [MIT](https://github.com/Kristinita/KristinitaLuckyLink/blob/SashaDevelop/License.md).