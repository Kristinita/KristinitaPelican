################
# Clipboard.js #
################
###
[OVERVIEW] Copy text by click without Flash:
https://clipboardjs.com/
###


###############
# balloon.css #
###############
###
[OVERVIEW] Tooltips without JavaScript:
https://kazzkiq.github.io/balloon.css/

[NOTE] Sticky hover problem:
https://github.com/kazzkiq/balloon.css/issues/152
###


###
[INFO] Activate Clipboard.js for all elements with “.SashaClipboardButton” class:
https://stackoverflow.com/a/33758435/5951529

[LEARN][COFFEESCRIPT] JsDoc in CoffeeScript:
https://stackoverflow.com/a/24348892/5951529

[LEARN][CLOSURE] Any function with “new” keyword must have “@constructor” word:
https://github.com/google/closure-compiler/wiki/Annotating-JavaScript-for-the-Closure-Compiler#constructor
https://stackoverflow.com/a/5301591/5951529

@constructor

[INFO] For better web performance purposes I use Pygments instead of Rainbow.js
###
KiraCodeBlockClipboard = new Clipboard('.SashaClipboardButton', text: (trigger) ->
	$(trigger).closest('.SashaBlockHighlight').find('pre').text()
)


###
[INFO] Get lang attribute of “<html>” tag:
https://stackoverflow.com/a/5031545/5951529
https://stackoverflow.com/posts/comments/18461817
###
KiraWebPageLanguage = $('html').attr('lang')


###
[LEARN][JAVASCRIPT] “if/else”:
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else
https://www.w3schools.com/jsref/jsref_if.asp

[LEARN][COFFEESCRIPT] “if/else”:
https://riptutorial.com/coffeescript/example/15079/if--if---then--if---else--unless--ternary-operator
###
if KiraWebPageLanguage is 'ru'
	KiraBalloonCopyIt = 'Кликните, чтобы скопировать код'
	KiraBalloonCopied = 'Скопировано!'
	###
	[LEARN][COFFEESCRIPT] Heredoc multiline syntax:
	https://stackoverflow.com/a/19389237/5951529
	###
	KiraBalloonErrorMessage = '''Произошла ошибка при копировании.
		Пожалуйста, сообщите о ней разработчикам сайта.
		«OK» — написать сообщение об ошибке, «Cancel» — продолжить пользоваться сайтом.'''
else
	KiraBalloonCopyIt = 'Click to copy code to the clipboard'
	KiraBalloonCopied = 'Copied!'
	KiraBalloonErrorMessage = '''An error occurred while copying.
		Please, if possible, inform the site developers about it.
		“OK” — write an error message, “Cancel” — continue using the site.'''


###
[LEARN][JAVASCRIPT] Set attribute value for all elements with specific class:

https://stackoverflow.com/a/18455390/5951529
https://stackoverflow.com/a/18455368/5951529
###
$('.SashaClipboardButton').attr 'aria-label', KiraBalloonCopyIt


###
[INFO] Use balloon.css for class:
https://github.com/kazzkiq/balloon.css/issues/150#issuecomment-706774970
###
KiraBalloon = (KiraTooltip) ->
	KiraTooltip.removeAttribute 'class'
	KiraTooltip.setAttribute 'aria-label', KiraBalloonCopied
	KiraTooltip.setAttribute 'class', 'SashaBalloonAfterClick'
	setTimeout (->
		KiraTooltip.removeAttribute 'class'
		KiraTooltip.removeAttribute 'aria-label'
		KiraTooltip.setAttribute 'class', 'SashaClipboardButton'
		KiraTooltip.setAttribute 'aria-label', KiraBalloonCopyIt
	), 2000


###
[INFO] Run function after success and error Clipboard.js copy action:
https://clipboardjs.com/#events
###
KiraCodeBlockClipboard.on 'success', (KiraElement) ->
	console.info 'Action:', KiraElement.action
	console.info 'Text:', KiraElement.text
	console.info 'Trigger:', KiraElement.trigger
	###
	[EXAMPLE] Clipboard.js events:
	http://bit.ly/clipboardjs-events
	###
	KiraBalloon KiraElement.trigger
	KiraElement.clearSelection()

KiraCodeBlockClipboard.on 'error', (KiraElement) ->
	console.error 'Action:', KiraElement.action
	console.error 'Trigger:', KiraElement.trigger
	###
	[NOTE] Default “alert” doesn’t support links, use “window.confirm” instead:
	https://stackoverflow.com/a/26746479/5951529

	[REQUIRED] “if” statement

	[INFO] Open link in the new window:
	https://stackoverflow.com/a/62119507/5951529
	###
	if window.confirm(KiraBalloonErrorMessage)
		window.open 'https://github.com/Kristinita/KristinitaPelican/issues/new', '_blank'
