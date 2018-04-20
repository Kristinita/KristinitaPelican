Title: Sacagawea
Version: 0.1.0
Author: Keith Hall
Lang: ru
Summary: Timer for Russian gingerinas.
Pagetitle: Sacagawea
Metacontent: Таймер для джинджерин “Что? Где? Когда?”, “Брейн Ринг”
Pagecolors: programs
Asideimage: SashaChocolate
Titleimage: true
Titleimagename: NatalyaMindGames
Epigraph: true
Epigraphtext: Посвящено <a href="https://vk.com/id152198389">Наталье Степуриной (Шмелёвой)</a>, <br>никогда не оставлявшую меня в трудную минуту. <br>Названо в честь <a href="http://www.history.com/topics/native-american-history/sacagawea">Её игрового никнейма</a>.
Iconleftorright: right
Tags: sublime-text, gingerinas, what-where-when
Category: Programs
Noco: 1g9b6
Stylesheets: personal/
Javascripts: personal/
Tooltipster: true
Clipboardjs: true
OpenGraphImage: https://i.imgur.com/cVITpm1.jpg

`“What? Where? When?” has great popularity in the Russian language, not English, so the description of the package in Russian.`

<!-- MarkdownTOC -->

1. [Краткое описание](#Краткое-описание)
1. [Мотивация](#Мотивация)
1. [Ограничения к использованию](#Ограничения-к-использованию)
1. [Заявленное поведение](#Заявленное-поведение)
	1. [Без использования third-party программ](#Без-использования-third-party-программ)
		1. [Режим Блиц/Суперблиц/Брейн Ринг](#Режим-БлицСуперблицБрейн-Ринг)
		1. [60-секундный режим](#60-секундный-режим)
	1. [C использованием сторонних программ](#c-использованием-сторонних-программ)
		1. [Windows](#windows)
1. [Установка и настройка](#Установка-и-настройка)
	1. [Установка](#Установка)
		1. [Обязательно](#Обязательно)
		1. [Опционально](#Опционально)
	1. [Настройка](#Настройка)
		1. [Активация шорткатов](#Активация-шорткатов)
		1. [AutoHotkey](#autohotkey)
		1. [nnCron](#nncron)
1. [Опции](#Опции)
1. [Известные проблемы](#Известные-проблемы)
	1. [Sacagawea](#sacagawea)
	1. [Зависимости](#Зависимости)
1. [Примечания](#Примечания)
1. [Программное обеспечение при тестировании](#Программное-обеспечение-при-тестировании)
1. [TODO](#todo)
1. [Разработка](#Разработка)
1. [Благодарности](#Благодарности)
1. [Лицензии](#Лицензии)

<!-- /MarkdownTOC -->

<a id="Краткое-описание"></a>
# Краткое описание

Пакет для [Sublime Text 3](https://www.sublimetext.com/3) — countdown timer для «Что? Где? Когда?».

<a id="Мотивация"></a>
# Мотивация

По интернету смотрю записи игр «Что? Где? Когда?». Стараюсь находиться в таких же условиях, что и знатоки, — это касается и времени, отведённому на раздумывание. Среди готовых программ мне не удалось найти таймера, симулирующего поведение таймера телевизионных версий «Что? Где? Когда?» и отвечающего следующим условиям:

1. Тренирующемуся игроку перед компьютером (далее по тексту *игрок*) требуется нажать один раз одно сочетание клавиш → можно сосредоточиться на обдумывании вопроса.
1. Проигрывается звук за 10 секунд до окончания обдумывания.
1. Не нужно ничего перенастраивать, если обдумываешь блиц/суперблиц. Нажал другое сочетание клавиш → у тебя 20, а не 60 секунд на обдумывание.

Поэтому решил написать таймер сам.

<a id="Ограничения-к-использованию"></a>
# Ограничения к использованию

1. Пакет должен корректно работать в Windows не раньше Windows XP, macOS и *nix-подобных операционных системах.
1. Если не хотите производить действия, описанные в разделах [«Установка»](#Установка) и [«Настройка»](#Настройка), пожалуйста, не пользуйтесь таймером. я ненавижу писать самостоятельно то, что уже качественно написано до меня.

На установку и настройку должно уйти не более нескольких минут.

<a id="Заявленное-поведение"></a>
# Заявленное поведение

<a id="Без-использования-third-party-программ"></a>
## Без использования third-party программ

Sacagawea можно использовать, например, ведущему, если игра проходит оффлайн.

<a id="Режим-БлицСуперблицБрейн-Ринг"></a>
### Режим Блиц/Суперблиц/Брейн Ринг

В активном окне Sublime Text 3: игрок нажимает <kbd>Ctrl+Alt+Context_Menu</kbd> — или (зная о [fuzzy-поиске](https://umaar.com/dev-tips/36-sublime-fuzzy-search/)) набирает в [command palette](https://www.youtube.com/watch?v=QDajzykRdn0) *Suricate: Sacagawea: Blitz/Supeblitz/Brain Ring* → раздаётся звук + открывается вкладка, где 20 секунд происходит обратный отсчёт времени, → за 10 секунд до окончания отсчёта раздаётся другой звук → спустя ещё 10 секунд таймер доходит до нуля + раздаётся третий звук + вкладка с таймером закрывается.

<div class="SashaVideo"><iframe class="SashaLazy" data-src="https://streamable.com/s/vsowo/uemzak"></iframe></div>

При записи видео с экрана использовались следующие приложения:

+ [MarkdownEditing](https://packagecontrol.io/packages/MarkdownEditing) — цветовая схема для вкладки,
+ [SashaSublime](https://packagecontrol.io/packages/SashaSublime) — тема для Sublime Text,
+ [LastModifiedIndicator](https://packagecontrol.io/packages/LastModifiedIndicator) — отображает прямоугольники в [gutter](https://ru.stackoverflow.com/posts/comments/901650),
+ [KeypressOSD](https://autohotkey.com/boards/viewtopic.php?t=225) — отображает на экране нажатые клавиши.

<a id="60-секундный-режим"></a>
### 60-секундный режим

В активном окне Sublime Text 3: игрок нажимает <kbd>Ctrl+Context_Menu</kbd> — или (зная о [fuzzy-поиске](https://umaar.com/dev-tips/36-sublime-fuzzy-search/)) набирает в [command palette](https://www.youtube.com/watch?v=QDajzykRdn0) *Suricate: Sacagawea: “What? Where? When?”* → раздаётся звук + открывается вкладка, где 60 секунд происходит обратный отсчёт времени → за 10 секунд до окончания отсчёта раздаётся другой звук → спустя ещё 10 секунд таймер доходит до нуля + раздаётся третий звук + вкладка с таймером закрывается.

<a id="c-использованием-сторонних-программ"></a>
## C использованием сторонних программ

Если игрок смотрит запись телепередач, использование Sacagawea без third-party программ неудобно, поскольку приходится переключаться между окнами браузера (или другой программы, где воспроизводится видео) и Sublime Text. К сожалению, вызвать команды Sublime Text, когда окно Sublime Text не находится в активном фокусе [проблематично](https://forum.sublimetext.com/t/question-is-it-possible-to-use-sublime-text-hotkey-as-global-system-hotkey/27885/2?u=sasha_chernykh), без сторонних программ.

<a id="windows"></a>
### Windows

Прозвучал вопрос → ведущий ТВ-передачи даёт сигнал к началу отсчёта — например, говорит «Время», — игрок нажимает <kbd>Ctrl+Alt+Context_Menu</kbd> ([местонахождение клавиши Context_Menu](https://en.wikipedia.org/wiki/Menu_key)) → запускается скрипт.

Скрипт автоматически выполняет следующие действия: нажимается пробел — клавишей <kbd>Space</kbd> в web-плейерах, которые знаю, останавливается воспроизведение видео, → <kbd>Alt+Tab</kbd> — [переключение между приложениями](https://support.microsoft.com/ru-ru/help/79869/pressing-alt-tab-to-switch-between-applications), — в Sublime Text запускается процесс, [описанный в разделе «Заявленное поведение»](#Заявленное-поведение), → вновь <kbd>Alt+Tab</kbd> → происходит возвращение во вкладку браузера со «Что? Где? Когда?».

<div class="SashaVideo"><iframe class="SashaLazy" data-src="https://streamable.com/s/jbvny/mqofcq"></iframe></div>

При записи видео с экрана помимо [вышеупомянутых](#Режим-БлицСуперблицБрейн-Ринг) использовались следующие приложения:

+ [TabCinema](https://addons.mozilla.org/en-us/firefox/addon/tabcinema/) — дополнение для Firefox, разворачивающее видео в размеры окна, не экрана;
+ [AutoHotkey](#autohotkey);
+ [nnCron](#nncron).

<a id="Установка-и-настройка"></a>
# Установка и настройка

<a id="Установка"></a>
## Установка

<a id="Обязательно"></a>
### Обязательно

<!-- See 7 item of Nested Fence Format: https://facelessuser.github.io/pymdown-extensions/extensions/superfences/#nested-fence-format -->

1. [Sublime Text 3](http://www.sublimetext.com/3), если ещё не установлен.

1. Кроссплатформенный CLI-плейер [mpg123](http://mpg123.de/). Для пользователей Windows рекомендовал бы [установить Chocolatey](https://lifehacker.ru/2015/01/08/chocolatey/), если ещё не установлен, → [наберите в терминале](https://chocolatey.org/packages/mpg123/1.24.0):

	```python
	choco install mpg123 -y
	```

	Установка стороннего плейера необходима, поскольку встроенные средства для воспроизведения аудио для Python, на котором написана Sacagawea, — [ossaudiodev](https://docs.python.org/3/library/ossaudiodev.html) и [winsound](https://docs.python.org/3/library/winsound.html) — [не кроссплатформенные](http://stackoverflow.com/a/34179010/5951529) → придётся всё равно что-то дополнительно устанавливать.

1. [Пакет для Sublime Text](https://www.youtube.com/watch?v=lx9nIHABnmY) [FileCommands](https://packagecontrol.io/packages/FileCommands) — нужен, чтобы принудительно закрыть вкладку с таймером.

1. Пакет [Sublime Suricate](https://github.com/nsubiron/SublimeSuricate) — чтобы активировать горячие клавиши. [Аргументы](https://github.com/r-stein/sublime-text-keybinding-helper/issues/2#issue-198411616), почему стоит использовать его, а не встроенный функционал Sublime Text.

1. [Установите](http://www.macdrifter.com/2012/08/install-sublime-packages-from-github.html) пакет Sacagawea.

<a id="Опционально"></a>
### Опционально

1. Пакет [Preferences Editor](https://packagecontrol.io/packages/Preferences%20Editor) — если пожелаете использовать звуки, отличные от звуков по умолчанию.
1. [AutoHotkey](https://www.autohotkey.com/), [Sublime AutoHotkey](https://github.com/ahkscript/SublimeAutoHotkey), [nnCron](http://nncron.ru/) — для пользователей Windows и Firefox, [см.](#autohotkey) [ниже](#nncron).

<a id="Настройка"></a>
## Настройка

После установки.

<a id="Активация-шорткатов"></a>
### Активация шорткатов

В активном окне Sublime Text: <kbd>Ctrl+Shift+P</kbd> (<kbd>⌘⇧p</kbd> для Mac) → *Suricate: Add Profile* → <kbd>Enter</kbd> → [Sacagawea](https://i.imgur.com/VNC1Kzs.png) → <kbd>Enter</kbd>.

![Sacagawea](https://i.imgur.com/UdMhDrL.png)

→ горячие клавиши активированы.

Если данные хоткеи задействованы в других Ваших плагинах или программах, можете их деактивировать. В активном окне Sublime Text: <kbd>Ctrl+Shift+P</kbd> (<kbd>⌘⇧p</kbd> для Mac) → *Suricate: Add Profile* → <kbd>Enter</kbd> → [Sacagawea](https://i.imgur.com/VNC1Kzs.png) → <kbd>Enter</kbd>.

<a id="autohotkey"></a>
### AutoHotkey

Создайте и сохраните 2 файла: *Sacagawea-CHGK.ahk* и *Sacagawea-Blitz.ahk*.

*Sacagawea-CHGK.ahk*:

```autohotkey
WinActivate, Mozilla Firefox ahk_class MozillaWindowClass
Sleep, 300
Send, {Space}
Sleep, 300
Send, {LAlt Down}
Sleep, 300
Send, {Tab}
Sleep, 300
Send, {LAlt Up}
Sleep, 1000
WinActivate, Sublime Text ahk_class PX_WINDOW_CLASS
Send, {LControl Down}
Sleep, 300
Send, {LShift Down}
Sleep, 300
Send, {p}
Sleep, 300
Send, {LShift Up}
Sleep, 300
Send, {LControl Up}
Sleep, 300
Send, Suricate: Sacagawea: “What? Where? When?”
Sleep, 300
Send, {Enter}
Sleep, 300
Send, {LAlt Down}
Sleep, 300
Send, {Tab}
Sleep, 300
Send, {LAlt Up}
Sleep, 300
ExitApp
```

*Sacagawea-Blitz.ahk*:

```autohotkey
WinActivate, Mozilla Firefox ahk_class MozillaWindowClass
Sleep, 300
Send, {Space}
Sleep, 300
Send, {LAlt Down}
Sleep, 300
Send, {Tab}
Sleep, 300
Send, {LAlt Up}
Sleep, 1000
WinActivate, Sublime Text ahk_class PX_WINDOW_CLASS
Send, {LControl Down}
Sleep, 300
Send, {LShift Down}
Sleep, 300
Send, {p}
Sleep, 300
Send, {LShift Up}
Sleep, 300
Send, {LControl Up}
Sleep, 300
Send, Suricate: Sacagawea: Blitz/Superblitz/Brain Ring
Sleep, 300
Send, {Enter}
Sleep, 300
Send, {LAlt Down}
Sleep, 300
Send, {Tab}
Sleep, 300
Send, {LAlt Up}
Sleep, 300
ExitApp
#esc::ExitApp
```

[Скомпилируйте оба файла](http://windata.ru/windows-world/utility/zapusk-skriptov-autohotkey-ot-imeni-administratora/) — это можно сделать [в Sublime Text 3](https://github.com/ahkscript/SublimeAutoHotkey/blob/master/Default.sublime-commands#L6-L9), если использовать пакет [Sublime AutoHotkey](https://github.com/ahkscript/SublimeAutoHotkey).

<a id="nncron"></a>
### nnCron

[Добавьте в кронтаб](http://www.nncron.ru/help/RU/working/task/starting_task.htm) следующие строки:

```python
#( Sacagawea-CHGK
WatchHotKey: "^{APP}"
Action:
StartIn: "D:\AutoHotkey"
START-APP: D:\AutoHotkey\Sacagawea-CHGK.exe
)#

#( Sacagawea-Blitz
WatchHotKey: "^@{APP}"
Action:
StartIn: "D:\AutoHotkey"
START-APP: D:\AutoHotkey\Sacapawea-Blitz.exe
)#
```

Где:

+ *D:\AutoHotkey\Sacagawea-CHGK.exe* и *D:\AutoHotkey\Sacagawea-Blitz.exe* — пути к скомпилированным файлам *Sacagawea-CHGK.ahk* и *Sacagawea-Blitz.ahk* соответственно,
+ *D:\AutoHotkey* — папка, в которой содержатся скомпилированные файлы из предыдущего пункта списка,
+ `^@{APP}` и `^{APP}` — [горячие клавиши nnCron](http://www.nncron.ru/help/RU/add_info/keys_mnemonics.htm): <kbd>Ctrl+Context_Menu</kbd> и <kbd>Ctrl+Alt+Context_Menu</kbd> соответственно.

<a id="Опции"></a>
# Опции

1. Вы [можете использовать звуки](https://github.com/Kristinita/Sacagawea/blob/SashaDevelop/Sacagawea.sublime-settings), отличные от звуков по умолчанию.

<a id="Известные-проблемы"></a>
# Известные проблемы

<a id="sacagawea"></a>
## Sacagawea

<a id="Зависимости"></a>
## Зависимости

1. По состоянию на май 2017 Package Control [не поддерживает](https://forum.sublimetext.com/t/question-how-install-package-control-package-as-dependency/28083/4?u=sasha_chernykh) автоматическую установку зависимых пакетов. Было бы неплохо, если больше людей напишут [в этой теме](https://github.com/wbond/package_control/issues/1089), что им нужен данный функционал, или хотя бы оставят комментарий вроде *+1*, дабы повысились шансы, что разработчики займутся проблемой.

<a id="Примечания"></a>
# Примечания

1. Сочетания <kbd>Ctrl+Context_Menu</kbd> и <kbd>Ctrl+Alt+Context_Menu</kbd> выбраны по следующим причинам:

	1. находятся близко к середине клавиатуры, что удобно для правшей и левшей;
	1. доступны для нажатия одной рукой, тогда как другая записывает вопрос;
	1. если Вы используете другие пакеты для Sublime Text, эти другие пакеты занимают наиболее распространённые сочетания клавиш → возникают конфликты шорткатов.

	я использую/использовал более 400 пакетов → в кеймапе ни одного из них не была задействована клавиша <kbd>Context_Menu</kbd>.

	Если:

	+ Вас не устраивают данные сочетания,

	или:

	+ на Вашей клавиатуре нет клавиши <kbd>Context_Menu</kbd>,

	см. [инструкцию](http://brendankemp.com/essays/how-to-add-a-shortcut-for-any-command-in-sublime-text/), как в Sublime Text задавать собственные сочетания горячих клавиш.

<a id="Программное-обеспечение-при-тестировании"></a>
# Программное обеспечение при тестировании

+ Windows 10 Enterprise LTSB 64-bit EN,
+ Sublime Text 3 Build 3126,
+ mpg123 1.24.0.

<a id="todo"></a>
# TODO

1. Unit-тесты?

<a id="Разработка"></a>
# Разработка

1. Приветствуются любые конструктивные добавления, исправления ошибок и рефакторинг. При этом:

	1. Python-код [должен соответствовать](https://github.com/Kristinita/Sacagawea/blob/SashaDevelop/.travis.yml) [flake8](https://pypi.python.org/pypi/flake8) и [pydocstyle](http://www.pydocstyle.org/). Это необходимо для поддержания качества кода.
	1. я считаю неконструктивным писать то, что уже качественно написано другими. Пожалуйста, не встраивайте прямо в пакет возможности, которые есть и хорошо работают в сторонних приложениях.

<a id="Благодарности"></a>
# Благодарности

+ [@keith-hall](https://github.com/keith-hall)

<a id="Лицензии"></a>
# Лицензии

1. [правила использования звуков](https://www.soundjay.com/tos.html),
1. [лицензия на Sacagawea — MIT](https://github.com/Kristinita/Sacagawea/blob/SashaDevelop/License.md).
