Title: Sasha Goddess
Date: 2017-07-13 23:51:25
Modified: 2018-01-07 13:37:00
Version: 1.0.0-beta
Author: Sasha Chernykh
Lang: ru
Summary: Test
Pagetitle: Sasha Goddess
Metacontent: Test
Pagecolors: sublime-text
Iconleftorright: right
Tags: Test
Category: Test
Noco:
Jquery: true
Gemini: true
Jquerylazy: true
Fancybox: true
Tooltipster: true
Clipboardjs: true
Opengraphimage:
Detailspolyfill: false
Customjs: false
Customcss: false

<!-- MarkdownTOC -->

1. [Simple test](#simple-test)
1. [Code test](#code-test)

<!-- /MarkdownTOC -->

<a name="simple-test"></a>
# Simple test

```python
from Sasha import Goddess
```

<a name="code-test"></a>
# Code test

```python hl_lines="1 4 18"
import logbook
import sys

log = logbook.Logger("Sasha Logbook")


def clize_log_level(*, logbook_level: 'll'="NOTICE"):
    """Change log levels via command line.

    User select, which logging messages to see. See about 6 log levels here:
    https://logbook.readthedocs.io/en/stable/quickstart.html

    :param logbook_level: user select logging level
    """
    if logbook_level == "DEBUG":
        logbook.StreamHandler(sys.stdout,
                              level=logbook.DEBUG).push_application()
    elif logbook_level == "ERROR":
        logbook.StreamHandler(sys.stdout,
                              level=logbook.ERROR).push_application()
    else:
        logbook.StreamHandler(sys.stdout,
                              level=logbook.NOTICE).push_application()

```


