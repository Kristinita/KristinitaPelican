/* jshint maxlen: false */
module.exports = function(options) {
    options = options || {};
    options.doctype = options.doctype;

    var DOCTYPE = {
        'HTML 5': {
                doctype: '!DOCTYPE html',
                closingSingleTag: ''
            },
        'HTML 4.01 Strict': {
                doctype: '!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"',
                closingSingleTag: 'slash'
            },
        'HTML 4.01 Transitional': {
                doctype: '!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"',
                closingSingleTag: 'slash'
            },
        'HTML 4.01 Frameset': {
                doctype: '!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd"',
                closingSingleTag: 'slash'
            },
        'XHTML 1.0 Strict': {
                doctype: '!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"',
                closingSingleTag: 'slash'
            },
        'XHTML 1.0 Transitional': {
                doctype: '!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"',
                closingSingleTag: 'slash'
            },
        'XHTML 1.0 Frameset': {
                doctype: '!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd"',
                closingSingleTag: 'slash'
            },
        'XHTML 1.1': {
                doctype: '!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"',
                closingSingleTag: 'slash'
            }
    };

    return function posthtmlDoctype(tree) {
        var hasDoctype = 0;

        tree.walk(function(node) {
            if ( typeof node === 'string' && (/!doctype/i.test(node))) {
                hasDoctype = 1;

                if (options.doctype && getDoctypeOptions(options.doctype)) {
                    return setDoctype(options.doctype, tree.options);
                }
            }
            return node;
        });

        if (options.doctype && !hasDoctype) {
            tree.unshift(setDoctype(options.doctype, tree.options) + '\n');
        }

        return tree;
    };

    function setDoctype(doctype, options) {
        var doc = getDoctypeOptions(doctype);
        !!doc.closingSingleTag && (options.closingSingleTag = doc.closingSingleTag);
        return '<' + getDoctypeOptions(doctype).doctype + '>';
    }

    function getDoctypeOptions(doctype) {
        var expr = new RegExp(doctype, 'i');
        for (var key in DOCTYPE) {
            if (expr.test(key)) {
                return DOCTYPE[key];
            }
        }
        return false;
    }
};
