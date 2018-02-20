# PostHTML-doctype
[![npm version](https://badge.fury.io/js/posthtml-doctype.svg)](http://badge.fury.io/js/posthtml-doctype)

[PostHTML](http://github.com/posthtml/posthtml) plugin to simplify working with doctype.

## Usage

```js
var posthtml = require('posthtml'),
    html = '<html><head><title>Wow</title></head><body><div class="button"><div class="button__text">Text</div></div></body></html>';

posthtml()
    .use(require('posthtml-doctype')({ doctype: 'HTML 5' }))
    .process(html)
    .then(function(result) {
        console.log(result.html);
        //<!DOCTYPE html><html><head><title>Wow</title></head><body><div class="button"><div class="button__text">Text</div></div></body></html>
    })
```

## Options 

###### { doctype : 'HTML 5' }
```html
<!DOCTYPE html>
```

###### { doctype : 'HTML 4.01 Strict' }
```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
```

###### { doctype : 'HTML 4.01 Transitional' }
```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
```

###### { doctype : 'HTML 4.01 Frameset' }
```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
```

###### { doctype : 'XHTML 1.0 Strict' }
```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
```

###### { doctype : 'XHTML 1.0 Transitional' }
```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
```

###### { doctype : 'XHTML 1.0 Frameset' }
```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
```

###### { doctype : 'XHTML 1.1' }
```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
```
