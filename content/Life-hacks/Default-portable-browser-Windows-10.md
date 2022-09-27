Title: Портативный браузер по умолчанию в Windows 10
Author: Sasha Chernykh
Date: 2017-03-15 0:11:14
Modified: 2022-09-08 20:42:19
Version: 0.1.0
Lang: ru
Summary: Description, how to make Pale Moon default browser in Windows
Pagetitle: Установка портативной версии Pale Moon в качестве браузера по умолчанию в Windows 10
Pagecolors: it-articles
Asideimage: SashaGreenSweater
Iconleftorright: left
Tags: it-articles, windows-settings, portable-browsers, pale-moon
Noco: 1vWK5
Og_image: https://i.imgur.com/DjwBc2Q.png
Schemaorgtype: HowTo

!!! note "Возможно устаревшие данные"
    Автор этой статьи перешёл с Pale Moon на Firefox спустя некоторое время после появления [Firefox Quantum](https://blog.mozilla.org/en/mozilla/introducing-firefox-quantum/), чтобы иметь доступ к новым возможностям Firefox. См. [критику Pale Moon](https://www.howtogeek.com/335712/update-why-you-shouldnt-use-waterfox-pale-moon-or-basilisk/).

    я не знаю, работает ли ещё метод, о котором поведано в данном туториале.

    6 июня 2021

<!-- MarkdownTOC -->

1. [Почему портативный браузер?](#Почему-портативный-браузер)
1. [Почему Pale Moon?](#Почему-Pale-Moon)
1. [Установка Pale Moon браузером по умолчанию обычными методами](#Установка-Pale-Moon-браузером-по-умолчанию-обычными-методами)
1. [Решение](#Решение)

<!-- /MarkdownTOC -->

<a id="Почему-портативный-браузер"></a>
# Почему портативный браузер?

Всё нижеперечисленное можно отнести к достоинствам любых других [портативных программ](http://computerstory.ru/?p=3524), не только браузеров.

1. Настройки браузера: профили, расширения, скрипты, стили и т. д. не слетают без всяких дополнительных действий со стороны пользователя при следующих обстоятельствах:

	+ Если предстоит переустановка — число каковых на моём веку перевалило за десяток — операционной системы.
	+ Когда вы на некоторое время оказались отлучённым от компьютера, которым обычно пользуетесь. Запустив Pale Moon Portable (далее также просто *Pale Moon*, *PM*) на чужом компьютере c внешнего съёмного носителя, окажетесь в родной среде, со всеми настройками, которые у вас присутствовали. Портативный браузер можно установить с флэшки, внешнего жёсткого диска, как который допустимо использовать и диск с интерфейсом SATA, подключив его к док-станции.

1. При пользовании другим компьютером или замене жёсткого диска, чтобы продолжить работу в PM со всеми накопленными настройками достаточно перенести в новое место только папку, куда установлен этот браузер, — и не придётся ничего копировать с локального диска <dfn>С</dfn>, переживая, как что-то пойдёт не так. А после переустановки ОС будет достаточно запустить свой портативный браузер, прежде настроенный под ваши предпочтения, не предпринимая иных действий.

	Существуют отдельные средства для экспорта/импорта паролей, закладок, однако:

	+ лично у меня они, бывало, отказывали, когда возникала в них острая необходимость,
	+ восстанавливают не всё-всё, как было,
	+ перенос отнимает время.

	В силу причин <dfn>а</dfn> и <dfn>в</dfn> я вообще стараюсь не использовать программы, сохраняющие какие-либо пользовательские данные на системном диске.

1. Чтобы просмотреть созданные файлы Pale Moon и/или изменить их через проводник Windows либо файловый менеджер, в инсталлированной версии браузера придётся переходить по пути <dfn>C:\\Users\\SashaGoddess\\AppData\\Roaming\\Moonchild Productions\\Pale Moon</dfn>, используя переносимую — <dfn>E:\\Pale Moon</dfn>. Лично для меня второй вариант много удобнее.

1. Дополнительное подспорье к безопасности ваших данных. Известные мне [стилеры](http://tophope.ru/threads/%D0%A7%D1%82%D0%BE-%D1%82%D0%B0%D0%BA%D0%BE%D0%B5-%D1%81%D1%82%D0%B8%D0%BB%D0%B5%D1%80-%D1%81%D1%82%D0%B8%D0%BB%D0%BB%D0%B5%D1%80-stealer-%D0%B8-%D0%B1%D0%BE%D1%80%D1%8C%D0%B1%D0%B0-%D1%81-%D0%BD%D0%B8%D0%BC.1965/), в том числе встроенные в «[ратники](http://www.spy-soft.net/chto-takoe-rat/)», не воруют пароли из portable программ.

<a id="Почему-Pale-Moon"></a>
# Почему Pale Moon?

Pale Moon я рассматриваю как оптимизированную под низкое — по личному опыту, меньшее, нежели у Firefox, Chrome, Opera, Avant, Maxthon и SeaMonkey — потребление оперативной памяти версию Firefox — наиболее функционального на мой взгляд браузера. Аддоны для Mozilla поддерживаются Pale Moon.

<a id="Установка-Pale-Moon-браузером-по-умолчанию-обычными-методами"></a>
# Установка Pale Moon браузером по умолчанию обычными методами

![Alt attribute fish](https://i.imgur.com/gQywm8B.png)

Не помогает. В «Выборе программ по умолчанию», «Приложениях по умолчанию» и «Настройке доступа программ и параметров компьютера по умолчанию» Pale Moon Portable нет.

![Alt attribute fish](https://i.imgur.com/HCIt8xR.png)
![Alt attribute fish](https://i.imgur.com/l9HgjBJ.png)
![Alt attribute fish](https://i.imgur.com/LNFEjsi.png)

Связать протоколы с Pale Moon также не получается:

![Alt attribute fish](https://i.imgur.com/UiS638u.png)

<a id="Решение"></a>
# Решение

Устанавливаем [Firefox Portable](http://portableapps.com/apps/internet/firefox_portable), [делаем Firefox браузером по умолчанию](https://support.mozilla.org/ru/kb/kak-sdelat-firefox-brauzerom-po-umolchaniyu), — в отличие от Pale Moon «огнелис» становится браузером по умолчанию без особых проблем.

Правой кнопкой мыши по окошку меню «Пуск» → *Выполнить* → *regedit.exe* → проходим по реестру дважды до *command*:

```text
HKEY_CLASSES_ROOT
├───FirefoxHTML
│ └───shell
│ └───open
│ └───command
└───FirefoxURL
└───shell
└───open
└───command
```

Т. е. *HKEY\_CLASSES\_ROOT* → *FirefoxHTML* → *shell* → *open* → *command* . Заменяем путь к Firefox на путь к Pale Moon Portable: правой кнопкой мыши на «По умолчанию» → *Изменить*.

![Alt attribute fish](https://i.imgur.com/qKogH11.png)

Например, у меня:

+ Было: "*E:\\FirefoxPortable\\App\\Firefox\\firefox.exe" -osint -url "%1"*
+ Стало: "*E:\\Pale Moon\\Palemoon-Portable.exe" -osint -url "%1*"

Далее там же в реестре *HKEY\_CLASSES\_ROOT* → *FirefoxURL* → *shell* → *open* → *command* . Снова вместо пути к Firefox указываем путь к PM.

Пробуем открыть гиперссылку при работе в какой-нибудь программе, например, почтовой, → в диалоговом окне выбираем *Palemoon-Portable*, дополнительно поставив галочку напротив *Всегда использовать это приложение*:

![Alt attribute fish](https://i.imgur.com/mcGNijr.png)

Отныне ссылки, кликнутые в любой программе, будут открываться браузером Pale Moon Portable. При открытии файлов с расширениями *html*, *htm*, *xhtml* в появившемся диалоговом окне выбираем *Palemoon-Portable.exe*, помня о галочке.

![Alt attribute fish](https://i.imgur.com/DjwBc2Q.png)

Pale Moon Portable установлен браузером по умолчанию.
