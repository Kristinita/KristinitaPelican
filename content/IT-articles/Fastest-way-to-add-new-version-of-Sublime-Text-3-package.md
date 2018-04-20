Title: Fastest way to add new version of your Sublime Text package
Version: 0.3.0
Author: Sasha Chernykh
Lang: en
Summary: Tutorial, how you can make release and changelog, use only one command <br><br> ![Package Control messages](https://i.imgur.com/J5AuHmX.png) <br><br> ![*CHANGELOG.md* and *messages.json*](https://i.imgur.com/12fFJsX.png) <br><br> ![*messages/&lt;version&gt;.txt* and *package.json*](https://i.imgur.com/kkKjiv5.png) <br><br> ![Releases page](https://i.imgur.com/FwPHBZS.png)
Pagetitle: Fastest way to add new version of your Sublime Text package
Metacontent: Tutorial, how you can make release and changelog, use one command
Pagecolors: it-articles
Asideimage: SashaGreenSweater
Iconleftorright: left
Tags: it-articles, sublime-text, release
Category: IT-articles
Noco: 1vWK5
Tooltipster: true
Clipboardjs: true
Opengraphimage: https://i.imgur.com/12fFJsX.png
Customjs: false
Customcss: false

<!-- MarkdownTOC -->

1. [Overview](#overview)
1. [Audience](#audience)
1. [Relevance](#relevance)
1. [Motivation](#motivation)
1. [Demonstration](#demonstration)
1. [Features](#features)
1. [Limitations](#limitations)
1. [Installation](#installation)
1. [Activation](#activation)
	1. [GitHub token](#github-token)
	1. [Upstream branch](#upstream-branch)
	1. [CHANGELOG.md](#changelogmd)
	1. [package.json](#packagejson)
	1. [.release-it.json](#release-itjson)
	1. [messages.json](#messagesjson)
1. [Usage](#usage)
1. [Details](#details)
	1. [release-it command](#release-it-command)
	1. [.release-it.json](#release-itjson-1)
		1. [buildCommand](#buildcommand)
		1. [Another lines](#another-lines)
1. [Problems and non-fixed bugs](#problems-and-non-fixed-bugs)
1. [Testing environment](#testing-environment)

<!-- /MarkdownTOC -->

<a id="overview"></a>
# Overview

Tutorial, how you can quick to create detailed release and changelog for your Sublime Text package.

<a id="audience"></a>
# Audience

Inexperienced developers of Sublime Text 3 packages.

This article may be useful for any non-Sublime Text developers, which makes releases and changelog.

<a id="relevance"></a>
# Relevance

This article is relevant for April 2018. In the future, the data in this article may be obsolete.

<a id="motivation"></a>
# Motivation

When I create new release for my Sublime Text package, I need:

1. Add changelog to [GitHub release page](https://github.com/Kristinita/SashaSublime/releases),
1. Update *CHANGELOG.md*,
1. [Update version in *messages.json*](https://packagecontrol.io/docs/messaging),
1. Add changelog to *messages/&lt;version&gt;.txt* file,

It may take a lot of time.

In this article I wrote, how possible to make all these actions use only one command in command line.

<a id="demonstration"></a>
# Demonstration

I [push commit](https://github.com/Kristinita/SashaSublime/commit/40783aee5a678d62f4e703248c277c725246f1ea) to my GitHub repository → I enter in command line:

```bash
release-it -n -V
```

Result: [1](https://github.com/Kristinita/SashaSublime/commit/b6bbf815fc4e59eff72c99e454898ec92d021990), [2](https://github.com/Kristinita/SashaSublime/releases).

*CHANGELOG.md* and *messages.json*:

![*CHANGELOG.md* and *messages.json*](https://i.imgur.com/12fFJsX.png)

*messages/&lt;version&gt;.txt* and *package.json*:

![*messages/&lt;version&gt;.txt* and *package.json*](https://i.imgur.com/kkKjiv5.png)

[Releases page](https://github.com/Kristinita/SashaSublime/releases):

![Releases page](https://i.imgur.com/FwPHBZS.png)

If you want to have same behavior, read on.

<a id="features"></a>
# Features

Tutorial of this article must be support:

1. cross-platform,
1. [Semver](https://semver.org/) [major](https://semver.org/#spec-item-8), [minor](https://semver.org/#spec-item-7), [patch](https://semver.org/#spec-item-6) and custom tags.

<a id="limitations"></a>
# Limitations

1. Your must host your package to GitHub. If your package on BitBucket, GitLab or another hosting, you can't make a release via [release-it](https://github.com/webpro/release-it).
1. Your commits must be must be compatible with [Conventional Commits](https://conventionalcommits.org/). [List of supported scopes](https://conventionalcommits.org/). I recommend use [commitizen](https://www.npmjs.com/package/commitizen).

<a id="installation"></a>
# Installation

You need to install:

1. Node.js and npm, if no;
1. git if no, even if you use another VCS;
1. UNIX commands *tee*, *cat*, *mv* and *sed*, if no; for Windows users I recommend install [Cygwin](https://chocolatey.org/packages/Cygwin) and [add to your *Path* environment variable value — path to Cygwin commands folder](https://lifehacker.com/362316/use-unix-commands-in-windows-built-in-command-prompt);
1. [release-it globally](https://www.npmjs.com/package/release-it#global) [≥ 7.3.0](https://github.com/webpro/release-it/issues/233);
1. [generate-changelog globally](https://www.npmjs.com/package/generate-changelog#installation);
1. [npm js-beautify globally](https://www.npmjs.com/package/js-beautify).

<a id="activation"></a>
# Activation

You need to create all files from this section in root folder of your package repository.

You can see configuration files of real package in [SashaSublime repository](https://github.com/Kristinita/SashaSublime).

!!! caution
	I recommend in first do actions from [Activation](#activation) and [Usage](#usage) sections in the test repository, not real. Argumentation:

	+ You or I can make a typo(s);
	+ Differences in my and your environments;
	+ Different versions of tools from this article can do another behavior, [example](https://github.com/webpro/release-it/issues/233)

<a id="github-token"></a>
## GitHub token

[Get your GitHub token and add environment variable with value — your token](https://www.npmjs.com/package/release-it#%EF%B8%8F-github-release).

You need to select all *repo* scopes.

![GitHub token](https://i.imgur.com/sWfide5.png)

<a id="upstream-branch"></a>
## Upstream branch

You need to [set upstream branch](https://stackoverflow.com/a/6089415/5951529):

```bash
git checkout yourbranch
git branch --set-upstream
```

+ *yourbranch* — name of branch, which you want to do upstream. Please, change *yourbranch* to real branch name.

<a id="changelogmd"></a>
## CHANGELOG.md

Create blank file *CHANGELOG.md*. If no, generate-changelog will works incorrect.

<a id="packagejson"></a>
## package.json

```json
{
	"name": "SashaSublime",
	"version": "4.14.7",
	"scripts": {
	"release": "release-it"
	}
}
```

+ *SashaSublime* — name of your package,
+ *4.14.7* — previous version of your package. Use *0.0.0*, if you add first release for your package.

Replace *SashaSublime* and *4.14.7* to your real values.

<a id="release-itjson"></a>
## .release-it.json

```json
{
	"buildCommand": "changelog -f - -u https:\/\/${repo.host}\/${repo.repository} | tee messages\/${version}.txt | cat - CHANGELOG.md > temp && mv temp CHANGELOG.md && sed -i '\/\\\"install\\\": \\\"messages\\\/install\\.txt\\\"\/i\\\"${version}\\\": \\\"messages\\\/${version}\\.txt\\\",' messages.json && js-beautify -r messages.json",
	"changelogCommand": "changelog -f -",
	"github": {
		"release": true,
		"tokenRef": "GITHUB_TOKEN"
	},
	"npm": {
		"publish": false
	},
	"safeBump": false,
	"src": {
		"addUntrackedFiles": true,
		"tagName": "st3-%s"
	}
}
```

!!! hint
	Pay attention to slashes escaping. To convert terminal command to JSON I recommend to use [freeformatter.com service](https://www.freeformatter.com/json-escape.html#ad-output). For example:

	```bash
	sed -i '/\"install\"\: \"messages\/install\.txt\"/i\"4\.14\.7\"\: \"messages\/4\.14\.7\.txt\",' messages.json
	```

	will convert to:

	```json
	sed -i '\/\\\"install\\\": \\\"messages\\\/install\\.txt\\\"\/i\\\"${version}\\\": \\\"messages\\\/${version}\\.txt\\\",' messages.json
	```

<a id="messagesjson"></a>
## messages.json

```json
{
	"install": "messages/install.txt"
}
```

<a id="usage"></a>
# Usage

Add, commit and push your changes to remote GitHub repository. Example:

```bat
# Make any changes
D:\SashaSublime>git add .

# I use commitizen instead of git commit
D:\SashaSublime>git cz
cz-cli@2.9.6, cz-conventional-changelog@1.2.0


Line 1 will be cropped at 100 characters. All other lines will be wrapped after 100 characters.

? Select the type of change that you're committing: build:     Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
? Denote the scope of this change ($location, $browser, $compile, etc.):
release-it
? Write a short, imperative tense description of the change:
Fix .release-it.json
? Provide a longer description of the change:
Add to .release-it.json URL of SashaSublime repository
? List any breaking changes or issues closed by this change:

[SashaDevelop 52e517a] build(release-it): Fix .release-it.json
1 file changed, 2 insertions(+), 1 deletion(-)

D:\SashaSublime>git push
Counting objects: 3, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 735 bytes | 183.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/Kristinita/SashaSublime.git
	0360628..52e517a  SashaDevelop -> SashaDevelop
```

Now run [one of command](https://www.npmjs.com/package/release-it#%EF%B8%8F-usage):

+ *release-it -n -V* or *release-it patch -n -V* — for release patch version;
+ *release-it --minor -n -V* — for release minor version;
+ *release-it --major -n -V* — for release major version;
+ *release-it 4.14.7 -n -V* — for release custom version; *4.14.7* in example.

Also you can [create pre-releases](https://www.npmjs.com/package/release-it).

Example result see in [demonstration](#demonstration) section.

<a id="details"></a>
# Details

If you want to know, how files and commands works, please, read this section.

<a id="release-it-command"></a>
## release-it command

```bash
release-it -n -V
```

+ *-n* — [non-interactive mode](https://www.npmjs.com/package/release-it#-interactive-vs-non-interactive-mode). That you don't need input values each time manually.
+ *-V* — verbose. You can disable this command-line argument, but if you will get a bug, this argument may help you.

<a id="release-itjson-1"></a>
## .release-it.json

<a id="buildcommand"></a>
### buildCommand

+ *changelog -f -* — generate changelog. *-* — argument, that changelog [stdout to console](https://unix.stackexchange.com/a/419416/237999),
+ `-u https:\/\/${repo.host}\/${repo.repository}` — support URL's in changelog, that the user can quick go to the commit link. `${repo.host}` — github.com. `${repo.repository}` — `<your username>/<your repository>`, `Kristinita/SashaSublime` for my example.

	Example:

	+ if `-u https:\/\/${repo.host}\/${repo.repository}`, changelog generate `#!md ([40783aee](https://github.com/Kristinita/SashaSublime/commit/40783aee5a678d62f4e703248c277c725246f1ea))`,
	+ if no `-u https:\/\/${repo.host}\/${repo.repository}`, changelog generate `(40783aee)`.

+ `#!json tee messages\/${version}.txt` — output changelog to *messages/&lt;your new release&gt;.txt* file. File *&lt;your new release&gt;.txt* will create automatically. See [description of *tee* command](https://www.computerhope.com/unix/utee.htm).
+ `#!bash cat - CHANGELOG.md > temp && mv temp CHANGELOG.md` — [append changelog at beginning](https://superuser.com/a/246841/572069) of *CHANGELOG.md* file. *CHANGELOG.md* do not overwrite.
+ `#!json sed -i '\/\\\"install\\\": \\\"messages\\\/install\\.txt\\\"\/i\\\"${version}\\\": \\\"messages\\\/${version}\\.txt\\\",' messages.json` — [add](https://stackoverflow.com/a/11695098/5951529) `#!json "<your version>": "messages/<your version>.txt",` line before `#!json "install": "messages/install.txt"` line.
+ `js-beautify -r messages.json` — [beautify *messages.json* file in-place](https://www.npmjs.com/package/js-beautify#options)

<a id="another-lines"></a>
### Another lines

+ *changelogCommand* — command, that generate changelog to `https://github.com/<your username>/<your repository>/releases`. Command must stdout to console.
+ `#!json "release": true,` — [post changelog](https://www.npmjs.com/package/release-it#%EF%B8%8F-configuration) to `https://github.com/<your username>/<your repository>/releases`.
+ *GITHUB_TOKEN* — your [*GITHUB_TOKEN* environment variable](#github-token),
+ `#!json "npm": {"publish": false},` — don't publish release to [npm](https://www.npmjs.com/). We are writing Sublime Text package, not npm modules, so needs this parameter.
+ `#!json "safeBump": false,` — that correct version in `https://github.com/<your username>/<your repository>/releases`; see [issue](https://github.com/webpro/release-it/issues/218) for details.
+ `#!json "addUntrackedFiles": true,` — add [untracked file](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository) *messages/&lt;version&gt;.txt* [to release commit](https://github.com/webpro/release-it/issues/233).
+ `#!json "tagName": "st3-%s"` — [correct tag name](https://github.com/wbond/package_control/issues/1217#issuecomment-280041797) for Package Control. Tags for Sublime Text 3 must be in *st3-&lt;your version&gt;* format, for example — *st3-4.14.7*.

<a id="problems-and-non-fixed-bugs"></a>
# Problems and non-fixed bugs

1. [You can't use](https://github.com/lob/generate-changelog/issues/37) [cz-emoji](https://github.com/ngryman/cz-emoji) for commit generation. Changelog will blank.
1. release-it [can works incorrect](https://github.com/webpro/release-it/issues/218) in *--dry-run* mode.
1. [You can have bugs](https://github.com/webpro/release-it/issues/213), if you want to use *\${changelog}* release-it variable.

<a id="testing-environment"></a>
# Testing environment

+ Windows 10 Enterprise LTSB 64-bit EN,
+ Node.js 9.4.0,
+ git 2.16.0.windows.2,
+ release-it 7.3.0,
+ changelog 1.7.0,
+ tee (GNU coreutils) 8.26, packaged by Cygwin (8.26-1),
+ cat (GNU coreutils) 8.26, packaged by Cygwin (8.26-1),
+ mv (GNU coreutils) 8.26, packaged by Cygwin (8.26-1),
+ sed (GNU sed) 4.2.2,
+ js-beautify 1.7.5.
