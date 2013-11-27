xpath = require 'xpath'
xmldom = require 'xmldom'
xml2js = require 'xml2js'


parse = (content) ->
  doc = new xmldom.DOMParser().parseFromString(content)
  doc.xpath = (selector, multi) ->
    multi ?= false
    xpath.select(selector, doc, !multi)
  doc.toObject = (options = {}) ->
    options.async = false
    parser = new xml2js.Parser(options);
    rtn = null
    parser.parseString content, (err, result) ->
      throw err if (err)
      rtn = result
    rtn
  doc

module.exports = parse