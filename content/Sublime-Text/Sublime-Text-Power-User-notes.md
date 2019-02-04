Title: Sublime-Text-Power-User-notes
Date: 2017-02-13 19:15:15
Author: Sasha Chernykh
Lang: en
Summary: Notes of book “Sublime Text Power User”
Pagetitle: “Sublime Text Power User” notes
Pagecolors: programs
Asideimage: SashaChocolate
Iconleftorright: right
Tags: sublime-text
Tooltipster: false
ClipboardJs: true
Noco: 1EBY
Og_image: https://i.imgur.com/K3YqJ4S.png
Schemaorgtype: Review

<!-- MarkdownTOC -->

1. [Preamble](#preamble)
	1. [13](#13)
	1. [14](#14)
	1. [16](#16)
	1. [45](#45)
	1. [50](#50)
	1. [52](#52)
	1. [68](#68)
	1. [77](#77)
	1. [80](#80)
	1. [84](#84)
	1. [92](#92)
	1. [94](#94)
	1. [94](#94-1)
	1. [95](#95)
	1. [95](#95-1)
	1. [96](#96)
	1. [103](#103)
	1. [104](#104)
	1. [108](#108)
	1. [128](#128)
	1. [142](#142)
	1. [143](#143)
	1. [154](#154)
	1. [155](#155)
	1. [158](#158)
	1. [161](#161)
	1. [165](#165)
	1. [175](#175)
	1. [176](#176)
	1. [180](#180)
	1. [180](#180-1)
	1. [183](#183)
	1. [189](#189)
	1. [197](#197)
	1. [198](#198)
	1. [200](#200)
	1. [201](#201)

<!-- /MarkdownTOC -->

<a id="preamble"></a>
# Preamble

All comments on [this](http://jmp.sh/xasKD18) ([alternate link](https://docs.zoho.com/file/nqgo4e3473558e032489e9dc3bceb3db16723)) version of the book «Sublime Text Power User», bold numbers — numbers of pages your book. I admit that many of my notes are not your mistakes and typos, and I do not understand something, or affect my poor knowledge of the English language, but I beg to review my notes. Please ask me for clarification if you do not understand the phrase in my bad English. I use Windows 10 Education, Sublime Text 3 Build 3114 and all my notes belong to Windows.

Many thanks for your huge work on writing of the book! Sincerely, [leader in Sublime Text tag rating on Russian Stack Overflow](http://ru.stackoverflow.com/tags/sublime-text/topusers), Sasha Chernykh.

<a id="13"></a>
## 13

I think we can talk about the final transition from Sublime Text 2 to 3.

<a id="14"></a>
## 14

> 1. Open the console by hitting the key combination <kbd>Ctrl + \\</kbd>

Now by default <kbd>Ctrl+`</kbd>.

<a id="16"></a>
## 16

![Alt attribute fish](https://i.imgur.com/62uCZBa.png)

If to use Portable version, it isn't necessary to specify <dfn>%APPDATA%</dfn> .

<a id="45"></a>
## 45

On [https://johnblackbourn.com/sublimecodeintel-st3](https://johnblackbourn.com/sublimecodeintel-st3) page now [reccomend](https://github.com/spectacles/CodeComplice) CodeComplice use, but for me CodeComplice is some bugs and undesirable behavior, [example](https://github.com/spectacles/CodeComplice/issues/51).

<a id="50"></a>
## 50

<dfn>-(std in)</dfn> only for OSX users, see [unofficial documentation](http://docs.sublimetext.info/en/latest/command_line/command_line.html#invocations), but in the book of it it isn't specified.

<a id="52"></a>
## 52

> <dfn>-a</dfn>or <dfn>--add</dfn>: Add the current file or folder to the active/last used sublime text window

This command is only for folders, but not for files, see [unofficial documentation](http://docs.sublimetext.info/en/latest/command_line/command_line.html#options) . <dfn>subl -a ExampleFolder</dfn> add folder <dfn>ExampleFolder</dfn> in current window, <dfn>subl ExampleFolder</dfn> in new window. But <dfn>subl -a test.txt</dfn> = <dfn>subl test.txt</dfn>, both of these commands open a test.txt file in a new tab of the active window. The example below is also incorrect.

<a id="68"></a>
## 68

This method does not work for me. It is necessary, or hold down the middle mouse button or <kbd>Ctrl+Alt+↓/↑</kbd> . See [forum thread](https://forum.sublimetext.com/t/solved-how-to-quick-select-in-every-line-between-first-and-last-for-me/21688).

<a id="77"></a>
## 77

> go to <kbd>Tools</kbd>—►<kbd>New snippet ...</kbd>

In the <kbd>Tools</kbd> menu there is no point <kbd>New snippet ...</kbd> .

![Alt attribute fish](https://i.imgur.com/K3YqJ4S.png)

<a id="80"></a>
## 80

> If you are having trouble finding the scope, an easy way to find it is to open your packages folder <kbd>Preferences</kbd>→<kbd>Browse Packages...</kbd>and find the folder associated with your language. Inside of that folder will be a <dfn>.tmLanguage</dfn>file.

1. Now use [sublime-syntax](https://www.sublimetext.com/docs/3/syntax.html) files.
1. Not all folders programming languages can be found on the path
 <kbd>Preferences</kbd> → <kbd>Browse Packages...</kbd> .

<a id="84"></a>
## 84

Now <kbd>Ctrl+G</kbd> is <dfn>Goto Line...</dfn> .

<a id="92"></a>
## 92

Empty section «Moving Lines and Code Blocks»

![Alt attribute fish](https://i.imgur.com/x1tF1mG.png)

<a id="94"></a>
## 94

> Using <kbd>Ctrl+K</kbd>without the shift key will delete from the caret to the end of the current line.

Using <kbd>Ctrl+K, Ctrl+K</kbd> .

<a id="94-1"></a>
## 94

On Windows forward delete words-by-words is <kbd>Ctrl+Delete</kbd> .

<a id="95"></a>
## 95

> Just press space and keep typing!

If you only press the spacebar, <dfn>p</dfn> tag was removed.

<a id="95-1"></a>
## 95

<kbd>Ctrl+↑/↓</kbd> on Windows is jump to the beginning/end of word, not line.

![Alt attribute fish](https://i.imgur.com/u3zjnlJ.png)

<a id="96"></a>
## 96

All hotkeys in this image is not work for me.

![Alt attribute fish](https://i.imgur.com/li2YjO9.png)

<a id="103"></a>
## 103

> (Windows users use <kbd>Ctrl+Shift</kbd>)

Windows users use <kbd>Ctrl+Shift+[</kbd> .

<a id="104"></a>
## 104

> The keyboard shortcut for this is a little different. We need to hold down (<kbd>Ctrl</kbd>on Windows/Linux) and then tap <kbd>K</kbd>.
Not working on Windows.

<a id="108"></a>
## 108

![Alt attribute fish](https://i.imgur.com/nlEMn8q.png)

I think that once you have a slash at the beginning. Not <dfn>"path": "/Volumes/Macintosh HD/wesbos/Dropbox/0185-book"</dfn>, correct is <dfn>"path": "Volumes/Macintosh HD/wesbos/Dropbox/0185-book"</dfn> . For example, I have <dfn>User</dfn> folder, when is situated my <dfn>sublime-project</dfn> file and folder <dfn>Dictionary</dfn> . If I want to specify the path to the folder <dfn>Dictionary</dfn>, I must point <dfn>"Dictionaries"</dfn> or <dfn>"./Dictionaries"</dfn> or <dfn>"../User/Dictionaries"</dfn>, But I do not understand how to specify the relative path with a slash at the beginning of.

<a id="128"></a>
## 128

Incorrect example, see [forum thread](https://forum.sublimetext.com/t/not-automatic-change-of-build-system/21745) .

<a id="142"></a>
## 142

Sublimerge 3 — paid plugin, I believe that it is necessary to specify in the book.

<a id="143"></a>
## 143

![Alt attribute fish](https://i.imgur.com/1Vfnz56.png)

Hotkeys not work for me.

<a id="154"></a>
## 154

Not <dfn>c#badda55.3</dfn>, correct is <dfn>c#badda5.3</dfn> . Emmet still indicate the right color, but in my opinion, do not result in the book of incorrect examples.

<a id="155"></a>
## 155

Now <kbd>Ctrl+Shift+G</kbd>, not <kbd>Ctrl+W</kbd> by default.

<a id="158"></a>
## 158

Now <kbd>Ctrl+'</kbd>, not <kbd>Ctrl+Shift+D</kbd> by default.

<a id="161"></a>
## 161

Now <kbd>Ctrl+Alt+J</kbd>, not <kbd>Ctrl+Shift+T</kbd> by default.

<a id="165"></a>
## 165

Now <kbd>View in SublimeServer</kbd>, not <kbd>View This File in the Browser</kbd> .

<a id="175"></a>
## 175

Transmit Dosksend [only for Sublime Text 2 and OSX](https://packagecontrol.io/packages/Transmit%20Docksend) .

<a id="176"></a>
## 176

Bower need [Git](https://github.com/benschwarz/sublime-bower#installation) for Windows users.

<a id="180"></a>
## 180

«mode at a language»

<a id="180-1"></a>
## 180

> You can also turn on Vintage mode at a langauge level by adding <dfn>"ignored_packages": []</dfn>to your language specific settings file — more on this in the settings section.
Where is settings section?

<a id="183"></a>
## 183

Package CSS3 Syntax has been replaced by [CSS3](https://github.com/y0ssar1an/CSS3_Syntax#announcement-for-st3-users-this-package-has-been-replaced-by-css3-this-package-will-be-removed-some-time-after-sublime-text-3-is-released) .

<a id="189"></a>
## 189

Pretty JSON [does not work](https://github.com/dzhibas/SublimePrettyJson/issues/70) with files that contain comments. This is a serious drawback, in my opinion it is necessary to mention in the book.

<a id="197"></a>
## 197

By default in TOC will be <dfn>[about]</dfn> and <dfn>[growing-up]</dfn>, not <dfn>(#about)</dfn> and <dfn>(#growing-up)</dfn>, see gif:

![Alt attribute fish](https://packagecontrol.io/readmes/img/b64bfa89d42bf72a062e070872a03f6832d62ae5.gif)

To make as at you on the picture, it is necessary to add in the file <kbd>MarkdownTOC</kbd> → <kbd>Settings - User</kbd> line <dfn>{ "default_bracket": "round", }</dfn> .

<a id="198"></a>
## 198

SublimeTODO plugin wasn't updated long ago, TODO Review is [recommended](https://github.com/robcowie/SublimeTODO) to use.

<a id="200"></a>
## 200

> If the language supports block commenting, add in <kbd>option/alt</kbd>into the mix to block comment multiple lines of selected code.

Multi-line comments are added to the Windows hotkey <kbd>Ctrl+Shift+/</kbd>, <kbd>Alt</kbd> is not used.

<a id="201"></a>
## 201

You have not written, how to call Fullscreen Mode, in my opinion, you need to specify the hot keys — <kbd>Shift+F11</kbd>.
