# mime-content

A node.js module for parsing strings based on MIME Type.

[![Build Status](https://travis-ci.org/activeprospect/node-mime-content.png?branch=master)](https://travis-ci.org/activeprospect/node-mime-content)

## Usage

This module supports parsing strings for a small handful of common MIME Types. Pull requests for adding additional types
are welcome.


### HTML

After parsing a HTML string, CSS selectors can be used to query the parsed content. The [cheerio](https://github.com/MatthewMueller/cheerio) module
is used to query the DOM. Selectors supported by JQuery can be used.

Use the `toString()` function to retrieve the un-parsed content.

```javascript
var content = require('mime-content');

var html = content('<html><body><h1 class="big">Header!</h1></body></html>', 'text/html');

html('h1.big').text();
=> 'Header!'
```


### JSON

After parsing a JSON string, a regular object is returned. Use the `toString()` function on that object to retrieve
the un-parsed content.

```javascript
var content = require('mime-content');

var json = content('{"foo":"bar"}', 'application/json');

json.foo
=> 'bar'
```


### XML

Both the application/xml and text/xml MIME Types are supported.

After parsing a XML string, the [xmldom](https://github.com/xmldom/xmldom) document is available. Also, XPath support is
provided by the [xpath](https://github.com/goto100/xpath) module. All DOM 3 [XPath expressions](http://www.w3.org/TR/xpath/#section-Expressions)
are supported.

By default, the XML parser assumes your XPath expression is looking for a single DOM node so it returns the first match
in the document. If you'd like all matching nodes instead, use the second optional boolean parameter with your query. Pass
`true` to return all matching nodes.


```javascript
var content = require('mime-content');

var xml = content('<people><person id="123"><name>Bob Smith</name></person><person id="456"><name>Jimmy Dean</name></person></people>', 'text/xml');

xml.xpath('/people/person/name/text()').data;
=> 'Bob Smith'

xml.xpath('/people/person/name/text()', true).map(function(text) {
  return text.data;
});
=> ['Bob Smith', 'Jimmy Dean']

xml.xpath('/people/person/@id', true).map(function(attr) {
  return attr.value;
});
=> ['123', '456']
```


The `toObject()` function uses [xml2js](https://github.com/Leonidas-from-XIV/node-xml2js) to return an object representation
of the XML. This function accepts an options object that is passed directly to the xml2js Parser. See the xml2js Readme for
the supported options.

```javascript
var xml = content('<people><person id="123"><name>Bob Smith</name></person><person id="456"><name>Jimmy Dean</name></person></people>', 'text/xml');
xml.toObject({explicitArray: false, explicitRoot: false, mergeAttrs: true});
=>
{
  person: [
    { id: '123', name: 'Bob Smith' },
    { id: '456', name: 'Jimmy Dean' }
  ]
}
```


### URL Encoding

After parsing a `application/x-www-form-urlencoded` string, a regular object is returned.

```javascript
var content = require('mime-content');

var qs = content('foo=bar&foo=baz&baz=bip', 'application/x-www-form-urlencoded');

qs.foo
=> ['bar', 'baz']

qs.baz
=> 'bip'
```
